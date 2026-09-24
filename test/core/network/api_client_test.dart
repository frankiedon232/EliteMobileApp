import 'dart:io';

import 'package:elite_mobile/core/config/app_config.dart';
import 'package:elite_mobile/core/network/api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  const config = AppConfig(
    env: AppEnv.staging,
    apiBaseUrl: 'https://elite.unetapps.com/mobile/api/v1',
    appVersion: '1.2.3',
    flavor: 'staging',
  );

  test('sends X-App-Version / X-Platform and resolves paths under /mobile/api/v1', () async {
    final dio = buildDio(config, HttpClient.new);
    DioAdapter(dio: dio).onGet(
      '/health',
      (server) => server.reply(200, {
        'success': true,
        'data': {'status': 'ok', 'version': '1.0.0'},
      }),
    );

    final response = await dio.get<Map<String, dynamic>>('/health');

    expect(response.requestOptions.uri.toString(), 'https://elite.unetapps.com/mobile/api/v1/health');
    expect(response.requestOptions.headers['X-App-Version'], '1.2.3');
    expect(response.requestOptions.headers['X-Platform'], anyOf('android', 'ios'));
    expect(response.data?['data'], {'status': 'ok', 'version': '1.0.0'});
  });

  test('timeouts follow docs/ARCHITECTURE.md §4', () {
    final dio = buildDio(config, HttpClient.new);
    expect(dio.options.connectTimeout, const Duration(seconds: 15));
    expect(dio.options.receiveTimeout, const Duration(seconds: 30));
  });
}
