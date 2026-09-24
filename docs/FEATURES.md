# Features

Legend: **[P]** parity with legacy app · **[N]** new. All data comes from the v1 API (`docs/API_CONTRACT.md`).

## 1. Onboarding & Auth

1. **[P] Onboarding** — 3 slides (Welcome, Authentication, Security; copy in `docs/LEGACY_APP.md` §2.1),
   animated page indicator, Skip + Continue. Shown once.
2. **[P] Login** — AD username + password, show/hide password, both fields validated, button loading
   state, every login error code mapped to a friendly message (API_CONTRACT §1). Note under form: "Sign in with your Providus AD
   credentials".
3. **[N] Remember username** (toggle; never the password).
4. **[N] Secure session** in `flutter_secure_storage`.
5. **[N] App lock** — after login, offer biometric unlock (fingerprint/Face ID). When enabled, the app
   asks for biometrics on cold start and after N minutes in background (default 2). Fallback: re-login.
6. **[N] Inactivity auto-logout** — configurable (default 15 min of no interaction) — standard for
   banking apps.
7. **[P] Logout** — confirm dialog, clears session + cache, keeps onboarding flag, unregisters push
   token (`DELETE /devices/{token}`), `POST /auth/logout`.

## 2. Home / Overview (merges legacy Home + Dashboard into one rich screen)

1. **[P] Header** — greeting ("Good morning, <uname>"), role chip, "Elite Providus" branding, avatar,
   notifications bell with unread badge.
2. **[P] Region switcher** — horizontal chips or a dropdown pill from `GET /regions`, "Reset to all my regions".
   Switching animates all numbers.
3. **[P] Hero card** — total terminals (animated count-up), region label, and Uptime / In-Progress /
   Downtime mini-stats. Tap → Performance.
4. **[P+N] Real-Time Status** — In Service, Offline, Closed, Supervisor as rich stat cards (icon,
   %, count, coloured progress bar) + a **donut chart** of the distribution. Tap → filtered list.
5. **[P+N] Cash Level Status** — Zero/Low/Moderate/High/Cash Jam as rich horizontal bars using legacy
   colours + a stacked bar summary. Tap → filtered list.
6. **[P+N] Performance Analysis** — three radial gauges (Uptime, In-Progress, Downtime).
7. **[P] ATM of Interest** — top 5 as compact cards + "View all" → full list screen (same list UI).
8. **[N] Last updated** timestamp, pull-to-refresh, auto-refresh, offline banner with cached data.
9. **[N] Quick actions row** — Lookup terminal, Performance report, Backed-out, Watchlist.

## 3. Terminals (Monitoring & Cash Level lists) — one screen, parameterised

1. **[P] Filters** — All, Idle, Online, Offline, Closed, Supervisor, Cash Jam, No Cash, Low Cash,
   Moderate Cash, High Cash as a scrollable segmented chip bar (from `GET /filters`).
2. **[P] Search** — debounced (300 ms) across terminal id, location, state, region, brand; matched text
   highlighted (legacy used jQuery.highlight).
3. **[N] Advanced filter sheet** — options and counts from `include=facets`; multi-select by Region, State, Brand, Type, Status; cash amount range
   slider; "last transaction older than X hours". Active filters shown as removable chips + count badge.
4. **[N] Sort** — Terminal ID, Location, Cash amount ↑↓, Last transaction ↑↓, Status.
5. **[P+N] Pagination** (server-side, from `meta`) — page size 10/20/50, "Showing 21–40 of 312", prev/next + page numbers, and an
   infinite-scroll mode toggle. Default: infinite scroll with a sticky results counter.
6. **[N] Two views** — **Card view** (default on phones) and **Table view** (`data_table_2`, sticky
   header and first column, horizontal scroll, all 11 columns, status coloured). Remember choice.
7. **[N] Rich ATM card** — terminal id (mono), location, status pill, cash amount with a cash-level
   bar coloured by band, brand/type chips, state · region, "last txn 2h ago" (relative + exact on
   tap), card reader & cash jam indicators, star (watchlist).
8. **[N] Swipe/long-press actions** on a card — Add to watchlist, Copy terminal ID, Share details,
   Open performance.
9. **[N] Export** — current filtered list to CSV via `/terminals/export` (share sheet).
10. Tap card → **Terminal detail**.

## 4. Terminal Detail & Lookup

1. **[P] Lookup** — search field with recent searches (local, last 10) and watchlist suggestions.
2. **[P] Detail screen** (`/terminal/:id`) — header card (status, location, brand, state, region,
   last txn), performance section with 5 metrics as radial/segment chart (Uptime, Downtime, Offline,
   Close, Cash Jam), timestamp "as at".
3. **[N] Actions** — Add/remove watchlist, Copy ID, Share summary, "Performance report for this
   terminal" (pre-fills the report form), "Open location in Maps" (search the location text).
4. **[P] Not found** state with a friendly illustration.

## 5. Performance

1. **[P] Realtime tab** — list/table of `PerformanceRecord` with search, sort (uptime asc = worst first),
   pagination. Card shows uptime/downtime as a split bar + offline/close/cash-jam mini stats.
   Summary header: average uptime, count below 90 % uptime (worst performers).
2. **[P] Report tab** — terminal id + date range picker limited to the last 7 days (today−6 … today),
   quick presets (Today, Yesterday, Last 3 days, Last 7 days). Results with a **line/bar chart** over
   periods + table. "New query" resets.
3. **[N] Export report** — PDF (branded, with chart and table) and CSV via share sheet.

## 6. Backed-Out Terminals

**[P]** List with search/sort/pagination; card shows duration prominently (e.g. red badge). **[N]**
filter by region/state, export CSV.

## 7. Watchlist [N]

Locally stored starred terminals (secure-ish local storage, per user). Watchlist screen shows each
terminal's current state (from the cached "All" dataset). Watchlisted terminals get priority push
notifications once per-terminal subscriptions are added to the API (future contract change).

## 8. Notifications [N]

See `docs/PUSH_NOTIFICATIONS.md`. In-app: notification inbox (merged from `GET /notifications` and locally received pushes; read/unread, swipe to delete,
tap → deep link), bell badge, per-category preferences (Offline, Cash Jam, No Cash, Low Cash,
Supervisor/Closed, Daily summary), quiet hours.

Interim (before backend push exists): **foreground change alerts** — when auto-refresh detects that
offline / no-cash / cash-jam counts rose since the last refresh, show an in-app banner and a local
notification. Make it clear in Settings that background alerts require server push.

## 9. Settings [N]

Theme (System/Light/Dark), auto-refresh interval, default list view (cards/table), page size,
biometric lock, inactivity timeout, notification preferences, clear cache, About (version, build,
"Developed by Unet System Tech Ltd", support email/phone from config), Logout.

## 10. Cross-cutting [N]

- Offline banner (non-blocking), cached data with "last updated".
- Haptics on key actions, skeleton loaders, animated number transitions.
- Accessibility: text scale up to 1.3 without overflow, semantic labels, status never conveyed by
  colour alone (pill text + icon).
- Audit logging via `POST /audit` for region change, lookup, report query, export (login/logout are audited server-side).
- Force update: `426 UPGRADE_REQUIRED` or `GET /config` `min_app_version` → blocking update screen.
- Crash/error reporting: Firebase Crashlytics (optional, ask Frankie).
- Screenshot protection on sensitive screens (Android `FLAG_SECURE`) — ask Frankie if desired.
