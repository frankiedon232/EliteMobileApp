import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../network/http_client_factory.dart';
import 'app_config.dart';

part 'config_providers.g.dart';

/// Overridden in `main.dart` with the validated build configuration.
@Riverpod(keepAlive: true)
AppConfig appConfig(Ref ref) => throw UnimplementedError('appConfigProvider must be overridden');

/// Overridden in `main.dart` (the staging CA is loaded asynchronously before runApp).
@Riverpod(keepAlive: true)
HttpClientFactory httpClientFactory(Ref ref) =>
    throw UnimplementedError('httpClientFactoryProvider must be overridden');
