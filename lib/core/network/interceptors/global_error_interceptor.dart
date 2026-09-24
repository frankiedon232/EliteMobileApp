import 'package:dio/dio.dart';

import '../api_endpoints.dart';
import '../api_events.dart';

/// 401 (except a failed login) → [ApiEvent.sessionExpired]; 426 → [ApiEvent.upgradeRequired].
/// The error still propagates to the caller as a typed failure.
class GlobalErrorInterceptor extends Interceptor {
  GlobalErrorInterceptor(this._events);

  final ApiEventBus _events;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final status = err.response?.statusCode;
    if (status == 401 && err.requestOptions.path != ApiEndpoints.login) {
      _events.emit(ApiEvent.sessionExpired);
    } else if (status == 426) {
      _events.emit(ApiEvent.upgradeRequired);
    }
    handler.next(err);
  }
}
