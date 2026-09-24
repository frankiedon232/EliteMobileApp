import 'dart:io';

import 'package:flutter/services.dart';

import '../config/app_config.dart';

/// Asset path of the mkcert PUBLIC root CA. Packaged only in the `staging` flavor (see pubspec.yaml).
const stagingCaAsset = 'assets/certs/staging_ca.pem';

/// Creates `dart:io` HttpClients for Dio's IOHttpClientAdapter.
///
/// Staging (API_CONTRACT §0): trusts the bundled mkcert root in addition to the system roots, with
/// hostname and certificate checks on, and optionally connects the socket to [AppConfig.stagingHostIp]
/// while TLS still uses the URL's hostname (SNI + certificate check).
/// Production: the default HttpClient (system roots, normal DNS).
class HttpClientFactory {
  HttpClientFactory._(this._config, this._context);

  final AppConfig _config;
  final SecurityContext? _context;

  /// Loads the staging CA for staging builds. Throws if the asset is missing.
  static Future<HttpClientFactory> create(AppConfig config) async {
    if (!config.isStaging) return HttpClientFactory._(config, null);
    final ca = await rootBundle.load(stagingCaAsset);
    final context = SecurityContext(withTrustedRoots: true)
      ..setTrustedCertificatesBytes(ca.buffer.asUint8List(ca.offsetInBytes, ca.lengthInBytes));
    return HttpClientFactory._(config, context);
  }

  HttpClient call() {
    final context = _context;
    if (context == null) return HttpClient();

    final client = HttpClient(context: context);
    final hostIp = _config.stagingHostIp;
    if (hostIp != null) {
      client.connectionFactory = (uri, proxyHost, proxyPort) async {
        final task = await Socket.startConnect(hostIp, uri.port);
        return ConnectionTask.fromSocket(
          task.socket.then((socket) => SecureSocket.secure(socket, host: uri.host, context: context)),
          task.cancel,
        );
      };
    }
    return client;
  }
}
