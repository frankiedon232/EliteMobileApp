import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elite_mobile/core/error/failures.dart';
import 'package:elite_mobile/core/network/api_endpoints.dart';
import 'package:elite_mobile/features/reference/domain/reference_models.dart';
import 'package:elite_mobile/features/terminals/data/terminal_repository_impl.dart';
import 'package:elite_mobile/features/terminals/domain/terminal_models.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/api_harness.dart';

void main() {
  late ApiHarness api;
  late TerminalRepositoryImpl repo;

  setUp(() {
    api = ApiHarness(token: 't');
    repo = TerminalRepositoryImpl(api.client);
  });

  group('TerminalQuery.toQueryParameters', () {
    test('defaults: filter all, sort terminal_id asc, page 1 of 20', () {
      expect(const TerminalQuery().toQueryParameters(), {
        'filter': 'all',
        'region': null,
        'state[]': <String>[],
        'brand[]': <String>[],
        'location_type[]': <String>[],
        'status[]': <String>[],
        'search': null,
        'min_amount': null,
        'max_amount': null,
        'idle_hours': null,
        'sort': 'terminal_id',
        'order': 'asc',
        'page': 1,
        'per_page': 20,
      });
    });

    test('export has no paging or include', () {
      final q = const TerminalQuery(includeFacets: true).toQueryParameters(page: null);
      expect(q.containsKey('page'), isFalse);
      expect(q.containsKey('per_page'), isFalse);
      expect(q.containsKey('include'), isFalse);
    });

    test('activeFacetCount counts facet selections and ranges', () {
      const q = TerminalQuery(
        states: ['Lagos', 'Oyo'],
        statuses: [TerminalStatus.offline],
        minAmount: 1,
        idleHours: 24,
        search: 'ikeja',
      );
      expect(q.activeFacetCount, 5);
    });

    test('equal queries are equal (provider family key)', () {
      expect(const TerminalQuery(states: ['Lagos']), const TerminalQuery(states: ['Lagos']));
    });
  });

  test('list sends repeated key[] params, omits empties and parses facets', () async {
    api.onGet(ApiEndpoints.terminals, 200, fixture('terminals_page'));

    final page = await repo.list(
      const TerminalQuery(
        filter: TerminalFilter.noCash,
        region: 'South West',
        states: ['Lagos', 'Oyo'],
        statuses: [TerminalStatus.offline, TerminalStatus.close],
        search: '  ikeja ',
        sort: TerminalSort.lastTxnAt,
        ascending: false,
        perPage: 50,
        includeFacets: true,
      ),
      page: 2,
    );

    final q = api.lastQuery;
    expect(q, contains('filter=no_cash'));
    expect(q, contains('region=South West'));
    expect(q, contains('state[]=Lagos&state[]=Oyo'));
    expect(q, contains('status[]=OFFLINE&status[]=CLOSE'));
    expect(q, contains('search=ikeja'));
    expect(q, contains('sort=last_txn_at'));
    expect(q, contains('order=desc'));
    expect(q, contains('page=2'));
    expect(q, contains('per_page=50'));
    expect(q, contains('include=facets'));
    expect(q, isNot(contains('brand')));
    expect(q, isNot(contains('min_amount')));

    expect(page.meta.total, 312);
    expect(page.meta.firstIndex, 21);
    expect(page.meta.lastIndex, 40);
    expect(page.meta.hasNext, isTrue);
    expect(page.facets!.status.map((f) => f.value), ['OFFLINE', 'ACTIVE']);
    expect(page.facets!.locationType.single.count, 200);

    final t = page.items.first;
    expect(t.terminalId, '10441234');
    expect(t.status, TerminalStatus.offline);
    expect(t.amount, 2450000.0);
    expect(t.cashBand, CashBand.moderate);
    expect(t.lastTxnAt, DateTime.utc(2026, 9, 24, 7, 15));
    expect(t.isOfInterest, isTrue);

    final unknown = page.items[1];
    expect(unknown.location, isNull);
    expect(unknown.amount, isNull);
    expect(unknown.lastTxnAt, isNull);
    expect(unknown.cashBand, CashBand.unknown);
    expect(unknown.hasCashJam, isTrue);
  });

  test('facets are null when not requested', () async {
    api.onGet(ApiEndpoints.terminals, 200, fixture('terminals_page_no_facets'));
    final page = await repo.list(const TerminalQuery());
    expect(page.facets, isNull);
    expect(page.meta.hasNext, isFalse);
  });

  test('of-interest uses its own endpoint', () async {
    api.onGet(ApiEndpoints.terminalsOfInterest, 200, fixture('terminals_page_no_facets'));
    final page = await repo.ofInterest(const TerminalQuery(perPage: 5));
    expect(api.last.path, ApiEndpoints.terminalsOfInterest);
    expect(page.items.single.isOfInterest, isTrue);
  });

  test('backed-out adds the duration', () async {
    api.onGet(ApiEndpoints.terminalsBackedOut, 200, fixture('backed_out'));
    final page = await repo.backedOut(const TerminalQuery());
    expect(page.items.first.backedOutFor, const Duration(hours: 26));
    expect(page.items.first.terminal.terminalId, '10441234');
    expect(page.items[1].backedOutFor, isNull);
  });

  test('detail parses terminal extras and today\'s performance', () async {
    api.onGet(ApiEndpoints.terminal('10441234'), 200, fixture('terminal_detail'));
    final d = await repo.detail(' 10441234 ');
    expect(d.info.terminal.location, 'IKEJA ALLEN');
    expect(d.info.branchName, 'Ikeja Allen');
    expect(d.info.country, 'Nigeria');
    expect(d.performanceToday.uptime, 91.32);
    expect(d.performanceToday.noData, isFalse);
  });

  test('detail 404 → NotFound (also used for out-of-scope terminals)', () async {
    api.onGet(ApiEndpoints.terminal('999'), 404, {
      'success': false,
      'error': {'code': 'NOT_FOUND', 'message': 'Terminal not found'},
    });
    await expectLater(repo.detail('999'), throwsA(isA<NotFound>()));
  });

  test('terminal id is URL-encoded in the path', () {
    expect(ApiEndpoints.terminal('A/B 1'), '/terminals/A%2FB%201');
  });

  test('export downloads the CSV and reads X-Total-Count / X-Export-Truncated', () async {
    final dir = Directory.systemTemp.createTempSync('elite_export');
    addTearDown(() => dir.deleteSync(recursive: true));
    final path = '${dir.path}${Platform.pathSeparator}terminals.csv';
    const csv = '﻿terminal_id,location\n10441234,IKEJA ALLEN\n';

    api.adapter.onGet(
      ApiEndpoints.terminalsExport,
      (s) => s.reply(
        200,
        csv,
        headers: {
          Headers.contentTypeHeader: ['text/csv; charset=utf-8'],
          'x-total-count': ['12000'],
          'x-export-truncated': ['true'],
        },
      ),
    );

    final result = await repo.export(const TerminalQuery(filter: TerminalFilter.offline), savePath: path);

    expect(api.lastQuery, contains('filter=offline'));
    expect(api.lastQuery, isNot(contains('page')));
    expect(result.totalCount, 12000);
    expect(result.truncated, isTrue);
    expect(File(path).readAsStringSync(), contains('10441234,IKEJA ALLEN'));
  });
}
