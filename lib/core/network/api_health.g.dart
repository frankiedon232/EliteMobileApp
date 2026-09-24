// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_health.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Connectivity check against the configured API. Used by the M0 shell and later by About.

@ProviderFor(apiHealth)
final apiHealthProvider = ApiHealthProvider._();

/// Connectivity check against the configured API. Used by the M0 shell and later by About.

final class ApiHealthProvider
    extends $FunctionalProvider<AsyncValue<ApiHealth>, ApiHealth, FutureOr<ApiHealth>>
    with $FutureModifier<ApiHealth>, $FutureProvider<ApiHealth> {
  /// Connectivity check against the configured API. Used by the M0 shell and later by About.
  ApiHealthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiHealthProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiHealthHash();

  @$internal
  @override
  $FutureProviderElement<ApiHealth> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<ApiHealth> create(Ref ref) {
    return apiHealth(ref);
  }
}

String _$apiHealthHash() => r'80a39556cf910b2119225ac6152b1001bd8dffb2';
