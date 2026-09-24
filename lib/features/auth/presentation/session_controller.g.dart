// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Holds the session (docs/ARCHITECTURE.md §3). Token in secure storage; `/auth/me` on start;
/// any 401 from the API → signed out with a "session expired" message.

@ProviderFor(Session)
final sessionProvider = SessionProvider._();

/// Holds the session (docs/ARCHITECTURE.md §3). Token in secure storage; `/auth/me` on start;
/// any 401 from the API → signed out with a "session expired" message.
final class SessionProvider extends $NotifierProvider<Session, SessionState> {
  /// Holds the session (docs/ARCHITECTURE.md §3). Token in secure storage; `/auth/me` on start;
  /// any 401 from the API → signed out with a "session expired" message.
  SessionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionHash();

  @$internal
  @override
  Session create() => Session();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SessionState value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<SessionState>(value));
  }
}

String _$sessionHash() => r'0ec90029035cc8d624dabfebc59911ea9e381bba';

/// Holds the session (docs/ARCHITECTURE.md §3). Token in secure storage; `/auth/me` on start;
/// any 401 from the API → signed out with a "session expired" message.

abstract class _$Session extends $Notifier<SessionState> {
  SessionState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<SessionState, SessionState>;
    final element =
        ref.element
            as $ClassProviderElement<AnyNotifier<SessionState, SessionState>, SessionState, Object?, Object?>;
    return element.handleCreate(ref, build);
  }
}

/// True when this build is too old: a 426 from the API, or `GET /config` → `min_app_version`.

@ProviderFor(ForceUpdate)
final forceUpdateProvider = ForceUpdateProvider._();

/// True when this build is too old: a 426 from the API, or `GET /config` → `min_app_version`.
final class ForceUpdateProvider extends $NotifierProvider<ForceUpdate, bool> {
  /// True when this build is too old: a 426 from the API, or `GET /config` → `min_app_version`.
  ForceUpdateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'forceUpdateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$forceUpdateHash();

  @$internal
  @override
  ForceUpdate create() => ForceUpdate();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<bool>(value));
  }
}

String _$forceUpdateHash() => r'737a4cb97a148e10d097b925b9a22ac466d2cb53';

/// True when this build is too old: a 426 from the API, or `GET /config` → `min_app_version`.

abstract class _$ForceUpdate extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element = ref.element as $ClassProviderElement<AnyNotifier<bool, bool>, bool, Object?, Object?>;
    return element.handleCreate(ref, build);
  }
}

/// Whether the 3-slide onboarding has been seen (kept across logouts).

@ProviderFor(OnboardingSeen)
final onboardingSeenProvider = OnboardingSeenProvider._();

/// Whether the 3-slide onboarding has been seen (kept across logouts).
final class OnboardingSeenProvider extends $NotifierProvider<OnboardingSeen, bool> {
  /// Whether the 3-slide onboarding has been seen (kept across logouts).
  OnboardingSeenProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingSeenProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingSeenHash();

  @$internal
  @override
  OnboardingSeen create() => OnboardingSeen();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<bool>(value));
  }
}

String _$onboardingSeenHash() => r'12b351757199d57bd63a8633500c2de8bd8b723e';

/// Whether the 3-slide onboarding has been seen (kept across logouts).

abstract class _$OnboardingSeen extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element = ref.element as $ClassProviderElement<AnyNotifier<bool, bool>, bool, Object?, Object?>;
    return element.handleCreate(ref, build);
  }
}
