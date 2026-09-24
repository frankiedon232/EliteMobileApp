import 'auth_models.dart';

abstract interface class AuthRepository {
  /// `POST /auth/login`. Throws InvalidCredentials, AccountNotCreated, AccountNotApproved,
  /// AccountLocked, RateLimited, ServiceUnavailable, ValidationFailure, NetworkFailure.
  Future<LoginResult> login({
    required String username,
    required String password,
    required LoginDevice device,
  });

  /// `POST /auth/logout`: revokes the current token.
  Future<void> logout();

  /// `GET /auth/me`: validates the stored token (SessionExpired if not).
  Future<SessionInfo> me();
}
