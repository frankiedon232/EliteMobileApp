import 'package:elite_mobile/core/error/failures.dart';
import 'package:elite_mobile/core/network/api_endpoints.dart';
import 'package:elite_mobile/core/network/api_events.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/api_harness.dart';

void main() {
  late ApiHarness api;

  setUp(() => api = ApiHarness(token: 'secret-token'));

  test('bearer token, X-App-Version and X-Platform on authenticated requests', () async {
    api.onGet(ApiEndpoints.regions, 200, fixture('regions'));
    await api.client.get(ApiEndpoints.regions);

    expect(api.last.headers['Authorization'], 'Bearer secret-token');
    expect(api.last.headers['X-App-Version'], '1.0.0');
    expect(api.last.headers['X-Platform'], anyOf('android', 'ios'));
  });

  test('no bearer token on /auth/login, /health and /config', () async {
    api.onPost(ApiEndpoints.login, 200, fixture('login'));
    api.onGet(ApiEndpoints.health, 200, {
      'success': true,
      'data': {'status': 'ok', 'version': '1.0.0'},
    });
    api.onGet(ApiEndpoints.config, 200, fixture('config'));

    await api.client.post(ApiEndpoints.login, body: {'username': 'u', 'password': 'p'});
    await api.client.get(ApiEndpoints.health);
    await api.client.get(ApiEndpoints.config);

    for (final r in api.requests) {
      expect(r.headers.containsKey('Authorization'), isFalse, reason: r.path);
    }
  });

  test('no Authorization header when signed out', () async {
    api.token = null;
    api.onGet(ApiEndpoints.regions, 200, fixture('regions'));
    await api.client.get(ApiEndpoints.regions);
    expect(api.last.headers.containsKey('Authorization'), isFalse);
  });

  test('401 SESSION_EXPIRED → SessionExpired + sessionExpired event', () async {
    api.onGet(ApiEndpoints.me, 401, {
      'success': false,
      'error': {'code': 'SESSION_EXPIRED', 'message': 'expired'},
    });

    await expectLater(api.client.get(ApiEndpoints.me), throwsA(isA<SessionExpired>()));
    await Future<void>.delayed(Duration.zero);
    expect(api.emitted, [ApiEvent.sessionExpired]);
  });

  test('401 on login is INVALID_CREDENTIALS and does not end the session', () async {
    api.onPost(ApiEndpoints.login, 401, {
      'success': false,
      'error': {'code': 'INVALID_CREDENTIALS', 'message': 'bad'},
    });

    await expectLater(api.client.post(ApiEndpoints.login, body: {}), throwsA(isA<InvalidCredentials>()));
    await Future<void>.delayed(Duration.zero);
    expect(api.emitted, isEmpty);
  });

  test('426 → UpgradeRequired + upgradeRequired event', () async {
    api.onGet(ApiEndpoints.me, 426, {
      'success': false,
      'error': {'code': 'UPGRADE_REQUIRED', 'message': 'update'},
    });

    await expectLater(api.client.get(ApiEndpoints.me), throwsA(isA<UpgradeRequired>()));
    await Future<void>.delayed(Duration.zero);
    expect(api.emitted, [ApiEvent.upgradeRequired]);
  });

  test('404 is a typed failure with no global event', () async {
    api.onGet(ApiEndpoints.terminal('999'), 404, {
      'success': false,
      'error': {'code': 'NOT_FOUND', 'message': 'nope'},
    });
    await expectLater(api.client.get(ApiEndpoints.terminal('999')), throwsA(isA<NotFound>()));
    expect(api.emitted, isEmpty);
  });
}
