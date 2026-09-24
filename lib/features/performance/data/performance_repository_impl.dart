import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../domain/performance_models.dart';
import '../domain/performance_repository.dart';

part 'performance_repository_impl.g.dart';

@Riverpod(keepAlive: true)
PerformanceRepository performanceRepository(Ref ref) =>
    PerformanceRepositoryImpl(ref.watch(apiClientProvider));

class PerformanceRepositoryImpl implements PerformanceRepository {
  PerformanceRepositoryImpl(this._api);

  final ApiClient _api;

  @override
  Future<RealtimePage> realtime(RealtimeQuery query, {int page = 1}) async => RealtimePage.fromEnvelope(
    await _api.get(ApiEndpoints.performanceRealtime, query: query.toQueryParameters(page: page)),
  );

  @override
  Future<PerformanceReport> report(String terminalId, {required DateTime from, required DateTime to}) async {
    final envelope = await _api.get(
      ApiEndpoints.terminalPerformance(terminalId.trim()),
      query: {'from': apiDate(from), 'to': apiDate(to)},
    );
    return PerformanceReport.fromJson(envelope.object);
  }
}
