// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Overridden in `main.dart` with the validated build configuration.

@ProviderFor(appConfig)
final appConfigProvider = AppConfigProvider._();

/// Overridden in `main.dart` with the validated build configuration.

final class AppConfigProvider extends $FunctionalProvider<AppConfig, AppConfig, AppConfig>
    with $Provider<AppConfig> {
  /// Overridden in `main.dart` with the validated build configuration.
  AppConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appConfigProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appConfigHash();

  @$internal
  @override
  $ProviderElement<AppConfig> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  AppConfig create(Ref ref) {
    return appConfig(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppConfig value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<AppConfig>(value));
  }
}

String _$appConfigHash() => r'549adbd5e67e18e10b0abf9ad110abfa319b72a0';

/// Overridden in `main.dart` (the staging CA is loaded asynchronously before runApp).

@ProviderFor(httpClientFactory)
final httpClientFactoryProvider = HttpClientFactoryProvider._();

/// Overridden in `main.dart` (the staging CA is loaded asynchronously before runApp).

final class HttpClientFactoryProvider
    extends $FunctionalProvider<HttpClientFactory, HttpClientFactory, HttpClientFactory>
    with $Provider<HttpClientFactory> {
  /// Overridden in `main.dart` (the staging CA is loaded asynchronously before runApp).
  HttpClientFactoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'httpClientFactoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$httpClientFactoryHash();

  @$internal
  @override
  $ProviderElement<HttpClientFactory> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  HttpClientFactory create(Ref ref) {
    return httpClientFactory(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HttpClientFactory value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<HttpClientFactory>(value));
  }
}

String _$httpClientFactoryHash() => r'1f436ac04b7b0f1d6554bbd173f29537d71e0182';
