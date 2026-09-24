# Push Notifications

Two halves: (A) the Flutter client — mobile repo `C:\UNETPROJECTS\MOBILE_APPS\elite_mobile`, phase M7;
(B) the backend — backend repo `C:\UNET\APP_BACKEND\elite`, phase B7. This file is identical in both repos.

## A. Flutter client

### Setup
Development starts on Windows, so do **Android first** (steps 1 and 3). Step 2 (iOS) is done later on the
Mac; see the mobile repo's `docs/IOS_HANDOFF.md` §4. Code must still handle iOS (permission request, APNs token wait) so nothing
needs rewriting later.

1. Frankie creates a Firebase project and provides `google-services.json` (Android) and
   `GoogleService-Info.plist` (iOS). Use `flutterfire configure` to generate `firebase_options.dart`.
2. iOS: enable Push Notifications + Background Modes (remote notifications) capabilities; upload the
   APNs auth key (.p8) to Firebase. Frankie needs an Apple Developer account for this.
3. Android 13+: request `POST_NOTIFICATIONS` at runtime — ask **after** login with a short in-app
   primer explaining the value ("Get alerted when an ATM goes offline or runs out of cash").

### Behaviour
- On login (and on `onTokenRefresh`): get FCM token → `POST /devices` with preferences. Failures are
  retried on next launch; never block login.
- Preferences screen → `PUT /devices/{token}/preferences`.
- On logout: `DELETE /devices/{token}`, then delete the FCM token.
- No FCM topics: targeting is done server-side per device so scope is always respected.
- Android notification channels (importance): `critical_alerts` (high: offline, cash jam, no cash),
  `warnings` (default: low cash, supervisor, closed), `summaries` (low).
- Foreground messages: show via `flutter_local_notifications` + in-app banner; add to inbox.
- Tap (terminated/background/foreground) → parse `data.route` and navigate
  (`/terminal/:id`, `/terminals?filter=<v1 filter key>` e.g. `offline`, `no_cash`, `online`, `/dashboard`,
  `/notifications`).
- Every received notification is saved to the local inbox (max 200, oldest pruned).

### Payload contract (data message)
```json
{
  "notification": { "title": "ATM Offline", "body": "10441234 · Ikeja Allen is offline since 10:42" },
  "data": {
    "type": "offline | cash_jam | no_cash | low_cash | supervisor | closed | back_in_service | daily_summary",
    "terminal_id": "10441234",
    "location": "Ikeja Allen",
    "region": "South West",
    "severity": "critical | warning | info",
    "route": "/terminal/10441234 | /terminals?filter=offline | /dashboard | /notifications",
    "timestamp": "2026-09-24T10:42:00+01:00"
  }
}
```
All `data` values are strings (FCM requirement). `terminal_id`/`location` are empty strings for grouped
alerts and daily summaries; `region` is empty when a grouped alert spans several regions.

### Interim mode (before Firebase is configured)
Foreground change detection during auto-refresh (mobile FEATURES §8). Label it clearly in settings.

## B. Backend (backend repo, phase B7)

Tables (T-SQL migration `0003`, see the backend repo's `docs/ARCHITECTURE.md` §5): `app_device_tokens`,
`app_alert_state`, `app_notification_log`. Endpoints: `POST /devices`, `DELETE /devices/{token}`,
`PUT /devices/{token}/preferences`, `GET /notifications` (API_CONTRACT §3).

### Alert job — `php bin/elite alerts:run`
Scheduled every 2–5 min (cron on Linux, Task Scheduler on Windows servers).
1. Load current state of all monitored terminals (`gua_atmmonitoring`, `term_status = 1`,
   `allowed = 'yes'`) and classify status / cash band / cash jam.
2. Compare with `app_alert_state`; on first run just seed the state (no alerts).
3. Transitions → `AlertEvent`:

| Type | Trigger | Severity | Android channel |
|---|---|---|---|
| `offline` | status → OFFLINE | critical | `critical_alerts` |
| `back_in_service` | OFFLINE/CLOSE/SUPERVISOR → ACTIVE | info | `summaries` |
| `cash_jam` | cash jam started | critical | `critical_alerts` |
| `no_cash` | cash band → no_cash | critical | `critical_alerts` |
| `low_cash` | cash band → low | warning | `warnings` |
| `supervisor` | status → SUPERVISOR | warning | `warnings` |
| `closed` | status → CLOSE | warning | `warnings` |

4. Recipients: devices whose user's scope (re-read from `gua_users`, skip locked/unapproved users)
   includes the terminal, whose preferences enable the category and region, and not in quiet hours
   (critical alerts may bypass quiet hours only if the user enabled that).
5. Debounce: skip if the same terminal + type was sent to that user in the last 30 min. If one run
   produces more than 10 events of the same type for a user, send one grouped notification instead
   ("12 ATMs went offline in South West").
6. Send via FCM HTTP v1 (`https://fcm.googleapis.com/v1/projects/{project}/messages:send`) with a
   service-account OAuth token (cached until expiry). Delete tokens that return `UNREGISTERED` /
   `INVALID_ARGUMENT` for the token.
7. Log each send in `app_notification_log`; update `app_alert_state`.

Notification texts (title / body):

| Case | Title | Body | `data.route` |
|---|---|---|---|
| one terminal | `ATM Offline`, `Cash jam`, `ATM out of cash`, `Low cash`, … | `90000001 · Ikeja is offline since 10:42`, `… is low on cash (₦150,000)` | `/terminal/{id}` |
| grouped (> 10 of one type for a user in one run) | `12 ATMs went offline` | `12 ATMs went offline in South West` (or `in your scope`) | `/terminals?filter=offline` (`back_in_service` → `online`) |
| daily summary | `Elite daily summary · 120 ATMs` | `In service 91.7% · 6 offline · 2 no cash · uptime yesterday 97.4%` | `/dashboard` |

Each notification is logged once per user in `app_notification_log` with `delivery` = `sent` (FCM accepted
it for at least one device), `logged` (NullPushSender — Firebase not configured) or `failed`. Terminals
added since the previous run are remembered silently; a terminal that stays offline is not re-alerted
(alerts fire on transitions only), and the 30-min debounce stops flapping terminals from spamming.

`php bin/elite alerts:daily-summary` at 08:00 WAT: per user with at least one device that has
`daily_summary` on and is not in quiet hours: a summary of their scope (in service %, offline count,
no-cash count, average uptime yesterday). Sent at most once per user per 20 h, so a re-run is harmless.

Both commands print a one-line result; `alerts:run` holds a lock (`var/alerts.lock`) so overlapping runs
exit immediately.

### Scheduling (Windows Task Scheduler)
Run with the PHP that has `pdo_sqlsrv`, working directory = the installed `private` folder (e.g.
`C:\UNET\UNETAPPS\elite\mobile\api\private` on staging). PowerShell as an administrator on the server:
```powershell
$php = 'C:\phpnts\php-8.3.21\php.exe'; $dir = 'C:\UNET\UNETAPPS\elite\mobile\api\private'
$every3 = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 3)
Register-ScheduledTask -TaskName 'Elite alerts' -Trigger $every3 -Action (New-ScheduledTaskAction -Execute $php -Argument 'bin/elite alerts:run' -WorkingDirectory $dir)
Register-ScheduledTask -TaskName 'Elite daily summary' -Trigger (New-ScheduledTaskTrigger -Daily -At 08:00) -Action (New-ScheduledTaskAction -Execute $php -Argument 'bin/elite alerts:daily-summary' -WorkingDirectory $dir)
```
On Linux: `*/3 * * * * cd /path/to/elite && php bin/elite alerts:run` and
`0 8 * * * cd /path/to/elite && php bin/elite alerts:daily-summary` (server timezone WAT, or adjust).

### Credentials
Firebase service-account JSON lives outside the web root (`FCM_CREDENTIALS_PATH`), never in Git; set
`FCM_PROJECT_ID` too. Real sending starts only when both are set and the file is readable. Until
it exists, the `NullPushSender` logs what would be sent so the job is fully testable.
**[BANK]** Production server needs outbound HTTPS to `fcm.googleapis.com` and `oauth2.googleapis.com`.
