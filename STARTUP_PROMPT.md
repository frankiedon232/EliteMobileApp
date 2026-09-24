# Startup Prompt — Mobile (`C:\UNETPROJECTS\MOBILE_APPS\elite_mobile`)

**Backend signed off 2026-09-24.** Contract synced into `docs\` and the staging CA placed in
`assets\certs\staging_ca.pem` by the backend session.

## 1. One-time setup (Windows)

1. In `C:\UNETPROJECTS\MOBILE_APPS\elite_mobile\` you should have: `CLAUDE.md`, `STARTUP_PROMPT.md`,
   `docs\`. If a Flutter project is already there, leave it; Claude Code will adapt to it.
2. Put the Cordova app in `legacy\eliteProvidus\` (so `legacy\eliteProvidus\www\js\app.js` exists).
3. `flutter doctor` should be happy for Android (SDK + emulator or phone with USB debugging); Git
   installed.
4. The backend repo must be at `C:\UNET\APP_BACKEND\elite` (or set `$env:ELITE_BACKEND_PATH`) so the
   contract can be synced.
5. Open the folder in VS Code → Terminal (PowerShell) → `claude`.

## 2. Prompt — paste into Claude Code

```
We are building Elite Mobile, a Flutter ATM-monitoring app for Providus Bank, in this folder. The
backend API is a separate project at C:\UNET\APP_BACKEND\elite and is finished; its v1 contract is
frozen. I'm on Windows with VS Code, building Android first (iOS later on a Mac). Give me PowerShell
commands.

1. Read CLAUDE.md and every doc it references, in order.
2. Check whether a Flutter project already exists here and tell me what you find.
3. Give me a short plan for M0–M9 and wait for my OK.
4. After my OK, execute docs/ROADMAP.md from M0 (create and run tool/sync_contract.dart early).
   Use the staging API https://elite.unetapps.com/mobile/api/v1 (runs on my PC; mkcert certificate;
   phones reach it via STAGING_HOST_IP 192.168.10.160, emulator 10.0.2.2 — see CLAUDE.md §5 and
   docs/API_CONTRACT.md §0). Ask me for a staging test login when needed
   (PowerShell: $env:ELITE_TEST_USER="..."; $env:ELITE_TEST_PASS="...").

Hard rules: never point the app at elitesolution.providusbank.com in development. Never modify legacy/.
Never edit docs/API_CONTRACT.md or docs/openapi.yaml here — they come from the backend repo.
```

## 3. iOS on the Mac (phase I1)

Clone this repo on the Mac, recreate `.env.dev.json`, run `claude` in it and paste:
```
Read CLAUDE.md and docs/IOS_HANDOFF.md. We are now on macOS. Execute phase I1 of docs/ROADMAP.md: get
the app building and running on iOS, then work through IOS_HANDOFF.md, ticking items as you go and
telling me which steps need me (Apple Developer account, APNs key, Firebase console, physical iPhone).
```

## 4. Useful follow-ups
- "Continue with the next phase."
- "Sync the API contract from the backend and tell me what changed."
- "Show me what's still open in IOS_HANDOFF.md."
