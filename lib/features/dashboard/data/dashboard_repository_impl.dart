import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../domain/dashboard_models.dart';
import '../domain/dashboard_repository.dart';

part 'dashboard_repository_impl.g.dart';

@Riverpod(keepAlive: true)
DashboardRepository dashboardRepository(Ref ref) => DashboardRepositoryImpl(ref.watch(apiClientProvider));

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl(this._api);

  final ApiClient _api;

  @override
  Future<DashboardSummary> summary({String? region}) async {
    final envelope = await _api.get(
      ApiEndpoints.dashboardSummary,
      query: {'region': region == 'All' ? null : region},
    );
    return DashboardSummary.fromJson(envelope.object);
  }
}
