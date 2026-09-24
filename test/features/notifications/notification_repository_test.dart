import 'package:elite_mobile/core/audit/audit_repository.dart';
import 'package:elite_mobile/core/network/api_endpoints.dart';
import 'package:elite_mobile/features/notifications/data/notification_repository_impl.dart';
import 'package:elite_mobile/features/notifications/domain/notification_models.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/api_harness.dart';

void main() {
  late ApiHarness api;
  late NotificationRepositoryImpl repo;
  const token = 'fcm:APA91b-token_value.1234567890';

  setUp(() {
    api = ApiHarness(token: 't');
    repo = NotificationRepositoryImpl(api.client);
  });

  group('PreferencesPatch', () {
    test('sends only the fields that change, with wire keys', () {
      const patch = PreferencesPatch(categories: {AlertType.lowCash: true, AlertType.backInService: false});
      expect(patch.toJson(), {
        'categories': {'low_cash': true, 'back_in_service': false},
      });
    });

    test('quiet hours: set, turn off (null) or keep (omitted)', () {
      expect(
        const PreferencesPatch(
          quietHours: (value: QuietHours(start: '22:00', end: '06:00')),
        ).toJson(),
        {
          'quiet_hours': {'start': '22:00', 'end': '06:00'},
        },
      );
      expect(const PreferencesPatch(quietHours: (value: null)).toJson(), {'quiet_hours': null});
      expect(const PreferencesPatch(regions: ['South West']).toJson().containsKey('quiet_hours'), isFalse);
    });

    test('isEmpty', () {
      expect(const PreferencesPatch().isEmpty, isTrue);
      expect(const PreferencesPatch(criticalBypassQuietHours: true).isEmpty, isFalse);
    });
  });

  test('registerDevice posts token/platform/version and parses preferences', () async {
    api.onPost(ApiEndpoints.devices, 200, fixture('device'));

    final reg = await repo.registerDevice(token: token, platform: 'android', appVersion: '1.0.0');

    expect(api.last.data, {'token': token, 'platform': 'android', 'app_version': '1.0.0'});
    expect(reg.preferences.categories.lowCash, isFalse);
    expect(reg.preferences.categories.offline, isTrue);
    expect(reg.preferences.quietHours, const QuietHours(start: '22:00', end: '06:00'));
    expect(reg.preferences.regions, ['All']);
  });

  test('updatePreferences PUTs to the URL-encoded token path', () async {
    final path = ApiEndpoints.devicePreferences(token);
    expect(path, '/devices/fcm%3AAPA91b-token_value.1234567890/preferences');
    api.onPut(path, 200, fixture('device'));

    await repo.updatePreferences(token, const PreferencesPatch(criticalBypassQuietHours: true));

    expect(api.last.method, 'PUT');
    expect(api.last.data, {'critical_bypass_quiet_hours': true});
  });

  test('updatePreferences rejects an empty patch before calling the API', () {
    expect(() => repo.updatePreferences(token, const PreferencesPatch()), throwsArgumentError);
    expect(api.requests, isEmpty);
  });

  test('unregisterDevice accepts 204', () async {
    api.onDelete(ApiEndpoints.device(token), 204, null);
    await repo.unregisterDevice(token);
    expect(api.last.method, 'DELETE');
  });

  test('inbox parses items, null terminal_id and pagination', () async {
    api.onGet(ApiEndpoints.notifications, 200, fixture('notifications'));

    final page = await repo.inbox(perPage: 50);

    expect(api.lastQuery, 'page=1&per_page=50');
    expect(page.items.first.type, AlertType.offline);
    expect(page.items.first.severity, AlertSeverity.critical);
    expect(page.items.first.route, '/terminal/90000001');
    expect(page.items[1].type, AlertType.dailySummary);
    expect(page.items[1].terminalId, isNull);
    expect(page.meta.total, 2);
  });

  test('audit caps field lengths and never throws', () async {
    api.onPost(ApiEndpoints.audit, 204, null);
    await AuditRepository(api.client)
        .log(action: 'x' * 900, targetView: 'TerminalDetail', module: 'terminals');
    expect((api.last.data as Map)['action'], hasLength(800));

    api.onPost(ApiEndpoints.audit, 500, null);
    await AuditRepository(api.client).log(action: 'a', targetView: 'b', module: 'c');
  });
}
