import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elite_mobile/core/config/app_config.dart';
import 'package:elite_mobile/core/network/api_client.dart';
import 'package:elite_mobile/core/network/api_events.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

/// Loads `test/fixtures/<name>.json` (examples taken from docs/API_CONTRACT.md).
Map<String, dynamic> fixture(String name) =>
    jsonDecode(File('test/fixtures/$name.json').readAsStringSync()) as Map<String, dynamic>;

/// A real [ApiClient] + interceptors over a mocked transport. Routes match on method + path only;
/// assert on [requests] for query strings and headers.
class ApiHarness {
  ApiHarness({this.token}) {
    dio = buildDio(
      const AppConfig(
        env: AppEnv.staging,
        apiBaseUrl: 'https://elite.unetapps.com/mobile/api/v1',
        appVersion: '1.0.0',
        flavor: 'staging',
      ),
      HttpClient.new,
      token: () => token,
      events: events,
      log: false,
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          requests.add(options);
          handler.next(options);
        },
      ),
    );
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    client = ApiClient(dio);
    events.stream.listen(emitted.add);
  }

  String? token;
  final events = ApiEventBus();
  final emitted = <ApiEvent>[];
  final requests = <RequestOptions>[];
  late final Dio dio;
  late final DioAdapter adapter;
  late final ApiClient client;

  RequestOptions get last => requests.last;

  /// The request's query string exactly as sent (decoded brackets for readability).
  String get lastQuery => Uri.decodeQueryComponent(last.uri.query);

  void onGet(String path, int status, Object? body, {Map<String, List<String>> headers = const {}}) =>
      adapter.onGet(path, (s) => s.reply(status, body, headers: _json(headers)));

  void onPost(String path, int status, Object? body, {Map<String, List<String>> headers = const {}}) =>
      adapter.onPost(path, (s) => s.reply(status, body, headers: _json(headers)), data: Matchers.any);

  void onPut(String path, int status, Object? body) =>
      adapter.onPut(path, (s) => s.reply(status, body, headers: _json(const {})), data: Matchers.any);

  void onDelete(String path, int status, Object? body) =>
      adapter.onDelete(path, (s) => s.reply(status, body, headers: _json(const {})));

  /// The mock only JSON-encodes bodies when the response declares a JSON content type.
  static Map<String, List<String>> _json(Map<String, List<String>> headers) => {
    Headers.contentTypeHeader: [Headers.jsonContentType],
    ...headers,
  };
}
