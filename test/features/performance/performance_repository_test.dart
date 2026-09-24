import 'package:elite_mobile/core/network/api_endpoints.dart';
import 'package:elite_mobile/features/performance/data/performance_repository_impl.dart';
import 'package:elite_mobile/features/performance/domain/performance_models.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/api_harness.dart';

void main() {
  late ApiHarness api;
  late PerformanceRepositoryImpl repo;

  setUp(() {
    api = ApiHarness(token: 't');
    repo = PerformanceRepositoryImpl(api.client);
  });

  test('realtime: default is worst first, parses rows and summary', () async {
    api.onGet(ApiEndpoints.performanceRealtime, 200, fixture('realtime'));

    final page = await repo.realtime(RealtimeQuery(date: DateTime(2026, 9, 24), region: 'All'));

    expect(api.lastQuery, contains('date=2026-09-24'));
    expect(api.lastQuery, contains('sort=uptime'));
    expect(api.lastQuery, contains('order=asc'));
    expect(api.lastQuery, isNot(contains('region')));

    expect(page.meta.totalPages, 62);
    expect(page.summary.averageUptime, 93.4);
    expect(page.summary.belowThreshold, 57);
    expect(page.summary.threshold, 90);

    final first = page.items.first;
    expect(first.terminal.terminalId, '10441234');
    expect(first.terminal.solId, '001');
    expect(first.stats.samples, 288);
    expect(first.stats.cashJam, 1.39);

    final noData = page.items[1];
    expect(noData.stats.noData, isTrue);
    expect(noData.stats.uptime, isNull);
  });

  test('report: from/to as YYYY-MM-DD, one day per date, totals', () async {
    api.onGet(ApiEndpoints.terminalPerformance('10441234'), 200, fixture('performance_report'));

    final r = await repo.report('10441234', from: DateTime(2026, 9, 22), to: DateTime(2026, 9, 24, 15, 30));

    expect(api.lastQuery, 'from=2026-09-22&to=2026-09-24');
    expect(r.terminal.location, 'IKEJA ALLEN');
    expect(r.days, hasLength(3));
    expect(r.days[1].date, DateTime(2026, 9, 23));
    expect(r.days[1].stats.noData, isTrue);
    expect(r.days[1].stats.downtime, isNull);
    expect(r.totals.uptime, 91.32);
  });
}
