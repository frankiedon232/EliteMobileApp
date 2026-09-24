import 'package:dio/dio.dart';

import '../api_endpoints.dart';

/// Adds `Authorization: Bearer <token>` to every non-public request.
/// (`X-App-Version` and `X-Platform` are base headers, set in `buildDio`.)
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._token);

  /// Returns the current access token, or null when signed out.
  final String? Function() _token;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _token();
    if (token != null && token.isNotEmpty && !ApiEndpoints.public.contains(options.path)) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}
