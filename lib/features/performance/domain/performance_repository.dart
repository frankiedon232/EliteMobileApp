import 'performance_models.dart';

abstract interface class PerformanceRepository {
  /// `GET /performance/realtime`: every terminal's performance for one day, worst first by default.
  Future<RealtimePage> realtime(RealtimeQuery query, {int page = 1});

  /// `GET /terminals/{id}/performance?from&to` (range ≤ `performance_report_max_days`, to ≤ today).
  Future<PerformanceReport> report(String terminalId, {required DateTime from, required DateTime to});
}
