// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_events.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(apiEventBus)
final apiEventBusProvider = ApiEventBusProvider._();

final class ApiEventBusProvider extends $FunctionalProvider<ApiEventBus, ApiEventBus, ApiEventBus>
    with $Provider<ApiEventBus> {
  ApiEventBusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiEventBusProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiEventBusHash();

  @$internal
  @override
  $ProviderElement<ApiEventBus> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  ApiEventBus create(Ref ref) {
    return apiEventBus(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiEventBus value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<ApiEventBus>(value));
  }
}

String _$apiEventBusHash() => r'8c725efac2b345b25f244f79f8261261b659b914';
