import 'package:elite_mobile/core/error/failures.dart';
import 'package:elite_mobile/core/network/api_endpoints.dart';
import 'package:elite_mobile/features/auth/data/auth_repository_impl.dart';
import 'package:elite_mobile/features/auth/domain/auth_models.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/api_harness.dart';

void main() {
  late ApiHarness api;
  late AuthRepositoryImpl repo;

  setUp(() {
    api = ApiHarness();
    repo = AuthRepositoryImpl(api.client);
  });

  const device = LoginDevice(platform: 'android', appVersion: '1.0.0', deviceName: 'Pixel 9');

  test('login posts credentials + device and parses the session', () async {
    api.onPost(ApiEndpoints.login, 200, fixture('login'));

    final result = await repo.login(username: 'john.doe', password: 'pw', device: device);

    expect(api.last.data, {
      'username': 'john.doe',
      'password': 'pw',
      'device': {'platform': 'android', 'app_version': '1.0.0', 'device_name': 'Pixel 9'},
    });
    expect(result.accessToken, hasLength(64));
    expect(result.tokenType, 'Bearer');
    expect(result.expiresAt, DateTime.utc(2026, 9, 24, 21, 42));
    expect(result.user.displayName, 'john doe');
    expect(result.user.phone, isNull);
    expect(result.scope.allRegions, isTrue);
  });

  test('login maps each account error', () async {
    for (final (code, type) in [
      ('INVALID_CREDENTIALS', InvalidCredentials),
      ('ACCOUNT_NOT_CREATED', AccountNotCreated),
      ('ACCOUNT_NOT_APPROVED', AccountNotApproved),
      ('ACCOUNT_LOCKED', AccountLocked),
      ('SERVICE_UNAVAILABLE', ServiceUnavailable),
    ]) {
      final status = switch (code) {
        'INVALID_CREDENTIALS' => 401,
        'SERVICE_UNAVAILABLE' => 503,
        _ => 403,
      };
      api.onPost(ApiEndpoints.login, status, {
        'success': false,
        'error': {'code': code, 'message': 'x'},
      });
      await expectLater(
        repo.login(username: 'u', password: 'p', device: device),
        throwsA(predicate((e) => e.runtimeType == type, '$type')),
      );
    }
  });

  test('me returns user, restricted scope and expiry', () async {
    api.onGet(ApiEndpoints.me, 200, fixture('me'));
    final me = await repo.me();
    expect(me.scope.regions, ['South West', 'North Central']);
    expect(me.scope.allRegions, isFalse);
    expect(me.user.username, 'john.doe');
  });

  test('logout posts to /auth/logout', () async {
    api.onPost(ApiEndpoints.logout, 200, fixture('null_data'));
    await repo.logout();
    expect(api.last.path, ApiEndpoints.logout);
    expect(api.last.method, 'POST');
  });
}
