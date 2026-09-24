import 'dart:io' show HandshakeException, SocketException, TlsException;

import 'package:dio/dio.dart';

import '../error/failures.dart';

typedef Json = Map<String, dynamic>;

/// A parsed success envelope: `{ "success": true, "data": …, "meta": {…}? }` (API_CONTRACT §1).
class Envelope {
  const Envelope({this.data, this.meta});

  /// Parses a success body. A 204 / empty body gives an envelope with null data.
  factory Envelope.fromBody(Object? body) {
    if (body == null || (body is String && body.isEmpty)) return const Envelope();
    if (body is! Json || body['success'] != true) {
      throw const ServerFailure('Unexpected response from the server.');
    }
    return Envelope(data: body['data'], meta: body['meta'] as Json?);
  }

  final Object? data;
  final Json? meta;

  Json get object {
    final d = data;
    if (d is Json) return d;
    throw const ServerFailure('Unexpected response from the server.');
  }

  List<Json> get list {
    final d = data;
    if (d is List) return d.cast<Json>();
    throw const ServerFailure('Unexpected response from the server.');
  }

  Json get requireMeta => meta ?? (throw const ServerFailure('Unexpected response from the server.'));
}

/// Converts any Dio error into a typed [Failure] using the error envelope's `code`.
Failure failureFromDio(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.transformTimeout:
      return const NetworkFailure.timeout();
    case DioExceptionType.connectionError:
    case DioExceptionType.badCertificate:
      return const NetworkFailure();
    case DioExceptionType.unknown:
      final inner = e.error;
      if (inner is Failure) return inner;
      if (inner is SocketException || inner is HandshakeException || inner is TlsException) {
        return const NetworkFailure();
      }
      return const ServerFailure();
    case DioExceptionType.cancel:
      return const NetworkFailure('Request cancelled.');
    case DioExceptionType.badResponse:
      final response = e.response;
      return response == null ? const ServerFailure() : failureFromResponse(response);
  }
}

/// Maps an error response (non-2xx) to a [Failure] (API_CONTRACT §1 table).
Failure failureFromResponse(Response<Object?> response) {
  final status = response.statusCode;
  final body = response.data;
  final error = body is Json ? body['error'] : null;
  final code = error is Json ? error['code'] as String? : null;
  final serverMessage = error is Json ? error['message'] as String? : null;

  switch (code) {
    case 'INVALID_CREDENTIALS':
      return const InvalidCredentials();
    case 'ACCOUNT_NOT_CREATED':
      return const AccountNotCreated();
    case 'ACCOUNT_NOT_APPROVED':
      return const AccountNotApproved();
    case 'ACCOUNT_LOCKED':
      return const AccountLocked();
    case 'UNAUTHENTICATED':
    case 'SESSION_EXPIRED':
      return const SessionExpired();
    case 'FORBIDDEN_SCOPE':
      return const ForbiddenScope();
    case 'NOT_FOUND':
      return const NotFound();
    case 'VALIDATION_FAILED':
    case 'BAD_REQUEST':
      return ValidationFailure(
        serverMessage ?? 'Some of the values sent were not accepted.',
        details: _details(error is Json ? error['details'] : null),
      );
    case 'RATE_LIMITED':
      return RateLimited(retryAfter: _retryAfter(response.headers.value('retry-after')));
    case 'UPGRADE_REQUIRED':
      return const UpgradeRequired();
    case 'SERVICE_UNAVAILABLE':
      return const ServiceUnavailable();
    case 'SERVER_ERROR':
      return ServerFailure(const ServerFailure().message, status);
  }

  // No (known) code: fall back on the HTTP status.
  return switch (status) {
    401 => const SessionExpired(),
    403 => const ForbiddenScope(),
    404 => const NotFound(),
    422 || 400 => ValidationFailure(serverMessage ?? 'Some of the values sent were not accepted.'),
    426 => const UpgradeRequired(),
    429 => RateLimited(retryAfter: _retryAfter(response.headers.value('retry-after'))),
    503 => const ServiceUnavailable(),
    _ => ServerFailure(const ServerFailure().message, status),
  };
}

Map<String, List<String>> _details(Object? raw) {
  if (raw is! Json) return const {};
  return {
    for (final entry in raw.entries)
      entry.key: switch (entry.value) {
        final List<Object?> reasons => reasons.map((r) => '$r').toList(),
        final Object? v => ['$v'],
      },
  };
}

Duration? _retryAfter(String? header) {
  final seconds = int.tryParse(header?.trim() ?? '');
  return seconds == null ? null : Duration(seconds: seconds);
}
