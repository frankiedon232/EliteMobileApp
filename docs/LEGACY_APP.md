# Legacy App Analysis — EliteProvidus (Cordova, 2020–2022)

> The new app does NOT call the legacy endpoints mentioned below; it uses the v1 API
> (`API_CONTRACT.md`). Endpoint names here only explain how the old app behaved. The legacy backend is
> analysed in `LEGACY_API.md`.

Source: `legacy/eliteProvidus/www/`. Cordova Android 9, jQuery 3.2.1, Bootstrap 4.1.3, DataTables,
SweetAlert, Swiper, Material Icons. All logic lives in two files:

- `js/app.js` — endpoint URLs, auth/session, login, dashboard counters, region switching, navigation
  helper `initload()`, perf-report date limits, logout.
- `js/appjq.js` — DataTables for every list screen, terminal lookup, performance report query.
- `js/index.js` — Cordova device-ready: connectivity check every 5 s, portrait lock, and **commented-out
  Firebase push code** (token + notification-open + local notification + wake lock). Push was planned
  but never shipped.

## 1. Navigation flow

```
index.html  →  introduction.html (3-slide onboarding)  →  login.html  →  home.html
                     │ (skipped if localStorage.vst set)        │ (skipped if logged in)
```

- `localStorage.vst = true` marks onboarding as seen.
- "Logged in" = `localStorage.email` exists. There is **no token**; the session is just the user
  object stored in localStorage.
- Every inner page calls `is_logged_in()` → redirects to login if no email.
- Logout: clear storage, keep `vst`, go to login.

Side menu (left drawer, also opens with a right-swipe gesture):

- Home
- Dashboard
- Monitoring ▸ All, Idle, Online, Offline, Closed, Supervisor, Cash Jam
- Cash Level ▸ No Cash, Low Cash, Moderate Cash, High Cash
- Terminal Mode ▸ Terminal Lookup
- Performance ▸ Performance RealTime, Performance Report
- Backed-Out Terminals
- Logout

Header on inner pages: menu button, username, and "Total: <region> <count>".

## 2. Screens

### 2.1 Onboarding (`introduction.html`)
3 swipe slides on a city background with the Elite logo:
1. **Welcome** — "Elite Mobile is an ATM Monitoring application designed to provide real-time status
   of the entire ATM estate in the palm of your hands. Check your ATM status right here, right now!"
2. **Authentication** — "Elite Mobile makes use of AD authentication protocol to sign in approved and
   authorized users to the app."
3. **Security** — "Elite Mobile runs on a secure layer which means all data including authentication is
   encrypted before processing."
CONTINUE button → login.

### 2.2 Login (`login.html`)
Logo, "WELCOME!" in gold, Username, Password, "Sign In →". Footer "© 2021 [tando logo] All Rights
Reserved". Errors shown via SweetAlert: *Not Approved*, *Account Locked*, *Invalid Credentials*,
blank input. Credentials are **Active Directory** (AD) — say so on the login screen.

### 2.3 Home (`home.html`)
- Hero card: big formatted total terminal count; "Total Terminals: From Region: <region>".
- Footer row: UPTIME % (green), IN-PROGRS % (amber), DOWNTIME % (red) → all tap to Performance RealTime.
- 4 tiles: Dashboard, Active (→ Online list), No Service (→ Offline list), Closed (→ Closed list).

### 2.4 Dashboard (`dashboard.html`)
- Region `<select>` (options from `getRegions.php`). Changing region calls `countFilter.php`, stores the
  region as the new access region and reloads everything.
- **Real-Time Status** (2×2 grid): In Service, Offline, Closed, Supervisor — each "xx %" + "(count)",
  tap → matching list.
- **Cash Level Status** (5 coloured bars): Zero Cash `#FF6F3E`, Low Cash `#0085B2`, Moderate Cash
  `#005680`, High Cash `#008040`, Cash Jam `#FF8F6A` — each "xx% (count)", tap → matching list.
- **ATM Performance Analysis** (3 cols): UPTIME ("Online Terminals"), IN-PROGRESS ("Supervisor & Close"),
  DOWNTIME ("Offline, CashJam …").
- **ATM of Interest** table with search box (from `atmofinterest.php`).

### 2.5 Monitoring / Cash-level lists (`mon*.html` — 11 identical pages)
All 11 pages are the same template; only `localStorage.filter_rpt` differs:
`All, Idle, Online, Offline, Closed, Supervisor, Cash Jam, No Cash, Low Cash, Moderate Cash, High Cash`.
- Header: "Monitoring: <filter> ATMs - <region> : <count found>"
- Filter `<select id="load-reporting">` (options from `getReportingpages.php`) switches the filter.
- Search box. DataTable (responsive, simple prev/next pagination, 10 rows/page default).
- Columns: Terminal, Location, Status, Cash Level, Type, Brand, State, Region, Last Txn Date, Card Reader,
  Cash Jam.

**In Flutter this is ONE screen parameterised by filter**, not 11.

### 2.6 Terminal Lookup (`terminallookup.html`)
Input Terminal ID → GO. Two calls in parallel:
- `termLookup.php` → performance %: Uptime, Downtime, Offline, Close, Cash Jam.
- `fetchSingleTerm.php` → Status, Shortname (location), Last Txn, Brand, State, Region; or `not found`.
Shows "Performance | <terminal> | <now dd/MM/yyyy H:m>".

### 2.7 Performance RealTime (`perfrealt.html`)
Table from `performanceRealTime.php`: Terminal, Uptime (green header), Downtime (red header), Offline,
Close, Cash Jam, Shortname, SOL ID, Period. Search box.

### 2.8 Performance Report (`perfreport.html`)
Form: Between Date, And Date, Terminal ID → GO. Dates are limited to **the last 7 days** (min = today−6,
max = today, both default to today). Result table has the same columns as RealTime. "New +" link resets.

### 2.9 Backed-Out Terminals (`backedoutterms.html`)
Table from `backedOutTerms.php`: Terminal, Location, Status, Brand, State, Region, Last Txn Date,
Backed-Out Duration. Search box.

## 3. Display rules to keep

- **Status colours**: `ACTIVE` green, `OFFLINE` red, `SUPERVISOR` purple, `CLOSE` tomato/orange.
- **Cash amount**: legacy renders `round(amount/100)*100` with thousands separators and `.00`.
  In Flutter: format as Naira, `₦1,234,500.00` (keep the rounding to nearest 100).
- **Dates**: `dd/MM/yyyy HH:mm`.
- **Counts**: thousands separator (`1,234`).

## 4. Brand

- Status bar / navigation bar: `#011F53` (deep navy).
- Accent / primary button: `#FCB815` (Providus gold). "WELCOME!" heading is gold.
- Dark text/surface: `#33364D`; page tint `#F5F7FF`.
- Header text "Elite **Providus**" with "Providus" in red/danger.
- Assets to copy from `legacy/eliteProvidus/www/img/`: `ellite.png` (logo), `logo-lg.png`, `logo-l.png`,
  `city2.png` (onboarding/login background), `icons/tando.png` (footer partner logo),
  `icons/icon-xxxhdpi-192.png` (app icon source), `default.jpg` (avatar placeholder),
  `splash/screen-xhdpi-portrait.png` (splash reference). Status icons in `img/icons/*.png` are legacy
  raster icons; prefer vector icons in the new UI.

## 5. Bugs and weaknesses in the legacy app (fix, don't copy)

1. Login validation checks `username` twice; empty password is sent to the server. → Validate both.
2. Dashboard counters fire in parallel with `total_count` taken from the **previous** session's
   `localStorage.totalCount`, so percentages can be computed against a stale total on first load.
   → Resolved: `/dashboard/summary` computes everything server-side in one call.
3. Region change **overwrites** the user's permitted scope (`dashbaccregion`) with the selected region,
   so the original scope is lost until re-login. → Keep `userScope` (from login) and `selectedRegion`
   separately.
4. DataTables config puts `serverSide: true` inside `language`, so it is ignored: every list endpoint
   returns **all rows at once** and paging/search is client-side. → Resolved: v1 `/terminals` pages,
   searches, sorts and filters server-side.
5. No auth token on any API call after login; requests are authorised only by the access-scope fields
   the client sends. → Resolved: v1 uses bearer tokens and server-side scope (LEGACY_API §5).
6. `addToAudit()` (`addaudit.php`) exists but is never called. → New app uses `POST /audit`.
7. `pendingupload.html` is referenced in navigation code but doesn't exist; the card-region selector
   `#load-regions-crad` is dead code. → Ignore.
8. Full page reload on every filter/region change. → Reactive state, no reloads.
9. Connectivity check pops a native alert every 5 s while offline. → Non-blocking offline banner.
10. Dark-theme toggle code exists (template leftover) but no UI. → Real light/dark/system theme.
