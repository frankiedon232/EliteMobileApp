// Live contract check against the STAGING API (Frankie's PC). Skipped unless ELITE_LIVE=1.
//
//   $env:ELITE_LIVE="1"; flutter test test/live
//   $env:ELITE_TEST_USER="..."; $env:ELITE_TEST_PASS="..."   # also runs the authenticated checks
//
// Parses every response with the app's real models, so a mismatch between the app and the server
// shows up here. Read-only except login/logout (the session it creates is revoked at the end).
// Never points at production.
import 'dart:io';

import 'package:elite_mobile/core/config/app_config.dart';
import 'package:elite_mobile/core/network/api_client.dart';
import 'package:elite_mobile/features/auth/data/auth_repository_impl.dart';
import 'package:elite_mobile/features/auth/domain/auth_models.dart';
import 'package:elite_mobile/features/dashboard/data/dashboard_repository_impl.dart';
import 'package:elite_mobile/features/notifications/data/notification_repository_impl.dart';
import 'package:elite_mobile/features/performance/data/performance_repository_impl.dart';
import 'package:elite_mobile/features/performance/domain/performance_models.dart';
import 'package:elite_mobile/features/reference/data/reference_repository_impl.dart';
import 'package:elite_mobile/features/reference/domain/reference_models.dart';
import 'package:elite_mobile/features/terminals/data/terminal_repository_impl.dart';
import 'package:elite_mobile/features/terminals/domain/terminal_models.dart';
import 'package:flutter_test/flutter_test.dart';

const _stagingUrl = 'https://elite.unetapps.com/mobile/api/v1';

void main() {
  final env = Platform.environment;
  final live = env['ELITE_LIVE'] == '1';
  final user = env['ELITE_TEST_USER'] ?? '';
  final pass = env['ELITE_TEST_PASS'] ?? '';

  String? token;
  late ApiClient api;

  setUpAll(() {
    if (!live) return;
    // This PC resolves elite.unetapps.com (hosts file); trust the mkcert root like staging builds do.
    final context = SecurityContext(withTrustedRoots: true)
      ..setTrustedCertificates('assets/certs/staging_ca.pem');
    final dio = buildDio(
      const AppConfig(env: AppEnv.staging, apiBaseUrl: _stagingUrl, appVersion: '1.0.0', flavor: 'staging'),
      () => HttpClient(context: context),
      token: () => token,
      log: false,
    );
    api = ApiClient(dio);
  });

  group('staging (public)', skip: live ? null : 'set ELITE_LIVE=1 to run', () {
    test('config parses', () async {
      final c = await ReferenceRepositoryImpl(api).config();
      expect(c.performanceReportMaxDays, greaterThan(0));
      printOnFailure('config: $c');
    });
  });

  group(
    'staging (authenticated)',
    skip: !live
        ? 'set ELITE_LIVE=1 to run'
        : (user.isEmpty || pass.isEmpty ? 'set ELITE_TEST_USER / ELITE_TEST_PASS' : null),
    () {
      setUpAll(() async {
        final login = await AuthRepositoryImpl(api).login(
          username: user,
          password: pass,
          device: const LoginDevice(platform: 'android', appVersion: '1.0.0', deviceName: 'elite live test'),
        );
        token = login.accessToken;
      });

      tearDownAll(() async {
        if (token != null) await AuthRepositoryImpl(api).logout();
        token = null;
      });

      test('me, regions, filters', () async {
        final me = await AuthRepositoryImpl(api).me();
        expect(me.user.username, isNotEmpty);
        final regions = await ReferenceRepositoryImpl(api).regions();
        expect(regions.first.isAll, isTrue);
        final filters = await ReferenceRepositoryImpl(api).filters();
        expect(filters.map((f) => f.key), containsAll(TerminalFilter.values));
      });

      test('dashboard summary', () async {
        final s = await DashboardRepositoryImpl(api).summary();
        expect(s.total, greaterThanOrEqualTo(0));
      });

      test('terminals: list with facets, of-interest, backed-out, detail, performance', () async {
        final repo = TerminalRepositoryImpl(api);
        final page = await repo.list(const TerminalQuery(includeFacets: true, perPage: 50));
        expect(page.facets, isNotNull);
        await repo.list(const TerminalQuery(filter: TerminalFilter.offline, sort: TerminalSort.lastTxnAt));
        await repo.ofInterest(const TerminalQuery(perPage: 5));
        await repo.backedOut(const TerminalQuery(perPage: 5));
        if (page.items.isNotEmpty) {
          final id = page.items.first.terminalId;
          final detail = await repo.detail(id);
          expect(detail.info.terminal.terminalId, id);
          final today = DateTime.now();
          final report = await PerformanceRepositoryImpl(api)
              .report(id, from: today.subtract(const Duration(days: 6)), to: today);
          expect(report.days, hasLength(7));
        }
      });

      test('performance realtime', () async {
        final page = await PerformanceRepositoryImpl(api).realtime(const RealtimeQuery(perPage: 10));
        expect(page.summary.threshold, greaterThan(0));
      });

      test('notifications inbox', () async {
        final inbox = await NotificationRepositoryImpl(api).inbox();
        expect(inbox.meta.page, 1);
      });
    },
  );
}
