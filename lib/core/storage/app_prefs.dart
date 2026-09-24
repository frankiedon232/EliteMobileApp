import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_prefs.g.dart';

/// Non-sensitive settings (never tokens or passwords). Synchronous reads from a cache loaded at startup.
abstract interface class AppPrefs {
  bool get onboardingSeen;
  Future<void> setOnboardingSeen();

  /// "Remember username" (never the password).
  bool get rememberUsername;
  String? get rememberedUsername;
  Future<void> setRememberedUsername({required bool remember, String? username});
}

/// Overridden in `main.dart` with [SharedAppPrefs.load].
@Riverpod(keepAlive: true)
AppPrefs appPrefs(Ref ref) => throw UnimplementedError('appPrefsProvider must be overridden');

class SharedAppPrefs implements AppPrefs {
  SharedAppPrefs(this._prefs);

  static Future<SharedAppPrefs> load() async => SharedAppPrefs(
    await SharedPreferencesWithCache.create(cacheOptions: const SharedPreferencesWithCacheOptions()),
  );

  final SharedPreferencesWithCache _prefs;

  static const _onboardingSeen = 'onboarding_seen';
  static const _rememberUsername = 'remember_username';
  static const _username = 'remembered_username';

  @override
  bool get onboardingSeen => _prefs.getBool(_onboardingSeen) ?? false;

  @override
  Future<void> setOnboardingSeen() => _prefs.setBool(_onboardingSeen, true);

  @override
  bool get rememberUsername => _prefs.getBool(_rememberUsername) ?? true;

  @override
  String? get rememberedUsername => rememberUsername ? _prefs.getString(_username) : null;

  @override
  Future<void> setRememberedUsername({required bool remember, String? username}) async {
    await _prefs.setBool(_rememberUsername, remember);
    if (remember && username != null && username.isNotEmpty) {
      await _prefs.setString(_username, username);
    } else {
      await _prefs.remove(_username);
    }
  }
}
