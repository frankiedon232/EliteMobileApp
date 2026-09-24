// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_prefs.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Overridden in `main.dart` with [SharedAppPrefs.load].

@ProviderFor(appPrefs)
final appPrefsProvider = AppPrefsProvider._();

/// Overridden in `main.dart` with [SharedAppPrefs.load].

final class AppPrefsProvider extends $FunctionalProvider<AppPrefs, AppPrefs, AppPrefs>
    with $Provider<AppPrefs> {
  /// Overridden in `main.dart` with [SharedAppPrefs.load].
  AppPrefsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appPrefsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appPrefsHash();

  @$internal
  @override
  $ProviderElement<AppPrefs> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  AppPrefs create(Ref ref) {
    return appPrefs(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppPrefs value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<AppPrefs>(value));
  }
}

String _$appPrefsHash() => r'ad7feed77cf4cc3fff0e01cafd6147f409f80b19';
