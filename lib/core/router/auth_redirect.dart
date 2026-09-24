import '../../features/auth/presentation/session_controller.dart';
import 'routes.dart';

/// go_router redirect (docs/ARCHITECTURE.md §5): force update → `/update`; restoring → splash;
/// no onboarding → `/onboarding`; no session → `/login`; signed in on a public page → where the user was
/// going (`from`) or `/home`. The app lock (`/lock`) is added in M8.
String? authRedirect({
  required Uri location,
  required SessionState session,
  required bool onboardingSeen,
  required bool forceUpdate,
}) {
  final path = location.path;
  if (forceUpdate) return path == Routes.update ? null : Routes.update;

  if (session is SessionRestoring) {
    if (path == Routes.splash) return null;
    // Remember deep links (e.g. a notification tap on a cold start) while the session is restored.
    return Uri(path: Routes.splash, queryParameters: {'from': location.toString()}).toString();
  }

  if (!onboardingSeen) return path == Routes.onboarding ? null : Routes.onboarding;

  if (session is SignedOut) return path == Routes.login ? null : Routes.login;

  // Signed in.
  if (Routes.public.contains(path)) {
    final from = location.queryParameters['from'];
    return from != null && from.startsWith('/') && !Routes.public.contains(Uri.parse(from).path)
        ? from
        : Routes.home;
  }
  return null;
}
