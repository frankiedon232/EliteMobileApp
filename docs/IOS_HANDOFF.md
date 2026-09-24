# iOS Handoff Checklist (Windows → macOS)

Development happens on Windows (Android only). This file is the running list of everything that must be
done or verified on the Mac. **Claude Code: add an entry every time you write or defer iOS-specific work.**

## 1. Moving the project to the Mac
1. On Windows: commit everything, `git push`.
2. On the Mac: install Flutter (same channel/version as Windows: check `flutter --version`), Xcode
   (latest stable), Xcode command-line tools, CocoaPods (`sudo gem install cocoapods` or `brew install cocoapods`).
3. `git clone <repo>` → `cd elite_mobile` → `flutter pub get` → `cd ios && pod install && cd ..`.
4. Recreate untracked files: `.env.dev.json` (and any `.env*`). They are not in Git on purpose.
5. `flutter doctor -v` must be clean for Xcode and CocoaPods.
6. `flutter run` on an iOS simulator to confirm the app boots.

## 2. Project settings (Xcode → Runner target)
- [ ] Bundle identifier `com.elite.eliteprovidus` (or Frankie's choice), display name "Elite Mobile".
- [ ] Deployment target matches `ios/Podfile` `platform :ios, '13.0'` (or higher if Firebase requires).
- [ ] Signing team selected (Apple Developer account), automatic signing.
- [ ] Orientation: portrait only (iPhone), check iPad settings.
- [ ] App icon and launch screen generated (`flutter_launcher_icons`, `flutter_native_splash`) look right.

## 3. Info.plist keys (Claude Code writes these on Windows; verify on Mac)
- [ ] `NSFaceIDUsageDescription`: "Unlock Elite Mobile with Face ID."
- [ ] `UIBackgroundModes`: `remote-notification` (and `fetch` if used).
- [ ] `FirebaseAppDelegateProxyEnabled` as required by `firebase_messaging` docs.
- [ ] `LSApplicationQueriesSchemes` for `comgooglemaps`, `maps` if "Open in Maps" uses them.
- [ ] Any other permission strings added later (list them here).

## 4. Firebase & push
- [ ] In Firebase console: add the iOS app with the same bundle id.
- [ ] On the Mac: `dart pub global activate flutterfire_cli` → `flutterfire configure` (select Android
      and iOS) → regenerates `firebase_options.dart` and adds `GoogleService-Info.plist`.
- [ ] Xcode capabilities: **Push Notifications** and **Background Modes → Remote notifications**.
- [ ] Apple Developer portal: create an **APNs Auth Key (.p8)**, upload it to Firebase (Project
      settings → Cloud Messaging → Apple app configuration) with Key ID and Team ID.
- [ ] Test push on a **physical iPhone** (VM simulators usually can't receive real pushes): USB
      passthrough to the VM, or distribute via TestFlight.
- [ ] Verify foreground, background and terminated tap → deep link to `/terminal/:id`.

## 5. Security features
- [ ] Face ID / Touch ID via `local_auth` works (simulator: Features → Face ID → Enrolled).
- [ ] Keychain storage via `flutter_secure_storage` survives app restart; decide behaviour after reinstall
      (Keychain persists across reinstalls; clear session on first launch if needed).

## 6. Release
- [ ] `flutter build ipa` → upload with Xcode Organizer or Transporter.
- [ ] App Store Connect record, TestFlight internal testers (bank staff).
- [ ] Privacy details (App Store privacy "nutrition label"): data collected = username, device token,
      crash data if Crashlytics is enabled.

## 7. Deferred iOS items (Claude Code appends here)
| Date | Item | Where in code | Notes |
|---|---|---|---|
