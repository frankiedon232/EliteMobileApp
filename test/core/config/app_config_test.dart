import 'package:elite_mobile/core/config/app_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  AppConfig config({
    AppEnv env = AppEnv.staging,
    String url = 'https://elite.unetapps.com/mobile/api/v1',
    String? flavor = 'staging',
  }) => AppConfig(env: env, apiBaseUrl: url, appVersion: '1.0.0', flavor: flavor);

  group('AppConfig.validate', () {
    test('accepts the staging API in a staging debug build', () {
      expect(config().validate(releaseMode: false), isNull);
    });

    test('production guard: debug/profile builds refuse the bank API', () {
      final c = config(
        env: AppEnv.production,
        url: 'https://elitesolution.providusbank.com/mobile/api/v1',
        flavor: 'production',
      );
      expect(c.validate(releaseMode: false), contains('must not use the production API'));
      expect(c.validate(releaseMode: true), isNull);
    });

    test('production guard is case-insensitive and applies to any env', () {
      final c = config(url: 'https://ELITESOLUTION.ProvidusBank.com/mobile/api/v1');
      expect(c.validate(releaseMode: false), isNotNull);
    });

    test('requires a base URL', () {
      expect(config(url: '').validate(releaseMode: false), contains('API_BASE_URL is not set'));
    });

    test('requires https', () {
      expect(
        config(url: 'http://elite.unetapps.com/mobile/api/v1').validate(releaseMode: false),
        contains('https'),
      );
    });

    test('ENV must match the native flavor (the staging CA lives only in the staging flavor)', () {
      expect(config(flavor: null).validate(releaseMode: false), contains('--flavor staging'));
      expect(config(flavor: 'production').validate(releaseMode: false), contains('--flavor staging'));
      expect(
        config(
          env: AppEnv.production,
          url: 'https://example.com/mobile/api/v1',
          flavor: 'staging',
        ).validate(releaseMode: true),
        contains('production flavor'),
      );
    });
  });
}
