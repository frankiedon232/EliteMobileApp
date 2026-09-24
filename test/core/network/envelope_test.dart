import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elite_mobile/core/error/failures.dart';
import 'package:elite_mobile/core/network/envelope.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/api_harness.dart';

Response<Object?> _error(int status, String? code, {Map<String, List<String>> headers = const {}}) =>
    Response(
      requestOptions: RequestOptions(path: '/x'),
      statusCode: status,
      headers: Headers.fromMap(headers),
      data: code == null
          ? null
          : {
              'success': false,
              'error': {'code': code, 'message': 'Human readable'},
            },
    );

void main() {
  group('Envelope.fromBody', () {
    test('parses data and meta', () {
      final e = Envelope.fromBody(fixture('terminals_page'));
      expect(e.list, hasLength(2));
      expect(e.requireMeta['total'], 312);
    });

    test('empty body (204) → null data', () {
      expect(Envelope.fromBody(null).data, isNull);
      expect(Envelope.fromBody('').data, isNull);
    });

    test('non-envelope body → ServerFailure', () {
      expect(() => Envelope.fromBody('<html>'), throwsA(isA<ServerFailure>()));
      expect(() => Envelope.fromBody({'foo': 1}), throwsA(isA<ServerFailure>()));
    });
  });

  group('failureFromResponse maps every API_CONTRACT §1 code', () {
    final cases = <(int, String, Type)>[
      (400, 'BAD_REQUEST', ValidationFailure),
      (401, 'UNAUTHENTICATED', SessionExpired),
      (401, 'SESSION_EXPIRED', SessionExpired),
      (401, 'INVALID_CREDENTIALS', InvalidCredentials),
      (403, 'ACCOUNT_NOT_CREATED', AccountNotCreated),
      (403, 'ACCOUNT_NOT_APPROVED', AccountNotApproved),
      (403, 'ACCOUNT_LOCKED', AccountLocked),
      (403, 'FORBIDDEN_SCOPE', ForbiddenScope),
      (404, 'NOT_FOUND', NotFound),
      (422, 'VALIDATION_FAILED', ValidationFailure),
      (426, 'UPGRADE_REQUIRED', UpgradeRequired),
      (429, 'RATE_LIMITED', RateLimited),
      (500, 'SERVER_ERROR', ServerFailure),
      (503, 'SERVICE_UNAVAILABLE', ServiceUnavailable),
    ];
    for (final (status, code, type) in cases) {
      test('$status $code → $type', () {
        expect(failureFromResponse(_error(status, code)).runtimeType, type);
      });
    }

    test('falls back on the HTTP status when there is no code', () {
      expect(failureFromResponse(_error(401, null)), isA<SessionExpired>());
      expect(failureFromResponse(_error(404, null)), isA<NotFound>());
      expect(failureFromResponse(_error(426, null)), isA<UpgradeRequired>());
      expect(failureFromResponse(_error(503, null)), isA<ServiceUnavailable>());
      expect((failureFromResponse(_error(502, null)) as ServerFailure).statusCode, 502);
    });

    test('validation details are kept per field', () {
      final r = Response<Object?>(
        requestOptions: RequestOptions(path: '/terminals'),
        statusCode: 422,
        data: fixture('error_validation'),
      );
      final f = failureFromResponse(r) as ValidationFailure;
      expect(f.message, 'Human readable');
      expect(f.details['per_page'], ['must be at most 100']);
      expect(f.details.keys, containsAll(['per_page', 'sort']));
    });

    test('RATE_LIMITED reads Retry-After', () {
      final f = failureFromResponse(
        _error(
          429,
          'RATE_LIMITED',
          headers: {
            'retry-after': ['120'],
          },
        ),
      ) as RateLimited;
      expect(f.retryAfter, const Duration(seconds: 120));
    });
  });

  group('failureFromDio', () {
    DioException ex(DioExceptionType type, {Object? error}) => DioException(
      requestOptions: RequestOptions(path: '/x'),
      type: type,
      error: error,
    );

    test('timeouts → NetworkFailure.timeout', () {
      for (final t in [
        DioExceptionType.connectionTimeout,
        DioExceptionType.receiveTimeout,
        DioExceptionType.sendTimeout,
      ]) {
        final f = failureFromDio(ex(t));
        expect(f, isA<NetworkFailure>());
        expect((f as NetworkFailure).isTimeout, isTrue);
      }
    });

    test('connection problems and TLS errors → NetworkFailure', () {
      expect(failureFromDio(ex(DioExceptionType.connectionError)), isA<NetworkFailure>());
      expect(failureFromDio(ex(DioExceptionType.badCertificate)), isA<NetworkFailure>());
      expect(
        failureFromDio(ex(DioExceptionType.unknown, error: const SocketException('no route'))),
        isA<NetworkFailure>(),
      );
      expect(
        failureFromDio(ex(DioExceptionType.unknown, error: const HandshakeException('bad cert'))),
        isA<NetworkFailure>(),
      );
    });
  });
}
