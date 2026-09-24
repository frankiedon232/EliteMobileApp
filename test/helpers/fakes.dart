import 'package:elite_mobile/core/config/app_config.dart';
import 'package:elite_mobile/core/config/config_providers.dart';
import 'package:elite_mobile/core/error/failures.dart';
import 'package:elite_mobile/core/network/api_health.dart';
import 'package:elite_mobile/core/storage/app_prefs.dart';
import 'package:elite_mobile/core/storage/secure_store.dart';
import 'package:elite_mobile/features/auth/data/auth_repository_impl.dart';
import 'package:elite_mobile/features/auth/data/session_store.dart';
import 'package:elite_mobile/features/auth/domain/auth_models.dart';
import 'package:elite_mobile/features/auth/domain/auth_repository.dart';
import 'package:elite_mobile/features/reference/data/reference_repository_impl.dart';
import 'package:elite_mobile/features/reference/domain/reference_models.dart';
import 'package:elite_mobile/features/reference/domain/reference_repository.dart';
import 'package:flutter/material.dart' show ThemeMode;
import 'package:flutter_riverpod/misc.dart' show Override;

import 'api_harness.dart';

class MemorySecureStore implements SecureStore {
  final values = <String, String>{};

  @override
  Future<String?> read(String key) async => values[key];

  @override
  Future<void> write(String key, String? value) async =>
      value == null ? values.remove(key) : values[key] = value;

  @override
  Future<void> delete(Iterable<String> keys) async => keys.forEach(values.remove);
}

class MemoryPrefs implements AppPrefs {
  MemoryPrefs({this.onboardingSeen = true, this.rememberUsername = true, this.rememberedUsername});

  @override
  bool onboardingSeen;

  @override
  bool rememberUsername;

  @override
  String? rememberedUsername;

  @override
  ThemeMode themeMode = ThemeMode.system;

  @override
  Future<void> setThemeMode(ThemeMode mode) async => themeMode = mode;

  @override
  Future<void> setOnboardingSeen() async => onboardingSeen = true;

  @override
  Future<void> setRememberedUsername({required bool remember, String? username}) async {
    rememberUsername = remember;
    rememberedUsername = remember ? username : null;
  }
}

final testUser = User.fromJson(
  (fixture('login')['data'] as Map<String, dynamic>)['user'] as Map<String, dynamic>,
);
const testScope = Scope(regions: ['All'], states: ['All'], atms: ['All']);

/// Configurable [AuthRepository]: set [loginError] / [meError] / [logoutError] to make a call fail.
class FakeAuthRepository implements AuthRepository {
  Failure? loginError;
  Failure? meError;
  Failure? logoutError;
  final calls = <String>[];
  ({String username, String password})? lastLogin;

  @override
  Future<LoginResult> login({
    required String username,
    required String password,
    required LoginDevice device,
  }) async {
    calls.add('login');
    lastLogin = (username: username, password: password);
    if (loginError != null) throw loginError!;
    return LoginResult(
      accessToken: 'new-token',
      tokenType: 'Bearer',
      expiresAt: DateTime.now().add(const Duration(hours: 12)),
      user: testUser,
      scope: testScope,
    );
  }

  @override
  Future<void> logout() async {
    calls.add('logout');
    if (logoutError != null) throw logoutError!;
  }

  @override
  Future<SessionInfo> me() async {
    calls.add('me');
    if (meError != null) throw meError!;
    return SessionInfo(
      user: testUser,
      scope: testScope,
      expiresAt: DateTime.now().add(const Duration(hours: 11)),
    );
  }
}

class FakeReferenceRepository implements ReferenceRepository {
  FakeReferenceRepository({this.minAppVersion = '1.0.0'});

  String minAppVersion;

  @override
  Future<RemoteConfig> config() async {
    final json = fixture('config')['data'] as Map<String, dynamic>;
    return RemoteConfig.fromJson({...json, 'min_app_version': minAppVersion});
  }

  @override
  Future<List<FilterOption>> filters() async =>
      (fixture('filters')['data'] as List).cast<Map<String, dynamic>>().map(FilterOption.fromJson).toList();

  @override
  Future<List<RegionOption>> regions() async =>
      (fixture('regions')['data'] as List).cast<Map<String, dynamic>>().map(RegionOption.fromJson).toList();
}

const testConfig = AppConfig(
  env: AppEnv.staging,
  apiBaseUrl: 'https://elite.unetapps.com/mobile/api/v1',
  appVersion: '1.0.0',
  stagingHostIp: '10.0.2.2',
  flavor: 'staging',
);

/// A saved, still-valid session for [store].
Future<void> seedSession(MemorySecureStore store) => SessionStore(store).save(
  SavedSession(
    token: 'stored-token',
    expiresAt: DateTime.now().add(const Duration(hours: 1)),
    user: testUser,
    scope: testScope,
  ),
);

/// Provider overrides for app-level widget tests (no network).
List<Override> appOverrides({
  required MemorySecureStore secure,
  required MemoryPrefs prefs,
  required FakeAuthRepository auth,
  FakeReferenceRepository? reference,
}) => [
  appConfigProvider.overrideWithValue(testConfig),
  appPrefsProvider.overrideWithValue(prefs),
  secureStoreProvider.overrideWithValue(secure),
  authRepositoryProvider.overrideWithValue(auth),
  referenceRepositoryProvider.overrideWithValue(reference ?? FakeReferenceRepository()),
  apiHealthProvider.overrideWith((ref) async => (status: 'ok', version: '1.0.0')),
];
