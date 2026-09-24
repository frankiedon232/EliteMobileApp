import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/config/config_providers.dart';
import '../../../core/error/failures.dart';
import '../../../core/network/api_client.dart';
import '../../../core/network/api_events.dart';
import '../../../core/storage/app_prefs.dart';
import '../../../core/utils/app_version.dart';
import '../../reference/data/reference_repository_impl.dart';
import '../data/auth_repository_impl.dart';
import '../data/session_store.dart';
import '../domain/auth_models.dart';

part 'session_controller.g.dart';

sealed class SessionState {
  const SessionState();
}

/// App start: checking the stored token.
final class SessionRestoring extends SessionState {
  const SessionRestoring();
}

final class SignedOut extends SessionState {
  const SignedOut({this.message});

  /// Shown on the login screen, e.g. "Your session has expired".
  final String? message;
}

final class SignedIn extends SessionState {
  const SignedIn({required this.user, required this.scope, required this.expiresAt, this.offline = false});

  final User user;
  final Scope scope;
  final DateTime expiresAt;

  /// Restored from storage without reaching the server (no network); data screens show cached data.
  final bool offline;
}

/// Holds the session (docs/ARCHITECTURE.md §3). Token in secure storage; `/auth/me` on start;
/// any 401 from the API → signed out with a "session expired" message.
@Riverpod(keepAlive: true)
class Session extends _$Session {
  @override
  SessionState build() {
    final sub = ref.watch(apiEventBusProvider).stream.listen((e) {
      if (e == ApiEvent.sessionExpired && state is SignedIn) {
        unawaited(_endSession(const SignedOut(message: SessionExpired.defaultMessage)));
      }
    });
    ref.onDispose(sub.cancel);
    unawaited(Future.microtask(_restore));
    return const SessionRestoring();
  }

  SessionStore get _store => ref.read(sessionStoreProvider);

  Future<void> _restore() async {
    final saved = await _store.load();
    if (saved == null) {
      state = const SignedOut();
      return;
    }
    if (!saved.expiresAt.isAfter(DateTime.now())) {
      await _endSession(const SignedOut(message: SessionExpired.defaultMessage));
      return;
    }
    ref.read(authTokenProvider.notifier).set(saved.token);
    try {
      final me = await ref.read(authRepositoryProvider).me();
      await _store.save(
        SavedSession(token: saved.token, expiresAt: me.expiresAt, user: me.user, scope: me.scope),
      );
      state = SignedIn(user: me.user, scope: me.scope, expiresAt: me.expiresAt);
    } on SessionExpired {
      await _endSession(const SignedOut(message: SessionExpired.defaultMessage));
    } on Failure {
      // Offline / server trouble: keep the stored session; the next API call re-validates it.
      state = SignedIn(user: saved.user, scope: saved.scope, expiresAt: saved.expiresAt, offline: true);
    }
  }

  /// `POST /auth/login`. Throws a [Failure] for the login screen to show.
  Future<void> login({required String username, required String password}) async {
    final config = ref.read(appConfigProvider);
    final result = await ref
        .read(authRepositoryProvider)
        .login(
          username: username.trim(),
          password: password,
          device: LoginDevice(platform: Platform.isIOS ? 'ios' : 'android', appVersion: config.appVersion),
        );
    await _store.save(
      SavedSession(
        token: result.accessToken,
        expiresAt: result.expiresAt,
        user: result.user,
        scope: result.scope,
      ),
    );
    ref.read(authTokenProvider.notifier).set(result.accessToken);
    state = SignedIn(user: result.user, scope: result.scope, expiresAt: result.expiresAt);
  }

  /// Revokes the token (best effort), clears the session, keeps the onboarding flag.
  /// Push-token removal is added in M7.
  Future<void> logout() async {
    try {
      await ref.read(authRepositoryProvider).logout();
    } on Failure {
      // Offline or already expired: the local session is cleared anyway.
    }
    await _endSession(const SignedOut());
  }

  Future<void> _endSession(SignedOut next) async {
    ref.read(authTokenProvider.notifier).set(null);
    await _store.clear();
    state = next;
  }
}

/// True when this build is too old: a 426 from the API, or `GET /config` → `min_app_version`.
@Riverpod(keepAlive: true)
class ForceUpdate extends _$ForceUpdate {
  @override
  bool build() {
    final sub = ref.watch(apiEventBusProvider).stream.listen((e) {
      if (e == ApiEvent.upgradeRequired) state = true;
    });
    ref.onDispose(sub.cancel);
    unawaited(Future.microtask(_checkMinimumVersion));
    return false;
  }

  Future<void> _checkMinimumVersion() async {
    try {
      final config = await ref.read(referenceRepositoryProvider).config();
      if (isVersionBelow(ref.read(appConfigProvider).appVersion, config.minAppVersion)) state = true;
    } on Failure catch (e) {
      debugPrint('config check skipped: ${e.runtimeType}');
    }
  }
}

/// Whether the 3-slide onboarding has been seen (kept across logouts).
@Riverpod(keepAlive: true)
class OnboardingSeen extends _$OnboardingSeen {
  @override
  bool build() => ref.watch(appPrefsProvider).onboardingSeen;

  Future<void> complete() async {
    await ref.read(appPrefsProvider).setOnboardingSeen();
    state = true;
  }
}
