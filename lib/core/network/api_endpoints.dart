/// v1 paths, relative to `API_BASE_URL` (…/mobile/api/v1). See docs/API_CONTRACT.md §3.
abstract final class ApiEndpoints {
  static const health = '/health';
  static const config = '/config';

  static const login = '/auth/login';
  static const logout = '/auth/logout';
  static const me = '/auth/me';

  static const regions = '/regions';
  static const filters = '/filters';

  static const dashboardSummary = '/dashboard/summary';

  static const terminals = '/terminals';
  static const terminalsExport = '/terminals/export';
  static const terminalsOfInterest = '/terminals/of-interest';
  static const terminalsBackedOut = '/terminals/backed-out';
  static String terminal(String id) => '/terminals/${Uri.encodeComponent(id)}';
  static String terminalPerformance(String id) => '/terminals/${Uri.encodeComponent(id)}/performance';

  static const performanceRealtime = '/performance/realtime';

  static const audit = '/audit';

  static const devices = '/devices';
  static String device(String token) => '/devices/${Uri.encodeComponent(token)}';
  static String devicePreferences(String token) => '/devices/${Uri.encodeComponent(token)}/preferences';

  static const notifications = '/notifications';

  /// Endpoints that never carry the bearer token.
  static const public = {health, config, login};
}
