# Architecture

## 1. Packages

Add with `flutter pub add` (latest compatible versions). Group by purpose:

| Purpose | Packages |
|---|---|
| State | `flutter_riverpod`, `riverpod_annotation`; dev: `riverpod_generator`, `build_runner`, `custom_lint`, `riverpod_lint` |
| Routing | `go_router` |
| Network | `dio`, `pretty_dio_logger` (debug only), `connectivity_plus` |
| Models | `freezed_annotation`, `json_annotation`; dev: `freezed`, `json_serializable` |
| Storage | `flutter_secure_storage` (session), `shared_preferences` (non-sensitive settings), `hive_ce` + `hive_ce_flutter` or plain JSON files (cache) |
| Security | `local_auth` (biometrics) |
| Push | `firebase_core`, `firebase_messaging`, `flutter_local_notifications` |
| UI | `google_fonts`, `fl_chart`, `shimmer` (or `skeletonizer`), `flutter_animate`, `flutter_svg`, `gap`, `data_table_2` (wide table view) |
| Utils | `intl`, `share_plus`, `path_provider`, `csv`, `pdf` + `printing` (report export), `url_launcher`, `package_info_plus`, `flutter_native_splash`, `flutter_launcher_icons` |
| Testing | `mocktail`, `http_mock_adapter` |

Don't add anything else without a reason noted in the PR summary.

## 2. Folder structure

```
lib/
  main.dart                      # bootstrap: Firebase, Hive, ProviderScope, error handlers
  app.dart                       # MaterialApp.router, themes, locale
  core/
    config/app_config.dart       # base URL, timeouts, feature flags (dart-define)
    network/
      api_client.dart            # Dio setup, JSON, base URL from dart-define
      interceptors/              # auth (Bearer + X-App-Version + X-Platform), 401/426 handling, logging (debug), retry
      api_endpoints.dart         # v1 paths as constants
      envelope.dart              # parses {success,data,meta,error} into typed results/failures
    error/failures.dart          # sealed Failure types
    storage/                     # secure_store.dart, prefs.dart, cache_store.dart
    theme/                       # app_colors.dart, app_theme.dart, typography.dart, status_colors.dart
    utils/formatters.dart        # naira, counts, dates, percents
    widgets/                     # shared design-system widgets (see UI_DESIGN.md §5)
    router/app_router.dart       # go_router + auth redirect + ShellRoute for bottom nav
  features/
    onboarding/
    auth/                        # login, session, app lock, inactivity logout
    dashboard/                   # summary, status metrics, cash levels, performance, regions, ATM of interest
    terminals/                   # monitoring list (one screen, filter param), filters, detail
    terminal_lookup/
    performance/                 # realtime + report
    backed_out/
    watchlist/                   # NEW: favourite terminals (local)
    notifications/               # NEW: FCM, inbox, preferences
    settings/                    # theme, refresh interval, security, about
  each feature/
    data/        (dtos, remote_data_source, repository_impl)
    domain/      (entities, enums, repository interface)
    presentation/(screens, widgets, controllers/providers)
test/  mirrors lib/
```

## 3. State management rules

- Riverpod with code generation (`@riverpod`). `AsyncNotifier` for loadable state.
- `sessionProvider` (keepAlive) holds token state, `User?`, `Scope`, and `selectedRegion`.
- Every data provider `watch`es `selectedRegion`, so a region switch refetches automatically.
- Lists: a `TerminalQuery` (filter, region, facets, search, sort, order, pageSize) is the provider
  family key; results are fetched page by page from `/terminals` using the server `meta`. Infinite scroll
  appends pages; changing the query resets. Facets come from `include=facets`.
- Auto-refresh: a `refreshTickerProvider` driven by the settings interval (default 60 s, options
  Off/30 s/60 s/2 min/5 min) invalidates dashboard providers while the app is in the foreground.
  Pause when backgrounded (`AppLifecycleListener`).

## 4. Networking

- One Dio instance, JSON in/out, base URL from `API_BASE_URL` dart-define (staging during development),
  connect timeout 15 s, receive 30 s.
- `AuthInterceptor` adds `Authorization: Bearer <token>`, `X-App-Version`, `X-Platform`.
- Every response is the envelope from `docs/API_CONTRACT.md` §1. `envelope.dart` maps `error.code` to a
  sealed `Failure` (`InvalidCredentials`, `AccountLocked`, `AccountNotApproved`, `AccountNotCreated`,
  `SessionExpired`, `ForbiddenScope`, `NotFound`, `Validation(details)`, `RateLimited(retryAfter)`,
  `UpgradeRequired`, `Network`, `Server`).
- Global handling: 401 → clear session → `/login` with a "session expired" message; 426 → force-update
  screen.
- Repositories return a `Result<T>` type (or throw typed `Failure`s) — pick one pattern and use it
  everywhere.
- CSV export uses `/terminals/export` (download to temp dir, then share).

## 5. Routing

```
/onboarding
/login
/lock                         (app lock screen)
ShellRoute (bottom nav): 
  /home                        Overview
  /terminals?filter=Offline    Monitoring list
  /performance                 Realtime + Report tabs
  /more                        Lookup, Backed-out, Watchlist, Notifications, Settings, Logout
/terminal/:id                  Terminal detail (lookup result screen)
/lookup
/backed-out
/notifications
/settings
```
Redirect logic: no onboarding flag → `/onboarding`; no session → `/login`; locked → `/lock`.
Deep links from notifications route to `/terminal/:id` or `/terminals?filter=…`.

## 6. Environment / flavours

- `.env.dev.json` (untracked): `{"API_BASE_URL": "https://elite.unetapps.com/mobile/api/v1", "ENV": "staging",
  "STAGING_HOST_IP": "192.168.10.160"}` (emulator: `"10.0.2.2"`). Staging builds trust
  `assets/certs/staging_ca.pem` and connect to `STAGING_HOST_IP` with TLS for the hostname (API_CONTRACT §0).
  Commit `.env.dev.example.json`. Production guard: refuse to start non-release builds pointing at
  `providusbank.com`.
- Optionally `dev` / `prod` flavours later; not required for v1.

## 7. Testing

- Unit: envelope/failure mapping, formatters, query builders, each repository with
  `http_mock_adapter` using JSON examples from `docs/API_CONTRACT.md` (put them in `test/fixtures/`).
- Widget: login form validation, dashboard renders from a fake repository, list empty/error states.
- Keep tests fast; no live network in tests.
