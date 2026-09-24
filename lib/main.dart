import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'app.dart';
import 'core/config/app_config.dart';
import 'core/config/config_providers.dart';
import 'core/network/http_client_factory.dart';
import 'core/storage/app_prefs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final info = await PackageInfo.fromPlatform();
  final config = AppConfig.fromEnvironment(appVersion: info.version.split('-').first);

  // Refuse to start on an unsafe or incomplete configuration (e.g. production API in a debug build).
  final problem = config.validate();
  if (problem != null) {
    _runConfigError(problem);
    return;
  }

  final HttpClientFactory httpClientFactory;
  try {
    httpClientFactory = await HttpClientFactory.create(config);
  } on Object catch (e) {
    _runConfigError('Could not load the staging certificate: $e');
    return;
  }

  final prefs = await SharedAppPrefs.load();

  runApp(
    ProviderScope(
      overrides: [
        appPrefsProvider.overrideWithValue(prefs),
        appConfigProvider.overrideWithValue(config),
        httpClientFactoryProvider.overrideWithValue(httpClientFactory),
      ],
      child: const EliteApp(),
    ),
  );
}

/// The error screen has no providers, but every Riverpod app root is a [ProviderScope].
void _runConfigError(String message) => runApp(ProviderScope(child: ConfigErrorApp(message: message)));
