# Roadmap — Mobile (`C:\UNETPROJECTS\MOBILE_APPS\elite_mobile`)

Order across both projects: **backend (separate repo, B1–B8) → this app (M0–M9) → iOS (I1) →
production rollout with the bank.** Start M0 only after Frankie confirms the backend is signed off.

Every phase ends with: `flutter analyze` clean, `flutter test` green, app running on an Android
emulator/device, a short summary and a manual test list for Frankie.

## Phases

- **M0 Setup** — reuse the existing Flutter project if present (else `flutter create --org com.elite --project-name elite_mobile .`), `git init`, ids, packages, lints, theme, router shell, assets,
  splash/icons, VS Code launch configs, env files pointing at **staging**, `tool/sync_contract.dart` (run it).
- **M1 Networking & models** — Dio client (bearer token, `X-App-Version`, envelope parsing, error →
  typed failures, 401 → logout, 426 → force update), freezed models from `docs/API_CONTRACT.md` /
  `docs/openapi.yaml`, repositories, tests with mocked responses.
- **M2 Onboarding, login, session** — secure token storage, `/auth/me` on start, logout.
- **M3 Design system widgets** + debug gallery.
- **M4 Overview dashboard** — `/dashboard/summary`, regions, charts, auto-refresh, cache, offline banner.
- **M5 Terminals** — server-side paginated list, filters, facets sheet, search, sort, card/table views,
  export, detail + lookup, watchlist star.
- **M6 Performance, backed-out, watchlist.**
- **M7 Notifications** — Firebase (Android), `/devices`, inbox (`/notifications` + local), preferences,
  deep links. Verify real pushes end-to-end with the backend's `alerts:run` on staging.
- **M8 Security & settings** — biometric lock, inactivity logout, settings, about.
- **M9 Polish & Android release** — accessibility, performance, signing, `appbundle`, README.

## iOS
- **I1** — on the macOS VM, follow `docs/IOS_HANDOFF.md`.

