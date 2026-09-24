/// Route paths (docs/ARCHITECTURE.md §5).
abstract final class Routes {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const update = '/update';

  static const home = '/home';
  static const terminals = '/terminals';
  static const performance = '/performance';
  static const more = '/more';

  /// Routes reachable without a session.
  static const public = {splash, onboarding, login, update};

  /// `/terminals?filter=<v1 filter key>` (keys from `GET /filters`, e.g. `offline`, `no_cash`).
  static String terminalsFiltered(String filter) =>
      Uri(path: terminals, queryParameters: {'filter': filter}).toString();
}
