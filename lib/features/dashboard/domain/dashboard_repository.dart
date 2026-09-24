import 'dashboard_models.dart';

abstract interface class DashboardRepository {
  /// `GET /dashboard/summary?region=` (`null` / "All" = the whole scope).
  Future<DashboardSummary> summary({String? region});
}
