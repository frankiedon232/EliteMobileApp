# Elite Mobile

ATM-estate monitoring for Providus Bank staff (Flutter, Android + iOS). Built by Unet System Tech Ltd.
Talks only to the Elite v1 API (backend repo `C:\UNET\APP_BACKEND\elite`). Start with `CLAUDE.md`, then `docs/`.

## Setup (Windows, PowerShell)

```powershell
flutter pub get
dart run build_runner build --delete-conflicting-outputs
Copy-Item .env.dev.example.json .env.dev.json      # emulator (STAGING_HOST_IP 10.0.2.2)
Copy-Item .env.phone.example.json .env.phone.json  # phone on the office LAN (192.168.10.160)
```

## Run (staging)

```powershell
flutter emulators --launch Pixel_9
flutter run --flavor staging --dart-define-from-file=.env.dev.json
flutter run --flavor staging --dart-define-from-file=.env.phone.json   # physical phone
```

Or use the VS Code launch configs in `.vscode/launch.json`.

| Flavor | App id | Contains staging CA | API |
|---|---|---|---|
| `staging` | `com.elite.eliteprovidus.staging` ("Elite Mobile Staging") | yes | `https://elite.unetapps.com/mobile/api/v1` (Frankie's PC) |
| `production` | `com.elite.eliteprovidus` (upgrades the legacy app) | no | bank URL, release builds only |

Debug/profile builds refuse to start if `API_BASE_URL` points at `providusbank.com`, and `ENV` must match
the `--flavor`.

## Checks

```powershell
flutter analyze
flutter test
dart run tool/sync_contract.dart            # copy API_CONTRACT.md + openapi.yaml from the backend repo
dart run tool/sync_contract.dart --check    # report only
```

## Brand assets

`assets/brand/elite_wordmark.svg` is the source of the icon and splash:

```powershell
dart run tool/render_brand.dart
dart run flutter_launcher_icons
dart run flutter_native_splash:create
```
