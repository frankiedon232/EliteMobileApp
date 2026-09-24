import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

/// API_CONTRACT §2 User.
@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String username,
    required String displayName,
    String? email,
    String? phone,
    String? avatarUrl,
    String? role,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

/// API_CONTRACT §2 Scope. `["All"]` = unrestricted for that dimension. Always from the server.
@freezed
abstract class Scope with _$Scope {
  const factory Scope({
    @Default(<String>[]) List<String> regions,
    @Default(<String>[]) List<String> states,
    @Default(<String>[]) List<String> atms,
  }) = _Scope;

  const Scope._();

  factory Scope.fromJson(Map<String, dynamic> json) => _$ScopeFromJson(json);

  bool get allRegions => regions.contains('All');
}

/// `POST /auth/login` → data.
@freezed
abstract class LoginResult with _$LoginResult {
  const factory LoginResult({
    required String accessToken,
    required String tokenType,
    required DateTime expiresAt,
    required User user,
    required Scope scope,
  }) = _LoginResult;

  factory LoginResult.fromJson(Map<String, dynamic> json) => _$LoginResultFromJson(json);
}

/// `GET /auth/me` → data.
@freezed
abstract class SessionInfo with _$SessionInfo {
  const factory SessionInfo({required User user, required Scope scope, required DateTime expiresAt}) =
      _SessionInfo;

  factory SessionInfo.fromJson(Map<String, dynamic> json) => _$SessionInfoFromJson(json);
}

/// `device` block of the login request.
@freezed
abstract class LoginDevice with _$LoginDevice {
  const factory LoginDevice({required String platform, required String appVersion, String? deviceName}) =
      _LoginDevice;

  factory LoginDevice.fromJson(Map<String, dynamic> json) => _$LoginDeviceFromJson(json);
}
