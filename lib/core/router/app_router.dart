import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/dashboard/presentation/screens/overview_screen.dart';
import '../../features/more/presentation/screens/more_screen.dart';
import '../../features/performance/presentation/screens/performance_screen.dart';
import '../../features/terminals/presentation/screens/terminals_screen.dart';
import 'app_shell.dart';
import 'routes.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: Routes.home,
    // Auth / onboarding / lock redirects are added in M2 and M8.
    routes: [
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
}
