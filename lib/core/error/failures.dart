/// Typed failures. Repositories throw these (never DioException); widgets show [Failure.message].
///
/// Maps the error codes of docs/API_CONTRACT.md §1 plus client-side network problems.
sealed class Failure implements Exception {
  const Failure(this.message);

  /// Human-readable, safe to show to the user.
  final String message;

  @override
  String toString() => '$runtimeType: $message';
}

/// 401 INVALID_CREDENTIALS.
final class InvalidCredentials extends Failure {
  const InvalidCredentials([super.message = 'Incorrect username or password.']);
}

/// 403 ACCOUNT_NOT_CREATED: AD user without an Elite account.
final class AccountNotCreated extends Failure {
  const AccountNotCreated([
    super.message = 'Your account is not set up on Elite yet. Contact your administrator.',
  ]);
}

/// 403 ACCOUNT_NOT_APPROVED.
final class AccountNotApproved extends Failure {
  const AccountNotApproved([super.message = 'Your Elite account has not been approved yet.']);
}

/// 403 ACCOUNT_LOCKED.
final class AccountLocked extends Failure {
  const AccountLocked([super.message = 'Your Elite account is locked. Contact your administrator.']);
}

/// 401 SESSION_EXPIRED or UNAUTHENTICATED: the stored session is no longer valid.
final class SessionExpired extends Failure {
  const SessionExpired([super.message = 'Your session has expired. Please sign in again.']);
}

/// 403 FORBIDDEN_SCOPE.
final class ForbiddenScope extends Failure {
  const ForbiddenScope([super.message = 'That region or terminal is outside your access scope.']);
}

/// 404 NOT_FOUND (also used for terminals outside the user's scope).
final class NotFound extends Failure {
  const NotFound([super.message = 'Not found.']);
}

/// 422 VALIDATION_FAILED (and 400 BAD_REQUEST), with per-field reasons.
final class ValidationFailure extends Failure {
  const ValidationFailure(super.message, {this.details = const {}});

  final Map<String, List<String>> details;
}

/// 429 RATE_LIMITED. [retryAfter] comes from the `Retry-After` header.
final class RateLimited extends Failure {
  const RateLimited({this.retryAfter, String message = 'Too many attempts. Please wait and try again.'})
    : super(message);

  final Duration? retryAfter;
}

/// 426 UPGRADE_REQUIRED.
final class UpgradeRequired extends Failure {
  const UpgradeRequired([super.message = 'A newer version of Elite Mobile is required.']);
}

/// 503 SERVICE_UNAVAILABLE: database or Active Directory unreachable.
final class ServiceUnavailable extends Failure {
  const ServiceUnavailable([super.message = 'Elite is temporarily unavailable. Please try again shortly.']);
}

/// No connection, DNS/TLS failure or timeout.
final class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Cannot reach Elite. Check your connection and try again.'])
    : isTimeout = false;

  const NetworkFailure.timeout([super.message = 'The server took too long to respond. Please try again.'])
    : isTimeout = true;

  final bool isTimeout;
}

/// 500 SERVER_ERROR, unexpected status codes and unparseable responses.
final class ServerFailure extends Failure {
  const ServerFailure([
    super.message = 'Something went wrong on the server. Please try again.',
    this.statusCode,
  ]);

  final int? statusCode;
}
