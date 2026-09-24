import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/storage/secure_store.dart';
import '../domain/auth_models.dart';

part 'session_store.g.dart';

/// A signed-in session as persisted between launches.
class SavedSession {
  const SavedSession({required this.token, required this.expiresAt, required this.user, required this.scope});

  final String token;
  final DateTime expiresAt;
  final User user;
  final Scope scope;
}

@Riverpod(keepAlive: true)
SessionStore sessionStore(Ref ref) => SessionStore(ref.watch(secureStoreProvider));

/// Persists the session in secure storage only (token, expiry, user and scope).
class SessionStore {
  SessionStore(this._store);

  final SecureStore _store;

  static const _token = 'session.token';
  static const _expiresAt = 'session.expires_at';
  static const _user = 'session.user';
  static const _scope = 'session.scope';
  static const keys = [_token, _expiresAt, _user, _scope];

  Future<SavedSession?> load() async {
    try {
      final token = await _store.read(_token);
      final expires = await _store.read(_expiresAt);
      final user = await _store.read(_user);
      final scope = await _store.read(_scope);
      if (token == null || expires == null || user == null || scope == null) return null;
      return SavedSession(
        token: token,
        expiresAt: DateTime.parse(expires),
        user: User.fromJson(jsonDecode(user) as Map<String, dynamic>),
        scope: Scope.fromJson(jsonDecode(scope) as Map<String, dynamic>),
      );
    } on Object {
      // Corrupt or unreadable storage (e.g. restored backup): start signed out.
      await clear();
      return null;
    }
  }

  Future<void> save(SavedSession s) async {
    await _store.write(_token, s.token);
    await _store.write(_expiresAt, s.expiresAt.toUtc().toIso8601String());
    await _store.write(_user, jsonEncode(s.user.toJson()));
    await _store.write(_scope, jsonEncode(s.scope.toJson()));
  }

  Future<void> clear() => _store.delete(keys);
}
