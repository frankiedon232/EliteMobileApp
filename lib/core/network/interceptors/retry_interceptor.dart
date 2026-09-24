import 'package:dio/dio.dart';

/// Retries idempotent GETs once after a connection error or connect timeout (flaky mobile networks).
class RetryInterceptor extends Interceptor {
  RetryInterceptor(this._dio, {this.delay = const Duration(milliseconds: 800)});

  final Dio _dio;
  final Duration delay;

  static const _retriedKey = 'elite_retried';

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;
    final retryable =
        options.method == 'GET' &&
        options.extra[_retriedKey] != true &&
        (err.type == DioExceptionType.connectionError || err.type == DioExceptionType.connectionTimeout);
    if (!retryable) return handler.next(err);

    await Future<void>.delayed(delay);
    options.extra[_retriedKey] = true;
    try {
      handler.resolve(await _dio.fetch<Object?>(options));
    } on DioException catch (e) {
      handler.next(e);
    }
  }
}
