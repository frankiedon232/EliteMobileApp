import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/screens/force_update_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/onboarding_screen.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/session_controller.dart';
import '../../features/dashboard/presentation/screens/overview_screen.dart';
import '../../features/more/presentation/screens/more_screen.dart';
import '../../features/performance/presentation/screens/performance_screen.dart';
import '../../features/terminals/presentation/screens/terminals_screen.dart';
import 'app_shell.dart';
import 'auth_redirect.dart';
import 'routes.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  // Re-run the redirect whenever the session, onboarding or force-update state changes.
  final refresh = ValueNotifier<int>(0);
  void bump(Object? _, Object? _) => refresh.value++;
  ref
    ..listen(sessionProvider, bump)
    ..listen(onboardingSeenProvider, bump)
    ..listen(forceUpdateProvider, bump)
    ..onDispose(refresh.dispose);

  final router = GoRouter(
    initialLocation: Routes.home,
    refreshListenable: refresh,
    redirect: (context, state) => authRedirect(
      location: state.uri,
      session: ref.read(sessionProvider),
      onboardingSeen: ref.read(onboardingSeenProvider),
      forceUpdate: ref.read(forceUpdateProvider),
    ),
    routes: [
      GoRoute(path: Routes.splash, builder: (context, state) => const SplashScreen()),
      GoRoute(path: Routes.onboarding, builder: (context, state) => const OnboardingScreen()),
      GoRoute(path: Routes.login, builder: (context, state) => const LoginScreen()),
      GoRoute(path: Routes.update, builder: (context, state) => const ForceUpdateScreen()),
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => AppShell(navigationShell: shell),
        branches: [
          StatefulShellBranch(
            routes: [GoRoute(path: Routes.home, builder: (context, state) => const OverviewScreen())],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.terminals,
                builder: (context, state) =>
                    TerminalsScreen(filter: state.uri.queryParameters['filter'] ?? 'all'),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: Routes.performance, builder: (context, state) => const PerformanceScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: Routes.more, builder: (context, state) => const MoreScreen())],
          ),
        ],
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
}
