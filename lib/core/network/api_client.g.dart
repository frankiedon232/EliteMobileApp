// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The in-memory access token used by [AuthInterceptor]. The session layer (M2) sets it after
/// login / restore and clears it on logout; the persisted copy lives in secure storage.

@ProviderFor(AuthToken)
final authTokenProvider = AuthTokenProvider._();

/// The in-memory access token used by [AuthInterceptor]. The session layer (M2) sets it after
/// login / restore and clears it on logout; the persisted copy lives in secure storage.
final class AuthTokenProvider extends $NotifierProvider<AuthToken, String?> {
  /// The in-memory access token used by [AuthInterceptor]. The session layer (M2) sets it after
  /// login / restore and clears it on logout; the persisted copy lives in secure storage.
  AuthTokenProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authTokenProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authTokenHash();

  @$internal
  @override
  AuthToken create() => AuthToken();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<String?>(value));
  }
}

String _$authTokenHash() => r'f88d96892ae660850c8e4cbe0c29542869e15b16';

/// The in-memory access token used by [AuthInterceptor]. The session layer (M2) sets it after
/// login / restore and clears it on logout; the persisted copy lives in secure storage.

abstract class _$AuthToken extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element as $ClassProviderElement<AnyNotifier<String?, String?>, String?, Object?, Object?>;
    return element.handleCreate(ref, build);
  }
}

/// The single Dio instance for the v1 API.

@ProviderFor(dio)
final dioProvider = DioProvider._();

/// The single Dio instance for the v1 API.

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio> with $Provider<Dio> {
  /// The single Dio instance for the v1 API.
  DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<Dio>(value));
  }
}

String _$dioHash() => r'1fe7e8a7be123e03c19386de76f30600d07e5000';

@ProviderFor(apiClient)
final apiClientProvider = ApiClientProvider._();

final class ApiClientProvider extends $FunctionalProvider<ApiClient, ApiClient, ApiClient>
    with $Provider<ApiClient> {
  ApiClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiClientHash();

  @$internal
  @override
  $ProviderElement<ApiClient> $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  ApiClient create(Ref ref) {
    return apiClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiClient value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<ApiClient>(value));
  }
}

String _$apiClientHash() => r'8c4443c9c80070ab4a96afd745c581b3de2e615d';
