import 'package:elite_mobile/core/network/api_endpoints.dart';
import 'package:elite_mobile/features/dashboard/data/dashboard_repository_impl.dart';
import 'package:elite_mobile/features/reference/data/reference_repository_impl.dart';
import 'package:elite_mobile/features/reference/domain/reference_models.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/api_harness.dart';

void main() {
  late ApiHarness api;

  setUp(() => api = ApiHarness(token: 't'));

  test('config', () async {
    api.onGet(ApiEndpoints.config, 200, fixture('config'));
    final c = await ReferenceRepositoryImpl(api.client).config();
    expect(c.minAppVersion, '1.0.0');
    expect(c.idleDays, 7);
    expect(c.performanceReportMaxDays, 31);
    expect(c.cashThresholds.low.max, 500000);
    expect(c.support.phone, isNull);
  });

  test('regions, All first', () async {
    api.onGet(ApiEndpoints.regions, 200, fixture('regions'));
    final regions = await ReferenceRepositoryImpl(api.client).regions();
    expect(regions.first.isAll, isTrue);
    expect(regions.map((r) => r.value), ['All', 'South West']);
  });

  test('filters map to TerminalFilter keys', () async {
    api.onGet(ApiEndpoints.filters, 200, fixture('filters'));
    final filters = await ReferenceRepositoryImpl(api.client).filters();
    expect(filters, hasLength(11));
    expect(filters.map((f) => f.key).toList(), TerminalFilter.values);
    expect(filters.firstWhere((f) => f.key == TerminalFilter.noCash).label, 'No Cash');
  });

  test('TerminalFilter.fromKey round-trips wire keys and defaults to all', () {
    for (final f in TerminalFilter.values) {
      expect(TerminalFilter.fromKey(f.key), f);
    }
    expect(TerminalFilter.fromKey('Offline'), TerminalFilter.offline);
    expect(TerminalFilter.fromKey('EC'), TerminalFilter.all);
    expect(TerminalFilter.fromKey(null), TerminalFilter.all);
  });

  group('dashboard summary', () {
    test('parses counts, percentages and performance', () async {
      api.onGet(ApiEndpoints.dashboardSummary, 200, fixture('dashboard_summary'));
      final s = await DashboardRepositoryImpl(api.client).summary(region: 'South West');

      expect(api.lastQuery, 'region=South West');
      expect(s.total, 1234);
      expect(s.status.inService.percentage, 81.04);
      expect(s.cash.cashJam.count, 42);
      expect(s.performance.inProgress, 9.72);
    });

    test('"All" region is not sent', () async {
      api.onGet(ApiEndpoints.dashboardSummary, 200, fixture('dashboard_summary'));
      await DashboardRepositoryImpl(api.client).summary(region: 'All');
      expect(api.last.queryParameters, isEmpty);
    });
  });
}
