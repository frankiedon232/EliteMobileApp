// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  username: json['username'] as String,
  displayName: json['display_name'] as String,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  role: json['role'] as String?,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'display_name': instance.displayName,
  'email': instance.email,
  'phone': instance.phone,
  'avatar_url': instance.avatarUrl,
  'role': instance.role,
};

_Scope _$ScopeFromJson(Map<String, dynamic> json) => _Scope(
  regions: (json['regions'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const <String>[],
  states: (json['states'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const <String>[],
  atms: (json['atms'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const <String>[],
);

Map<String, dynamic> _$ScopeToJson(_Scope instance) => <String, dynamic>{
  'regions': instance.regions,
  'states': instance.states,
  'atms': instance.atms,
};

_LoginResult _$LoginResultFromJson(Map<String, dynamic> json) => _LoginResult(
  accessToken: json['access_token'] as String,
  tokenType: json['token_type'] as String,
  expiresAt: DateTime.parse(json['expires_at'] as String),
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  scope: Scope.fromJson(json['scope'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LoginResultToJson(_LoginResult instance) => <String, dynamic>{
  'access_token': instance.accessToken,
  'token_type': instance.tokenType,
  'expires_at': instance.expiresAt.toIso8601String(),
  'user': instance.user.toJson(),
  'scope': instance.scope.toJson(),
};

_SessionInfo _$SessionInfoFromJson(Map<String, dynamic> json) => _SessionInfo(
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  scope: Scope.fromJson(json['scope'] as Map<String, dynamic>),
  expiresAt: DateTime.parse(json['expires_at'] as String),
);

Map<String, dynamic> _$SessionInfoToJson(_SessionInfo instance) => <String, dynamic>{
  'user': instance.user.toJson(),
  'scope': instance.scope.toJson(),
  'expires_at': instance.expiresAt.toIso8601String(),
};

_LoginDevice _$LoginDeviceFromJson(Map<String, dynamic> json) => _LoginDevice(
  platform: json['platform'] as String,
  appVersion: json['app_version'] as String,
  deviceName: json['device_name'] as String?,
);

Map<String, dynamic> _$LoginDeviceToJson(_LoginDevice instance) => <String, dynamic>{
  'platform': instance.platform,
  'app_version': instance.appVersion,
  'device_name': instance.deviceName,
};
