import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show appFlavor;

/// Build environment. Chosen at build time (`--dart-define`), never at runtime from user input.
enum AppEnv { staging, production }

/// Build-time configuration from `--dart-define` / `--dart-define-from-file=.env.dev.json`.
@immutable
class AppConfig {
  const AppConfig({
    required this.env,
    required this.apiBaseUrl,
    required this.appVersion,
    this.stagingHostIp,
    this.flavor,
  });

  /// Reads the compile-time defines. [appVersion] comes from package_info at startup.
  factory AppConfig.fromEnvironment({required String appVersion}) {
    const env = String.fromEnvironment('ENV', defaultValue: 'staging');
    const baseUrl = String.fromEnvironment('API_BASE_URL');
    const hostIp = String.fromEnvironment('STAGING_HOST_IP');
    return AppConfig(
      env: env == 'production' ? AppEnv.production : AppEnv.staging,
      apiBaseUrl: baseUrl.trim(),
      appVersion: appVersion,
      stagingHostIp: hostIp.trim().isEmpty ? null : hostIp.trim(),
      flavor: appFlavor,
    );
  }

  final AppEnv env;
  final String apiBaseUrl;

  /// Sent as `X-App-Version` (x.y.z).
  final String appVersion;

  /// Staging only: LAN IP the socket connects to while TLS keeps the hostname (API_CONTRACT §0).
  final String? stagingHostIp;

  /// Native build flavor (`staging` / `production`), from `--flavor`.
  final String? flavor;

  static const connectTimeout = Duration(seconds: 15);
  static const receiveTimeout = Duration(seconds: 30);

  bool get isStaging => env == AppEnv.staging;

  /// Returns why this build must not start, or null when the configuration is safe.
  ///
  /// [releaseMode] is injectable for tests; the app passes [kReleaseMode].
  String? validate({bool releaseMode = kReleaseMode}) {
    if (apiBaseUrl.isEmpty) {
      return 'API_BASE_URL is not set. Run with --dart-define-from-file=.env.dev.json.';
    }
    final uri = Uri.tryParse(apiBaseUrl);
    if (uri == null || !uri.hasScheme || uri.host.isEmpty) {
      return 'API_BASE_URL is not a valid URL: $apiBaseUrl';
    }
    if (uri.scheme != 'https') {
      return 'API_BASE_URL must use https.';
    }
    // Production guard (CLAUDE.md §5): debug/profile builds never talk to the bank's production API.
    if (!releaseMode && uri.host.toLowerCase().contains('providusbank.com')) {
      return 'Debug and profile builds must not use the production API ($apiBaseUrl). '
          'Use the staging API from .env.dev.json.';
    }
    if (isStaging && flavor != 'staging') {
      return 'ENV=staging needs the staging flavor (it bundles the staging CA). Run with --flavor staging.';
    }
    if (!isStaging && flavor != 'production') {
      return 'ENV=production needs the production flavor. Build with --flavor production.';
    }
    return null;
  }
}
