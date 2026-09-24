// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(referenceRepository)
final referenceRepositoryProvider = ReferenceRepositoryProvider._();

final class ReferenceRepositoryProvider
    extends $FunctionalProvider<ReferenceRepository, ReferenceRepository, ReferenceRepository>
    with $Provider<ReferenceRepository> {
  ReferenceRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'referenceRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$referenceRepositoryHash();

  @$internal
  @override
  $ProviderElement<ReferenceRepository> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  ReferenceRepository create(Ref ref) {
    return referenceRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReferenceRepository value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<ReferenceRepository>(value));
  }
}

String _$referenceRepositoryHash() => r'ce61fa153311b415172268ce37c992c5fa40a27b';
