import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Debug-only request log: method, path, status and duration. Never headers (token) or bodies
/// (passwords, full responses). Not added in release builds.
class DebugLogInterceptor extends Interceptor {
  static const _startKey = 'elite_started';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.extra[_startKey] = DateTime.now();
    handler.next(options);
  }

  @override
  void onResponse(Response<Object?> response, ResponseInterceptorHandler handler) {
    _log(response.requestOptions, response.statusCode);
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _log(err.requestOptions, err.response?.statusCode, err.type.name);
    handler.next(err);
  }

  void _log(RequestOptions o, int? status, [String? error]) {
    final started = o.extra[_startKey];
    final ms = started is DateTime ? DateTime.now().difference(started).inMilliseconds : null;
    debugPrint('[api] ${o.method} ${o.path} → ${status ?? error} ${ms == null ? '' : '(${ms}ms)'}');
  }
}
