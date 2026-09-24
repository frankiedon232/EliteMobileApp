# CLAUDE.md — Elite Mobile (Flutter)

Project folder: `C:\UNETPROJECTS\MOBILE_APPS\elite_mobile` (its own Git repo).
Sister project: the backend API at `C:\UNET\APP_BACKEND\elite` (separate repo, built first). This app
talks **only** to that backend's v1 API.

Built by Unet System Tech Ltd for Providus Bank. Owner: **Frankie**.
**Backend signed off by Frankie on 2026-09-24** (backend B8 done; v1 contract frozen; staging live).

## 1. What the app is

Elite Mobile lets Providus Bank staff monitor the ATM estate in real time: in-service / offline / closed /
supervisor counts, cash levels, cash jams, uptime/downtime performance, single-terminal lookup,
performance reports, backed-out terminals — plus new features: push alerts, watchlist, rich dashboard,
filters, pagination, exports, biometric lock.

## 2. Documents (read in this order)

| File | Purpose |
|---|---|
| `docs/LEGACY_APP.md` | What the old Cordova app does, screen by screen |
| `docs/API_CONTRACT.md` + `docs/openapi.yaml` | The v1 API — **copies**; canonical versions live in the backend repo |
| `docs/ARCHITECTURE.md` | Packages, structure, state, networking, storage |
| `docs/FEATURES.md` | Feature list with acceptance criteria |
| `docs/UI_DESIGN.md` | Design system and every screen |
| `docs/PUSH_NOTIFICATIONS.md` | Push design (client part is §A) |
| `docs/IOS_HANDOFF.md` | iOS checklist for the Mac (you maintain it) |
| `docs/ROADMAP.md` | Phases M0–M9, I1 |

## 3. Layout

```
C:\UNETPROJECTS\MOBILE_APPS\elite_mobile\
  CLAUDE.md  STARTUP_PROMPT.md
  docs\
  legacy\eliteProvidus\     ← original Cordova app (READ-ONLY reference + image assets)
  lib\ test\ tool\ android\ ios\ assets\ pubspec.yaml ...
```
If a Flutter project already exists in this folder, **do not re-create it** — inspect it, report what's
there, and adapt phase M0. Never modify anything under `legacy\`.

## 4. API contract sync

The backend repo owns the contract. Before M1 and whenever Frankie says the contract changed, run
`dart run tool/sync_contract.dart` (create it in M0): it copies `docs/API_CONTRACT.md` and `openapi.yaml`
from the backend path in env var `ELITE_BACKEND_PATH` (default `C:\UNET\APP_BACKEND\elite`) into this
repo's `docs\`, and prints a diff summary. **Never edit the copies here.** If the app needs something the
contract lacks, tell Frankie so the backend adds it first.

## 5. Environments

| Env | API base URL | Allowed in dev? |
|---|---|---|
| staging | `https://elite.unetapps.com/mobile/api/v1` | **Yes** — default |
| production | `https://elitesolution.providusbank.com/mobile/api/v1` (Frankie confirms before the store build) | **No.** Release builds only, set at rollout |

- **Production guard**: debug/profile builds refuse to start if `API_BASE_URL` contains `providusbank.com`.
- Never call the legacy `app_api/*.php` endpoints from the app.
- **Staging runs on Frankie's PC** (nginx, mkcert certificate for `*.unetapps.com`). `elite.unetapps.com`
  resolves only on that PC, and phones don't trust mkcert. Staging builds therefore (see
  `docs/API_CONTRACT.md` §0 for the code):
  1. trust `assets/certs/staging_ca.pem` (the mkcert **public** root; already in place) in addition to the
     system roots, with verification on. Never `badCertificateCallback => true`. Never include this
     asset in production builds (flavor-specific asset or excluded at build time);
  2. connect the socket to `STAGING_HOST_IP` (PC LAN IP `192.168.10.160`; Android emulator `10.0.2.2`)
     while TLS keeps the hostname `elite.unetapps.com` (SNI + certificate check).
  Production builds: default `SecurityContext`, normal DNS, the bank's certificate.

## 6. Non-negotiable rules

1. **Stack**: Flutter stable (latest), Dart 3, Riverpod (code gen), go_router, Dio, freezed +
   json_serializable, flutter_secure_storage, firebase_messaging, flutter_local_notifications, fl_chart.
   Add with `flutter pub add` (current versions only).
2. Feature-first clean architecture: `data` → `domain` → `presentation`. No HTTP/JSON in widgets.
3. Models mirror `docs/API_CONTRACT.md` exactly.
4. Every async screen: loading (skeleton), data, empty, error (Retry); pull-to-refresh; paginated lists
   use the server's `meta`.
5. Security: token only in `flutter_secure_storage`; send `Authorization: Bearer`, `X-App-Version`,
   `X-Platform`; 401 → clear session → login; 426 → force-update screen; no logging of tokens/passwords
   or full responses in release. Biometric app-lock + inactivity logout.
6. Follow `docs/UI_DESIGN.md` exactly; light + dark themes. Portrait only. Android minSdk 23+ (or
   Firebase's minimum); iOS 13+.
7. Credentials only via `--dart-define`/untracked `.env.dev.json` or environment variables. Commit
   `.env.dev.example.json`.
8. Git: `.gitattributes` (`* text=auto eol=lf`, binaries marked), Flutter `.gitignore` plus `.env*`
   (except examples), `*.jks`, `key.properties`, `google-services.json`, `GoogleService-Info.plist`.
9. Each phase ends with `flutter analyze` clean, `flutter test` green, the app running on an Android
   emulator/device, and a summary + manual test list for Frankie.

## 7. Development environment

- **Now:** Windows + VS Code + Android. **Later:** macOS VM for iOS — clone this repo there.
- Write iOS config as you go (Info.plist keys, Podfile platform) and log deferred iOS work in
  `docs/IOS_HANDOFF.md`.
- Scripts in Dart (`tool/*.dart`), not `.bat`/`.ps1`. Give PowerShell commands.
- `.vscode/launch.json` with `--dart-define-from-file=.env.dev.json`; recommend Dart, Flutter,
  Error Lens extensions.

## 8. Commands

```powershell
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
flutter run --dart-define-from-file=.env.dev.json
dart run tool/sync_contract.dart
```

## 9. Naming

Dart package `elite_mobile`; display name **Elite Mobile**; applicationId / bundle id
`com.elite.eliteprovidus` (same as the old app so it upgrades in place) unless Frankie says otherwise.
