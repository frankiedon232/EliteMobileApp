import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../config/app_config.dart';
import '../config/config_providers.dart';
import 'api_events.dart';
import 'envelope.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/debug_log_interceptor.dart';
import 'interceptors/global_error_interceptor.dart';
import 'interceptors/retry_interceptor.dart';

part 'api_client.g.dart';

/// The in-memory access token used by [AuthInterceptor]. The session layer (M2) sets it after
/// login / restore and clears it on logout; the persisted copy lives in secure storage.
@Riverpod(keepAlive: true)
class AuthToken extends _$AuthToken {
  @override
  String? build() => null;

  void set(String? token) => state = token;
}

/// The single Dio instance for the v1 API.
@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final config = ref.watch(appConfigProvider);
  final factory = ref.watch(httpClientFactoryProvider);
  return buildDio(
    config,
    factory.call,
    token: () => ref.read(authTokenProvider),
    events: ref.watch(apiEventBusProvider),
  );
}

@Riverpod(keepAlive: true)
ApiClient apiClient(Ref ref) => ApiClient(ref.watch(dioProvider));

Dio buildDio(
  AppConfig config,
  HttpClient Function() createHttpClient, {
  String? Function()? token,
  ApiEventBus? events,
  bool log = kDebugMode,
}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: config.apiBaseUrl,
      connectTimeout: AppConfig.connectTimeout,
      receiveTimeout: AppConfig.receiveTimeout,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      // Multi-value params are sent as repeated `key[]=` pairs (API_CONTRACT §3 /terminals).
      listFormat: ListFormat.multi,
      headers: {
        'Accept': 'application/json',
        'X-App-Version': config.appVersion,
        'X-Platform': Platform.isIOS ? 'ios' : 'android',
      },
    ),
  );
  dio.httpClientAdapter = IOHttpClientAdapter(createHttpClient: createHttpClient);
  dio.interceptors.addAll([
    if (token != null) AuthInterceptor(token),
    RetryInterceptor(dio),
    if (events != null) GlobalErrorInterceptor(events),
    if (log) DebugLogInterceptor(),
  ]);
  return dio;
}

/// Thin wrapper over Dio: parses the envelope and turns every error into a typed `Failure`.
class ApiClient {
  ApiClient(this._dio);

  final Dio _dio;

  Future<Envelope> get(String path, {Map<String, Object?>? query}) =>
      _send(() => _dio.get<Object?>(path, queryParameters: _clean(query)));

  Future<Envelope> post(String path, {Object? body}) => _send(() => _dio.post<Object?>(path, data: body));

  Future<Envelope> put(String path, {Object? body}) => _send(() => _dio.put<Object?>(path, data: body));

  Future<Envelope> delete(String path) => _send(() => _dio.delete<Object?>(path));

  /// Streams a file download (e.g. CSV export) to [savePath]; returns the response headers.
  Future<Headers> download(String path, String savePath, {Map<String, Object?>? query}) async {
    try {
      final response = await _dio.download(
        path,
        savePath,
        queryParameters: _clean(query),
        options: Options(headers: {'Accept': 'text/csv, application/json'}),
      );
      return response.headers;
    } on DioException catch (e) {
      throw failureFromDio(e);
    }
  }

  Future<Envelope> _send(Future<Response<Object?>> Function() request) async {
    try {
      final response = await request();
      return Envelope.fromBody(response.data);
    } on DioException catch (e) {
      throw failureFromDio(e);
    }
  }

  /// Drops null / empty values so optional params are omitted rather than sent blank.
  static Map<String, Object?>? _clean(Map<String, Object?>? query) {
    if (query == null) return null;
    return {
      for (final e in query.entries)
        if (e.value != null &&
            !(e.value is String && (e.value! as String).isEmpty) &&
            !(e.value is List && (e.value! as List).isEmpty))
          e.key: e.value,
    };
  }
}
