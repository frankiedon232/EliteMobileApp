// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terminal_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(terminalRepository)
final terminalRepositoryProvider = TerminalRepositoryProvider._();

final class TerminalRepositoryProvider
    extends $FunctionalProvider<TerminalRepository, TerminalRepository, TerminalRepository>
    with $Provider<TerminalRepository> {
  TerminalRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'terminalRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$terminalRepositoryHash();

  @$internal
  @override
  $ProviderElement<TerminalRepository> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  TerminalRepository create(Ref ref) {
    return terminalRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TerminalRepository value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<TerminalRepository>(value));
  }
}

String _$terminalRepositoryHash() => r'f4c3befb77d1b8074ecea65e46fdd37926ac3e12';
