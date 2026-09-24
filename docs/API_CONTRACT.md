# API Contract — Elite API v1

Source of truth for both projects. **Canonical copy: backend repo** (`C:\UNET\APP_BACKEND\elite\docs\API_CONTRACT.md`)
with a matching `openapi.yaml` (OpenAPI 3.1) at the backend repo root. The mobile repo holds synced copies
in its `docs\` (via `tool/sync_contract.dart`) and never edits them. Change this doc first, then code.

- Base path: `/api/v1`, installed in the portal's `/mobile` folder. Base URLs are in §0.
- JSON in, JSON out (`Content-Type: application/json; charset=utf-8`). UTF-8 everywhere.
- Auth: `Authorization: Bearer <access_token>` on every endpoint except `POST /auth/login`,
  `GET /health`, `GET /config`.
- Timestamps: ISO 8601 with offset, Africa/Lagos (e.g. `2026-09-24T10:42:00+01:00`). Dates: `YYYY-MM-DD`.
- Numbers are JSON numbers (never `"45%"`). Percentages are 0–100 with 2 decimals. Money is Naira as a
  number (e.g. `2450000.00`). Unknown values are `null`, not empty strings.
- `snake_case` keys.

## 0. Environments (base URLs and TLS)

| Env | Base URL | Certificate | Used by |
|---|---|---|---|
| local | `http://localhost:8080/api/v1` | none (HTTP) | Backend development only |
| **staging** | `https://elite.unetapps.com/mobile/api/v1` | mkcert (private CA, Frankie's PC) | Debug and staging builds |
| production | Frankie provides it before the store build (same path `/mobile/api/v1`) | Bank's public CA | Release builds only |

The app picks the base URL at build time (`--dart-define=ENV=staging|production` or flavors), never at
runtime from user input. Development tools never call production.

**Staging from a phone or emulator.** Two problems, solved only in staging builds:
1. **Trust.** The staging certificate is valid for `*.unetapps.com` but signed by Frankie's local mkcert
   CA, which phones don't trust. Dart's HTTP client on Android also ignores CAs the user installs on the
   device. Bundle the mkcert **public** root certificate (`rootCA.pem`) as a staging-only asset (e.g.
   `assets/certs/staging_ca.pem`, excluded from production builds) and trust it in addition to the system
   roots:
   ```dart
   final ctx = SecurityContext(withTrustedRoots: true)
     ..setTrustedCertificatesBytes((await rootBundle.load('assets/certs/staging_ca.pem')).buffer.asUint8List());
   final http = HttpClient(context: ctx);   // use through IOClient / Dio's IOHttpClientAdapter
   ```
   Hostname and certificate checks stay on. **Never** use `badCertificateCallback => true`, never disable
   verification, and never ship `rootCA-key.pem` or the staging CA in a production build. iOS: the same
   code works. Alternatively, install the mkcert CA profile on the device and turn on full trust
   (*Settings → General → About → Certificate Trust Settings*).
2. **Name resolution.** `elite.unetapps.com` resolves only on Frankie's PC (hosts file). Staging builds
   take `--dart-define=STAGING_HOST_IP=<PC LAN IP>` (Android emulator: `10.0.2.2`). They connect the socket
   to that IP while TLS still uses the hostname, so the certificate is checked against `elite.unetapps.com`:
   ```dart
   http.connectionFactory = (uri, _, __) async {
     final task = await Socket.startConnect(stagingHostIp, uri.port);
     return ConnectionTask.fromSocket(
       task.socket.then((s) => SecureSocket.secure(s, host: uri.host, context: ctx)), task.cancel);
   };
   ```
   Without `STAGING_HOST_IP`, the normal DNS lookup is used (e.g. if a DNS record is added later).

Production builds contain none of this: default `SecurityContext`, normal DNS, the bank's certificate.

## 1. Envelope

Success:
```json
{ "success": true, "data": { }, "meta": { } }
```
`meta` only on paginated lists:
```json
"meta": { "page": 1, "per_page": 20, "total": 312, "total_pages": 16 }
```

Error (with matching HTTP status):
```json
{ "success": false, "error": { "code": "VALIDATION_FAILED", "message": "Human readable", "details": { "field": ["reason"] } } }
```

| HTTP | `code` | When |
|---|---|---|
| 400 | `BAD_REQUEST` | malformed JSON |
| 401 | `UNAUTHENTICATED` | missing/invalid token |
| 401 | `SESSION_EXPIRED` | token expired or revoked |
| 401 | `INVALID_CREDENTIALS` | login failed |
| 403 | `ACCOUNT_NOT_CREATED` | AD user has no Elite account |
| 403 | `ACCOUNT_NOT_APPROVED` | `activated != 'Yes'` |
| 403 | `ACCOUNT_LOCKED` | `astatus != 'Opened'` |
| 403 | `FORBIDDEN_SCOPE` | requested region/terminal outside the user's scope |
| 404 | `NOT_FOUND` | resource missing (or outside scope for terminal lookups: use 404, don't leak existence) |
| 422 | `VALIDATION_FAILED` | bad params (`details` per field) |
| 426 | `UPGRADE_REQUIRED` | app version below `min_app_version` (header `X-App-Version`) |
| 429 | `RATE_LIMITED` | too many login attempts (`Retry-After` header) |
| 500 | `SERVER_ERROR` | unexpected; never leak SQL/stack traces |
| 503 | `SERVICE_UNAVAILABLE` | DB or AD unreachable |

Clients send `X-App-Version: 1.0.0` and `X-Platform: android|ios` on every request.

## 2. Shared objects

### User
```json
{ "id": "12", "username": "john.doe", "display_name": "john doe", "email": "john.doe@…", "phone": null,
  "avatar_url": null, "role": "Admin" }
```

### Scope
```json
{ "regions": ["All"], "states": ["All"], "atms": ["All"] }
```
`["All"]` = unrestricted for that dimension. Scope always comes from the server session, never from the
client.

### Terminal
```json
{
  "terminal_id": "10441234",
  "location": "IKEJA ALLEN",
  "status": "OFFLINE",                // ACTIVE | OFFLINE | CLOSE | SUPERVISOR | UNKNOWN
  "amount": 2450000.00,               // null if unknown
  "cash_band": "moderate",            // no_cash | low | moderate | high | abnormal | unknown
  "location_type": "BRANCH ATM",      // legacy "type"; e.g. BRANCH ATM, OFFSITE, BRANCH ATM/RESTRICTED
  "brand": "NCR-S2",                  // legacy "brand" (DB column `type`)
  "state": "Lagos",
  "region": "South West",
  "sol_id": "001",
  "last_txn_at": "2026-09-24T08:15:00+01:00",   // null if unknown/unparseable
  "card_reader": "Card Reader OK",
  "cash_jam": "No Cash Jams",         // raw monitoring text
  "has_cash_jam": false,
  "is_idle": false,
  "is_of_interest": true
}
```
- `has_cash_jam` = `cash_jam` is set and is not `No Cash Jams` (legacy monitoring rule). It is **true for
  both** `Cash Jam: Please clear cash ASAP` and `Possible Cash Jam: Suspect Not dispensing`; clients can tell
  them apart with the raw `cash_jam` text. (Performance statistics count only the exact
  `Cash Jam: Please clear cash ASAP` samples — also the legacy rule.)
- `cash_band`: `no_cash` = amount equals the no-cash threshold; `low`/`moderate`/`high` = inside those
  inclusive ranges (`GET /config`); `abnormal` = amount ≥ the dashboard's `abnormal_cash` (9,000,000 today;
  above the high range if not configured); `unknown` = null, negative, or in a gap between ranges. The
  dashboard's ranges touch (e.g. 500,000 is the top of low and the bottom of moderate): a terminal gets the
  **first** matching band (no cash → low → moderate → high), while dashboard counts use each inclusive
  range like legacy, so a boundary amount is counted in both bands.
- `is_idle` = the last transaction is more than `idle_days` calendar days ago (`DATEDIFF(DAY)` semantics).
  `idle_days` comes from the web dashboard's `idleconfig.json` (`idle_thresh`, 7 today) — legacy hard-coded 30
  (bug #17); see `GET /config`.
- Terminals with no region are never returned (legacy scope rule `region IS NOT NULL`).

### PerformanceStats
```json
{ "samples": 288, "uptime": 91.32, "downtime": 8.68, "offline": 5.21, "closed": 2.08, "cash_jam": 1.39, "no_data": false }
```
Definitions (same as legacy): over `gua_availability` samples for the period, `offline/closed/cash_jam`
= share of samples in that state; `downtime = offline + closed + cash_jam`; `uptime = 100 − downtime`.
**Change from legacy:** if `samples == 0`, all percentages are `null` and `no_data: true`.
Percentages are computed from the counts (not from legacy's pre-rounded parts) and `uptime` is clamped to
0–100 (a sample that is both OFFLINE and a cash jam is counted in both, as legacy does).

## 3. Endpoints

### Auth

**`POST /auth/login`**
```json
{ "username": "john.doe", "password": "…", "device": { "platform": "android", "app_version": "1.0.0", "device_name": "Pixel 7" } }
```
200:
```json
{ "success": true, "data": {
  "access_token": "opaque-random-string", "token_type": "Bearer", "expires_at": "2026-09-24T22:42:00+01:00",
  "user": { …User }, "scope": { …Scope } } }
```
Errors: `INVALID_CREDENTIALS`, `ACCOUNT_NOT_CREATED`, `ACCOUNT_NOT_APPROVED`, `ACCOUNT_LOCKED`,
`RATE_LIMITED` (5 failures per username or per IP in 15 min, with a `Retry-After` header in seconds),
`SERVICE_UNAVAILABLE` (AD down), `VALIDATION_FAILED` (missing username/password, bad `device` fields:
`platform` ∈ `android|ios`, `app_version` like `1.2.3`).
Order of checks: rate limit → the username must exist in Elite (`gua_users`), else `ACCOUNT_NOT_CREATED`
**before** any password check → password (database for the super admin, Active Directory for staff) →
`ACCOUNT_NOT_APPROVED` → `ACCOUNT_LOCKED`. A wrong password never reveals approval/lock status.
The username is sanitised like legacy (first 50 chars, then only `a-z A-Z 0-9 . -`).
Every attempt (success/failure) is written to `gua_auditlogs`.

**`POST /auth/logout`** → revokes the token. 200 `{ "data": null }`.

**`GET /auth/me`** → `{ user, scope, expires_at }`. Used on app start to validate a stored token.

Tokens: opaque 256-bit random, stored **hashed (SHA-256)** in `app_sessions`. Absolute lifetime 12 h,
idle timeout 60 min (sliding), both configurable. Revoked on logout. If the user's `gua_users` row
becomes locked/unapproved, the next request returns `SESSION_EXPIRED`. A missing, malformed or unknown
token returns `UNAUTHENTICATED`; an expired, idle-timed-out or revoked one returns `SESSION_EXPIRED`. Both
401 responses carry `WWW-Authenticate: Bearer`.

### Reference data

**`GET /config`** (no auth)
```json
{ "min_app_version": "1.0.0", "latest_app_version": "1.0.0", "support": { "email": "…", "phone": "…" },
  "cash_thresholds": { "no_cash": 0, "low": { "min": 1, "max": 500000 }, "moderate": { … }, "high": { … } },
  "idle_days": 30, "performance_report_max_days": 31, "server_time": "…" }
```

**`GET /regions`** → regions the user may see:
```json
[ { "value": "All", "label": "All regions" }, { "value": "South West", "label": "South West" } ]
```
`All` = everything inside the user's scope.

**`GET /filters`**
```json
[ { "key": "all", "label": "All" }, { "key": "idle", "label": "Idle" }, { "key": "online", "label": "Online" },
  { "key": "offline", "label": "Offline" }, { "key": "closed", "label": "Closed" }, { "key": "supervisor", "label": "Supervisor" },
  { "key": "cash_jam", "label": "Cash Jam" }, { "key": "no_cash", "label": "No Cash" }, { "key": "low_cash", "label": "Low Cash" },
  { "key": "moderate_cash", "label": "Moderate Cash" }, { "key": "high_cash", "label": "High Cash" } ]
```
Legacy's hidden `EC` / `ABC` filters are **not** part of v1 (no terminal has those `location_type`
values); use the `location_type[]` facet instead.

### Dashboard

**`GET /dashboard/summary?region=South%20West`** (`region` optional, default `All`; must be in scope)
```json
{
  "region": "South West", "total": 1234, "generated_at": "…",
  "status": {
    "in_service": { "count": 1000, "percentage": 81.04 }, "offline": { … }, "closed": { … }, "supervisor": { … } },
  "cash": {
    "no_cash": { "count": 12, "percentage": 0.97 }, "low_cash": { … }, "moderate_cash": { … },
    "high_cash": { … }, "cash_jam": { … } },
  "performance": { "uptime": 81.04, "in_progress": 9.72, "downtime": 9.24 }
}
```
Computed server-side in one query (conditional aggregation) — no client `total_count`.
`performance` keeps legacy definitions: uptime = ACTIVE, in_progress = SUPERVISOR + CLOSE, downtime = OFFLINE.

### Terminals

**`GET /terminals`**

| Param | Notes |
|---|---|
| `filter` | a key from `/filters` (default `all`) |
| `region` | optional, in scope |
| `state[]`, `brand[]`, `location_type[]`, `status[]` | optional multi-value facets |
| `search` | matches terminal_id, location, state, region, brand, sol_id (case-insensitive, contains) |
| `min_amount`, `max_amount` | optional |
| `idle_hours` | optional: last transaction older than N hours |
| `sort` | `terminal_id` \| `location` \| `amount` \| `last_txn_at` \| `status` (default `terminal_id`) |
| `order` | `asc` \| `desc` |
| `page`, `per_page` | default 1 / 20, `per_page` max 100 |
| `include` | `facets` → adds `meta.facets` |

Response `data: [Terminal]`, `meta: { page, per_page, total, total_pages, facets? }` where
`facets = { "state": [{"value":"Lagos","count":120}], "brand": [...], "location_type": [...], "region": [...], "status": [...] }`
computed for the current filter + search (before facet selection of the same dimension).

Multi-value params repeat the key (`status[]=OFFLINE&status[]=CLOSE`; a single `status=OFFLINE` also
works); at most 50 values each (5 for `status`). Unknown `filter`/`sort`/`order`/`status` values, `per_page`
> 100, `min_amount` > `max_amount` or `include` other than `facets` → 422 with `details` per field.

**`GET /terminals/export`** → same params, no paging, `text/csv; charset=utf-8` attachment (UTF-8 with BOM,
max 10,000 rows, columns = the Terminal fields). Headers: `X-Total-Count` (matching rows) and
`X-Export-Truncated: true|false`. Cells starting with `= + - @` are prefixed with `'` (spreadsheet
formula injection).

**`GET /terminals/of-interest`** → same list params (filter ignored).

**`GET /terminals/backed-out`** → same list params; each item is Terminal plus
`"backed_out_duration_seconds": 93600` (now − last_txn_at; `null` if unknown).

**`GET /terminals/{terminal_id}`**
```json
{ "terminal": { …Terminal, "address": "…", "branch_code": "…", "branch_name": "…", "country": "…" },
  "performance_today": { …PerformanceStats }, "as_at": "…" }
```
404 if not found, not monitored, or out of scope.

**`GET /terminals/{terminal_id}/performance?from=2026-09-18&to=2026-09-24`**
Range ≤ `performance_report_max_days` (31) and `to` ≤ today, else 422.
```json
{ "terminal": { "terminal_id": "…", "location": "…", "sol_id": "…", "region": "…", "state": "…", "brand": "…" },
  "from": "2026-09-18", "to": "2026-09-24",
  "days": [ { "date": "2026-09-18", …PerformanceStats } ],
  "totals": { …PerformanceStats } }
```
`days` has one entry for **every** date in the range (days without samples: `no_data: true`); `totals` is
computed from the summed sample counts. `from`/`to` must be real `YYYY-MM-DD` dates.

### Performance

**`GET /performance/realtime?date=2026-09-24`** (`date` default today, max 31 days back)
Params: `region`, `search`, `sort` (`uptime`|`downtime`|`terminal_id`, default `uptime`), `order`
(default `asc` = worst first), `page`, `per_page`.
```json
{ "success": true,
  "data": [ { "terminal_id": "…", "location": "…", "sol_id": "…", "region": "…", "state": "…", "brand": "…", …PerformanceStats } ],
  "meta": { "page": 1, "per_page": 20, "total": 1234, "total_pages": 62,
            "summary": { "date": "2026-09-24", "average_uptime": 93.4, "below_threshold": 57, "threshold": 90 } } }
```
One grouped query over `gua_availability` joined to in-scope monitored terminals (no N+1). Terminals
without samples that day are included with `no_data: true` and are always listed last.
`average_uptime` covers terminals with data (`null` if none); `threshold` is configurable (default 90).

### Audit

**`POST /audit`** `{ "action": "Viewed terminal 10441234", "target_view": "TerminalDetail", "module": "terminals" }`
→ 204 (empty body). All three fields are required (`action` ≤ 800, `target_view` ≤ 300, `module` ≤ 100
characters — the `gua_auditlogs` column sizes). User name and IP come from the session/request, never from
the body.

### Devices & notifications (push)

One row per FCM registration token (`app_device_tokens`, stored as a SHA-256 hash plus the token itself for
sending). The token is **never echoed** in any response. In paths it must be URL-encoded; an unknown or
malformed token is `404 NOT_FOUND`.

**Preferences object** (every response returns the full object; requests may send any subset):
```json
{
  "categories": { "offline": true, "back_in_service": true, "cash_jam": true, "no_cash": true,
                  "low_cash": false, "supervisor": false, "closed": false, "daily_summary": true },
  "regions": ["All"],
  "quiet_hours": { "start": "22:00", "end": "06:00" },
  "critical_bypass_quiet_hours": false
}
```
- `categories`: booleans keyed by alert type; unknown keys → 422. Missing keys keep their current value
  (defaults for a new device: `low_cash`, `supervisor` and `closed` off, the rest on).
- `regions`: non-empty list of region names, or `["All"]` (= everything the user's scope allows). Every
  region must be inside the user's scope, otherwise `403 FORBIDDEN_SCOPE`. Region match is case-insensitive.
- `quiet_hours`: `null` (off, the default) or `{ "start": "HH:MM", "end": "HH:MM" }` (24 h, WAT, different
  times; may wrap midnight). During quiet hours nothing is sent, except critical alerts (`offline`,
  `cash_jam`, `no_cash`) when `critical_bypass_quiet_hours` is `true`.

**`POST /devices`** `{ "token": "fcm-token", "platform": "android", "app_version": "1.0.0", "preferences": { … } }`
→ 200 (upsert by token; call on every login and token refresh).
- `token` required (16–4000 chars of `A–Z a–z 0–9 : _ - .`), `platform` required (`android` | `ios`),
  `app_version` optional (`x.y.z`), `preferences` optional (partial allowed). Bad input → 422.
- Re-registering keeps the device's saved preferences unless new ones are sent. A token last registered by
  another user moves to the caller (with defaults — preferences are never carried across users).
- Response `data`: `{ "platform", "app_version", "preferences", "registered_at", "updated_at" }`.

**`PUT /devices/{token}/preferences`** body = any subset of the preferences object → 200 with the same
`data` shape as `POST /devices`. Empty body → 422. Token unknown or owned by another user → 404.

**`DELETE /devices/{token}`** → 204. Idempotent: an unknown token is also 204 (logout may repeat). A token
owned by another user → 404.

**`GET /notifications?page=1&per_page=20`** (`per_page` 1–100) → the caller's notifications from
`app_notification_log`, newest first, with the usual pagination `meta`:
```json
{ "id": "42", "type": "offline", "title": "ATM Offline", "body": "90000001 · Ikeja is offline since 10:42",
  "terminal_id": "90000001", "severity": "critical", "route": "/terminal/90000001",
  "sent_at": "2026-09-24T10:42:00+01:00" }
```
`terminal_id` is `null` for grouped alerts and daily summaries. One entry per notification even when it
went to several devices; entries are logged also when push is not configured yet (the inbox still works).

### Health

**`GET /health`** (no auth) → `{ "status": "ok", "version": "1.0.0" }`; 503 if DB is down. No internals.
