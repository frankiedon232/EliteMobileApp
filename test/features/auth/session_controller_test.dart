import 'package:elite_mobile/core/error/failures.dart';
import 'package:elite_mobile/core/network/api_client.dart';
import 'package:elite_mobile/core/network/api_events.dart';
import 'package:elite_mobile/features/auth/data/session_store.dart';
import 'package:elite_mobile/features/auth/presentation/session_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/fakes.dart';

void main() {
  late MemorySecureStore secure;
  late FakeAuthRepository auth;
  late ProviderContainer container;

  ProviderContainer create({FakeReferenceRepository? reference}) {
    container = ProviderContainer(
      overrides: appOverrides(secure: secure, prefs: MemoryPrefs(), auth: auth, reference: reference),
    );
    addTearDown(container.dispose);
    return container;
  }

  /// Reads the session and waits for the start-up restore to finish.
  Future<SessionState> restored() async {
    container.listen(sessionProvider, (_, _) {});
    for (var i = 0; i < 20 && container.read(sessionProvider) is SessionRestoring; i++) {
      await Future<void>.delayed(Duration.zero);
    }
    return container.read(sessionProvider);
  }

  setUp(() {
    secure = MemorySecureStore();
    auth = FakeAuthRepository();
  });

  test('no stored session → signed out without calling the API', () async {
    create();
    expect(await restored(), isA<SignedOut>());
    expect(auth.calls, isEmpty);
  });

  test('stored session is validated with /auth/me and the token is restored', () async {
    await seedSession(secure);
    create();
    final s = await restored();
    expect(s, isA<SignedIn>());
    expect((s as SignedIn).offline, isFalse);
    expect(auth.calls, ['me']);
    expect(container.read(authTokenProvider), 'stored-token');
  });

  test('locally expired session → signed out with a message, storage cleared, no API call', () async {
    await SessionStore(secure).save(
      SavedSession(
        token: 't',
        expiresAt: DateTime.now().subtract(const Duration(minutes: 1)),
        user: testUser,
        scope: testScope,
      ),
    );
    create();
    final s = await restored();
    expect((s as SignedOut).message, SessionExpired.defaultMessage);
    expect(secure.values, isEmpty);
    expect(auth.calls, isEmpty);
  });

  test('/auth/me SESSION_EXPIRED → signed out and storage cleared', () async {
    await seedSession(secure);
    auth.meError = const SessionExpired();
    create();
    final s = await restored();
    expect((s as SignedOut).message, SessionExpired.defaultMessage);
    expect(secure.values, isEmpty);
    expect(container.read(authTokenProvider), isNull);
  });

  test('/auth/me unreachable → stays signed in (offline) with the stored user', () async {
    await seedSession(secure);
    auth.meError = const NetworkFailure();
    create();
    final s = await restored() as SignedIn;
    expect(s.offline, isTrue);
    expect(s.user.username, 'john.doe');
    expect(secure.values, isNotEmpty);
  });

  test('login stores the session in secure storage and signs in', () async {
    create();
    await restored();
    await container.read(sessionProvider.notifier).login(username: '  john.doe ', password: 'pw');

    expect(auth.lastLogin, (username: 'john.doe', password: 'pw'));
    expect(container.read(sessionProvider), isA<SignedIn>());
    expect(container.read(authTokenProvider), 'new-token');
    expect((await SessionStore(secure).load())!.token, 'new-token');
    expect(secure.values.values.join(), isNot(contains('pw')), reason: 'password is never stored');
  });

  test('failed login throws the failure and stays signed out', () async {
    create();
    await restored();
    auth.loginError = const InvalidCredentials();
    await expectLater(
      container.read(sessionProvider.notifier).login(username: 'u', password: 'bad'),
      throwsA(isA<InvalidCredentials>()),
    );
    expect(container.read(sessionProvider), isA<SignedOut>());
    expect(secure.values, isEmpty);
  });

  test('logout clears the session even when the API call fails', () async {
    await seedSession(secure);
    auth.logoutError = const NetworkFailure();
    create();
    await restored();
    await container.read(sessionProvider.notifier).logout();

    expect(auth.calls, ['me', 'logout']);
    expect(container.read(sessionProvider), isA<SignedOut>());
    expect((container.read(sessionProvider) as SignedOut).message, isNull);
    expect(secure.values, isEmpty);
    expect(container.read(authTokenProvider), isNull);
  });

  test('a 401 anywhere in the app (sessionExpired event) signs out', () async {
    await seedSession(secure);
    create();
    await restored();
    container.read(apiEventBusProvider).emit(ApiEvent.sessionExpired);
    await Future<void>.delayed(Duration.zero);
    await Future<void>.delayed(Duration.zero);

    expect((container.read(sessionProvider) as SignedOut).message, SessionExpired.defaultMessage);
    expect(secure.values, isEmpty);
  });

  group('ForceUpdate', () {
    Future<bool> settled() async {
      container.listen(forceUpdateProvider, (_, _) {});
      await Future<void>.delayed(Duration.zero);
      await Future<void>.delayed(Duration.zero);
      return container.read(forceUpdateProvider);
    }

    test('off when the build meets min_app_version', () async {
      create(reference: FakeReferenceRepository(minAppVersion: '1.0.0'));
      expect(await settled(), isFalse);
    });

    test('on when min_app_version is newer than this build', () async {
      create(reference: FakeReferenceRepository(minAppVersion: '1.2.0'));
      expect(await settled(), isTrue);
    });

    test('on after a 426 from any endpoint', () async {
      create();
      expect(await settled(), isFalse);
      container.read(apiEventBusProvider).emit(ApiEvent.upgradeRequired);
      await Future<void>.delayed(Duration.zero);
      expect(container.read(forceUpdateProvider), isTrue);
    });
  });
}
