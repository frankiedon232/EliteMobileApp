/// Route paths (docs/ARCHITECTURE.md §5).
abstract final class Routes {
  static const home = '/home';
  static const terminals = '/terminals';
  static const performance = '/performance';
  static const more = '/more';

  /// `/terminals?filter=<v1 filter key>` (keys from `GET /filters`, e.g. `offline`, `no_cash`).
  static String terminalsFiltered(String filter) =>
      Uri(path: terminals, queryParameters: {'filter': filter}).toString();
}
