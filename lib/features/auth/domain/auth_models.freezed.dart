// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

 String get id; String get username; String get displayName; String? get email; String? get phone; String? get avatarUrl; String? get role;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as User;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.username, _this.username) || other.username == _this.username)&&(identical(other.displayName, _this.displayName) || other.displayName == _this.displayName)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.avatarUrl, _this.avatarUrl) || other.avatarUrl == _this.avatarUrl)&&(identical(other.role, _this.role) || other.role == _this.role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as User;
  return Object.hash(runtimeType,_this.id,_this.username,_this.displayName,_this.email,_this.phone,_this.avatarUrl,_this.role);
}

@override
String toString() {
  final _this = this as User;
  return 'User(id: ${_this.id}, username: ${_this.username}, displayName: ${_this.displayName}, email: ${_this.email}, phone: ${_this.phone}, avatarUrl: ${_this.avatarUrl}, role: ${_this.role})';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String id, String username, String displayName, String? email, String? phone, String? avatarUrl, String? role
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? displayName = null,Object? email = freezed,Object? phone = freezed,Object? avatarUrl = freezed,Object? role = freezed,}) {
  return _then(User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String username,  String displayName,  String? email,  String? phone,  String? avatarUrl,  String? role)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.username,_that.displayName,_that.email,_that.phone,_that.avatarUrl,_that.role);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String username,  String displayName,  String? email,  String? phone,  String? avatarUrl,  String? role)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.username,_that.displayName,_that.email,_that.phone,_that.avatarUrl,_that.role);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String username,  String displayName,  String? email,  String? phone,  String? avatarUrl,  String? role)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.username,_that.displayName,_that.email,_that.phone,_that.avatarUrl,_that.role);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({required this.id, required this.username, required this.displayName, this.email, this.phone, this.avatarUrl, this.role});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  String id;
@override final  String username;
@override final  String displayName;
@override final  String? email;
@override final  String? phone;
@override final  String? avatarUrl;
@override final  String? role;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,username,displayName,email,phone,avatarUrl,role);
}

@override
String toString() {
    return 'User(id: $id, username: $username, displayName: $displayName, email: $email, phone: $phone, avatarUrl: $avatarUrl, role: $role)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String id, String username, String displayName, String? email, String? phone, String? avatarUrl, String? role
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? displayName = null,Object? email = freezed,Object? phone = freezed,Object? avatarUrl = freezed,Object? role = freezed,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Scope {

 List<String> get regions; List<String> get states; List<String> get atms;
/// Create a copy of Scope
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScopeCopyWith<Scope> get copyWith => _$ScopeCopyWithImpl<Scope>(this as Scope, _$identity);

  /// Serializes this Scope to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Scope;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Scope&&const DeepCollectionEquality().equals(other.regions, _this.regions)&&const DeepCollectionEquality().equals(other.states, _this.states)&&const DeepCollectionEquality().equals(other.atms, _this.atms));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Scope;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.regions),const DeepCollectionEquality().hash(_this.states),const DeepCollectionEquality().hash(_this.atms));
}

@override
String toString() {
  final _this = this as Scope;
  return 'Scope(regions: ${_this.regions}, states: ${_this.states}, atms: ${_this.atms})';
}


}

/// @nodoc
abstract mixin class $ScopeCopyWith<$Res>  {
  factory $ScopeCopyWith(Scope value, $Res Function(Scope) _then) = _$ScopeCopyWithImpl;
@useResult
$Res call({
 List<String> regions, List<String> states, List<String> atms
});




}
/// @nodoc
class _$ScopeCopyWithImpl<$Res>
    implements $ScopeCopyWith<$Res> {
  _$ScopeCopyWithImpl(this._self, this._then);

  final Scope _self;
  final $Res Function(Scope) _then;

/// Create a copy of Scope
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? regions = null,Object? states = null,Object? atms = null,}) {
  return _then(Scope(
regions: null == regions ? _self.regions : regions // ignore: cast_nullable_to_non_nullable
as List<String>,states: null == states ? _self.states : states // ignore: cast_nullable_to_non_nullable
as List<String>,atms: null == atms ? _self.atms : atms // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Scope].
extension ScopePatterns on Scope {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Scope value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Scope() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Scope value)  $default,){
final _that = this;
switch (_that) {
case _Scope():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Scope value)?  $default,){
final _that = this;
switch (_that) {
case _Scope() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> regions,  List<String> states,  List<String> atms)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Scope() when $default != null:
return $default(_that.regions,_that.states,_that.atms);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> regions,  List<String> states,  List<String> atms)  $default,) {final _that = this;
switch (_that) {
case _Scope():
return $default(_that.regions,_that.states,_that.atms);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> regions,  List<String> states,  List<String> atms)?  $default,) {final _that = this;
switch (_that) {
case _Scope() when $default != null:
return $default(_that.regions,_that.states,_that.atms);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Scope extends Scope {
  const _Scope({ List<String> regions = const <String>[],  List<String> states = const <String>[],  List<String> atms = const <String>[]}): _regions = regions,_states = states,_atms = atms,super._();
  factory _Scope.fromJson(Map<String, dynamic> json) => _$ScopeFromJson(json);

 final  List<String> _regions;
@override@JsonKey() List<String> get regions {
  if (_regions is EqualUnmodifiableListView) return _regions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_regions);
}

 final  List<String> _states;
@override@JsonKey() List<String> get states {
  if (_states is EqualUnmodifiableListView) return _states;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_states);
}

 final  List<String> _atms;
@override@JsonKey() List<String> get atms {
  if (_atms is EqualUnmodifiableListView) return _atms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_atms);
}


/// Create a copy of Scope
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScopeCopyWith<_Scope> get copyWith => __$ScopeCopyWithImpl<_Scope>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScopeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Scope&&const DeepCollectionEquality().equals(other.regions, _regions)&&const DeepCollectionEquality().equals(other.states, _states)&&const DeepCollectionEquality().equals(other.atms, _atms));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_regions),const DeepCollectionEquality().hash(_states),const DeepCollectionEquality().hash(_atms));
}

@override
String toString() {
    return 'Scope(regions: $regions, states: $states, atms: $atms)';
}


}

/// @nodoc
abstract mixin class _$ScopeCopyWith<$Res> implements $ScopeCopyWith<$Res> {
  factory _$ScopeCopyWith(_Scope value, $Res Function(_Scope) _then) = __$ScopeCopyWithImpl;
@override @useResult
$Res call({
 List<String> regions, List<String> states, List<String> atms
});




}
/// @nodoc
class __$ScopeCopyWithImpl<$Res>
    implements _$ScopeCopyWith<$Res> {
  __$ScopeCopyWithImpl(this._self, this._then);

  final _Scope _self;
  final $Res Function(_Scope) _then;

/// Create a copy of Scope
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? regions = null,Object? states = null,Object? atms = null,}) {
  return _then(_Scope(
regions: null == regions ? _self._regions : regions // ignore: cast_nullable_to_non_nullable
as List<String>,states: null == states ? _self._states : states // ignore: cast_nullable_to_non_nullable
as List<String>,atms: null == atms ? _self._atms : atms // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$LoginResult {

 String get accessToken; String get tokenType; DateTime get expiresAt; User get user; Scope get scope;
/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginResultCopyWith<LoginResult> get copyWith => _$LoginResultCopyWithImpl<LoginResult>(this as LoginResult, _$identity);

  /// Serializes this LoginResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LoginResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResult&&(identical(other.accessToken, _this.accessToken) || other.accessToken == _this.accessToken)&&(identical(other.tokenType, _this.tokenType) || other.tokenType == _this.tokenType)&&(identical(other.expiresAt, _this.expiresAt) || other.expiresAt == _this.expiresAt)&&(identical(other.user, _this.user) || other.user == _this.user)&&(identical(other.scope, _this.scope) || other.scope == _this.scope));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LoginResult;
  return Object.hash(runtimeType,_this.accessToken,_this.tokenType,_this.expiresAt,_this.user,_this.scope);
}

@override
String toString() {
  final _this = this as LoginResult;
  return 'LoginResult(accessToken: ${_this.accessToken}, tokenType: ${_this.tokenType}, expiresAt: ${_this.expiresAt}, user: ${_this.user}, scope: ${_this.scope})';
}


}

/// @nodoc
abstract mixin class $LoginResultCopyWith<$Res>  {
  factory $LoginResultCopyWith(LoginResult value, $Res Function(LoginResult) _then) = _$LoginResultCopyWithImpl;
@useResult
$Res call({
 String accessToken, String tokenType, DateTime expiresAt, User user, Scope scope
});


$UserCopyWith<$Res> get user;$ScopeCopyWith<$Res> get scope;

}
/// @nodoc
class _$LoginResultCopyWithImpl<$Res>
    implements $LoginResultCopyWith<$Res> {
  _$LoginResultCopyWithImpl(this._self, this._then);

  final LoginResult _self;
  final $Res Function(LoginResult) _then;

/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? tokenType = null,Object? expiresAt = null,Object? user = null,Object? scope = null,}) {
  return _then(LoginResult(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as Scope,
  ));
}
/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScopeCopyWith<$Res> get scope {
  
  return $ScopeCopyWith<$Res>(_self.scope, (value) {
    return _then(_self.copyWith(scope: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoginResult].
extension LoginResultPatterns on LoginResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginResult value)  $default,){
final _that = this;
switch (_that) {
case _LoginResult():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginResult value)?  $default,){
final _that = this;
switch (_that) {
case _LoginResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  String tokenType,  DateTime expiresAt,  User user,  Scope scope)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginResult() when $default != null:
return $default(_that.accessToken,_that.tokenType,_that.expiresAt,_that.user,_that.scope);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  String tokenType,  DateTime expiresAt,  User user,  Scope scope)  $default,) {final _that = this;
switch (_that) {
case _LoginResult():
return $default(_that.accessToken,_that.tokenType,_that.expiresAt,_that.user,_that.scope);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  String tokenType,  DateTime expiresAt,  User user,  Scope scope)?  $default,) {final _that = this;
switch (_that) {
case _LoginResult() when $default != null:
return $default(_that.accessToken,_that.tokenType,_that.expiresAt,_that.user,_that.scope);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginResult implements LoginResult {
  const _LoginResult({required this.accessToken, required this.tokenType, required this.expiresAt, required this.user, required this.scope});
  factory _LoginResult.fromJson(Map<String, dynamic> json) => _$LoginResultFromJson(json);

@override final  String accessToken;
@override final  String tokenType;
@override final  DateTime expiresAt;
@override final  User user;
@override final  Scope scope;

/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginResultCopyWith<_LoginResult> get copyWith => __$LoginResultCopyWithImpl<_LoginResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginResultToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginResult&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.user, user) || other.user == user)&&(identical(other.scope, scope) || other.scope == scope));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,accessToken,tokenType,expiresAt,user,scope);
}

@override
String toString() {
    return 'LoginResult(accessToken: $accessToken, tokenType: $tokenType, expiresAt: $expiresAt, user: $user, scope: $scope)';
}


}

/// @nodoc
abstract mixin class _$LoginResultCopyWith<$Res> implements $LoginResultCopyWith<$Res> {
  factory _$LoginResultCopyWith(_LoginResult value, $Res Function(_LoginResult) _then) = __$LoginResultCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, String tokenType, DateTime expiresAt, User user, Scope scope
});


@override $UserCopyWith<$Res> get user;@override $ScopeCopyWith<$Res> get scope;

}
/// @nodoc
class __$LoginResultCopyWithImpl<$Res>
    implements _$LoginResultCopyWith<$Res> {
  __$LoginResultCopyWithImpl(this._self, this._then);

  final _LoginResult _self;
  final $Res Function(_LoginResult) _then;

/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? tokenType = null,Object? expiresAt = null,Object? user = null,Object? scope = null,}) {
  return _then(_LoginResult(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as Scope,
  ));
}

/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScopeCopyWith<$Res> get scope {
  
  return $ScopeCopyWith<$Res>(_self.scope, (value) {
    return _then(_self.copyWith(scope: value));
  });
}
}


/// @nodoc
mixin _$SessionInfo {

 User get user; Scope get scope; DateTime get expiresAt;
/// Create a copy of SessionInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionInfoCopyWith<SessionInfo> get copyWith => _$SessionInfoCopyWithImpl<SessionInfo>(this as SessionInfo, _$identity);

  /// Serializes this SessionInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SessionInfo;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionInfo&&(identical(other.user, _this.user) || other.user == _this.user)&&(identical(other.scope, _this.scope) || other.scope == _this.scope)&&(identical(other.expiresAt, _this.expiresAt) || other.expiresAt == _this.expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SessionInfo;
  return Object.hash(runtimeType,_this.user,_this.scope,_this.expiresAt);
}

@override
String toString() {
  final _this = this as SessionInfo;
  return 'SessionInfo(user: ${_this.user}, scope: ${_this.scope}, expiresAt: ${_this.expiresAt})';
}


}

/// @nodoc
abstract mixin class $SessionInfoCopyWith<$Res>  {
  factory $SessionInfoCopyWith(SessionInfo value, $Res Function(SessionInfo) _then) = _$SessionInfoCopyWithImpl;
@useResult
$Res call({
 User user, Scope scope, DateTime expiresAt
});


$UserCopyWith<$Res> get user;$ScopeCopyWith<$Res> get scope;

}
/// @nodoc
class _$SessionInfoCopyWithImpl<$Res>
    implements $SessionInfoCopyWith<$Res> {
  _$SessionInfoCopyWithImpl(this._self, this._then);

  final SessionInfo _self;
  final $Res Function(SessionInfo) _then;

/// Create a copy of SessionInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? scope = null,Object? expiresAt = null,}) {
  return _then(SessionInfo(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as Scope,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of SessionInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of SessionInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScopeCopyWith<$Res> get scope {
  
  return $ScopeCopyWith<$Res>(_self.scope, (value) {
    return _then(_self.copyWith(scope: value));
  });
}
}


/// Adds pattern-matching-related methods to [SessionInfo].
extension SessionInfoPatterns on SessionInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionInfo value)  $default,){
final _that = this;
switch (_that) {
case _SessionInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionInfo value)?  $default,){
final _that = this;
switch (_that) {
case _SessionInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( User user,  Scope scope,  DateTime expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionInfo() when $default != null:
return $default(_that.user,_that.scope,_that.expiresAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( User user,  Scope scope,  DateTime expiresAt)  $default,) {final _that = this;
switch (_that) {
case _SessionInfo():
return $default(_that.user,_that.scope,_that.expiresAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( User user,  Scope scope,  DateTime expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _SessionInfo() when $default != null:
return $default(_that.user,_that.scope,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionInfo implements SessionInfo {
  const _SessionInfo({required this.user, required this.scope, required this.expiresAt});
  factory _SessionInfo.fromJson(Map<String, dynamic> json) => _$SessionInfoFromJson(json);

@override final  User user;
@override final  Scope scope;
@override final  DateTime expiresAt;

/// Create a copy of SessionInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionInfoCopyWith<_SessionInfo> get copyWith => __$SessionInfoCopyWithImpl<_SessionInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionInfoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionInfo&&(identical(other.user, user) || other.user == user)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,user,scope,expiresAt);
}

@override
String toString() {
    return 'SessionInfo(user: $user, scope: $scope, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$SessionInfoCopyWith<$Res> implements $SessionInfoCopyWith<$Res> {
  factory _$SessionInfoCopyWith(_SessionInfo value, $Res Function(_SessionInfo) _then) = __$SessionInfoCopyWithImpl;
@override @useResult
$Res call({
 User user, Scope scope, DateTime expiresAt
});


@override $UserCopyWith<$Res> get user;@override $ScopeCopyWith<$Res> get scope;

}
/// @nodoc
class __$SessionInfoCopyWithImpl<$Res>
    implements _$SessionInfoCopyWith<$Res> {
  __$SessionInfoCopyWithImpl(this._self, this._then);

  final _SessionInfo _self;
  final $Res Function(_SessionInfo) _then;

/// Create a copy of SessionInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? scope = null,Object? expiresAt = null,}) {
  return _then(_SessionInfo(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as Scope,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of SessionInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of SessionInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScopeCopyWith<$Res> get scope {
  
  return $ScopeCopyWith<$Res>(_self.scope, (value) {
    return _then(_self.copyWith(scope: value));
  });
}
}


/// @nodoc
mixin _$LoginDevice {

 String get platform; String get appVersion; String? get deviceName;
/// Create a copy of LoginDevice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginDeviceCopyWith<LoginDevice> get copyWith => _$LoginDeviceCopyWithImpl<LoginDevice>(this as LoginDevice, _$identity);

  /// Serializes this LoginDevice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LoginDevice;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginDevice&&(identical(other.platform, _this.platform) || other.platform == _this.platform)&&(identical(other.appVersion, _this.appVersion) || other.appVersion == _this.appVersion)&&(identical(other.deviceName, _this.deviceName) || other.deviceName == _this.deviceName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LoginDevice;
  return Object.hash(runtimeType,_this.platform,_this.appVersion,_this.deviceName);
}

@override
String toString() {
  final _this = this as LoginDevice;
  return 'LoginDevice(platform: ${_this.platform}, appVersion: ${_this.appVersion}, deviceName: ${_this.deviceName})';
}


}

/// @nodoc
abstract mixin class $LoginDeviceCopyWith<$Res>  {
  factory $LoginDeviceCopyWith(LoginDevice value, $Res Function(LoginDevice) _then) = _$LoginDeviceCopyWithImpl;
@useResult
$Res call({
 String platform, String appVersion, String? deviceName
});




}
/// @nodoc
class _$LoginDeviceCopyWithImpl<$Res>
    implements $LoginDeviceCopyWith<$Res> {
  _$LoginDeviceCopyWithImpl(this._self, this._then);

  final LoginDevice _self;
  final $Res Function(LoginDevice) _then;

/// Create a copy of LoginDevice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? platform = null,Object? appVersion = null,Object? deviceName = freezed,}) {
  return _then(LoginDevice(
platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String,deviceName: freezed == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginDevice].
extension LoginDevicePatterns on LoginDevice {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginDevice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginDevice() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginDevice value)  $default,){
final _that = this;
switch (_that) {
case _LoginDevice():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginDevice value)?  $default,){
final _that = this;
switch (_that) {
case _LoginDevice() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String platform,  String appVersion,  String? deviceName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginDevice() when $default != null:
return $default(_that.platform,_that.appVersion,_that.deviceName);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String platform,  String appVersion,  String? deviceName)  $default,) {final _that = this;
switch (_that) {
case _LoginDevice():
return $default(_that.platform,_that.appVersion,_that.deviceName);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String platform,  String appVersion,  String? deviceName)?  $default,) {final _that = this;
switch (_that) {
case _LoginDevice() when $default != null:
return $default(_that.platform,_that.appVersion,_that.deviceName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginDevice implements LoginDevice {
  const _LoginDevice({required this.platform, required this.appVersion, this.deviceName});
  factory _LoginDevice.fromJson(Map<String, dynamic> json) => _$LoginDeviceFromJson(json);

@override final  String platform;
@override final  String appVersion;
@override final  String? deviceName;

/// Create a copy of LoginDevice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginDeviceCopyWith<_LoginDevice> get copyWith => __$LoginDeviceCopyWithImpl<_LoginDevice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginDeviceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginDevice&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,platform,appVersion,deviceName);
}

@override
String toString() {
    return 'LoginDevice(platform: $platform, appVersion: $appVersion, deviceName: $deviceName)';
}


}

/// @nodoc
abstract mixin class _$LoginDeviceCopyWith<$Res> implements $LoginDeviceCopyWith<$Res> {
  factory _$LoginDeviceCopyWith(_LoginDevice value, $Res Function(_LoginDevice) _then) = __$LoginDeviceCopyWithImpl;
@override @useResult
$Res call({
 String platform, String appVersion, String? deviceName
});




}
/// @nodoc
class __$LoginDeviceCopyWithImpl<$Res>
    implements _$LoginDeviceCopyWith<$Res> {
  __$LoginDeviceCopyWithImpl(this._self, this._then);

  final _LoginDevice _self;
  final $Res Function(_LoginDevice) _then;

/// Create a copy of LoginDevice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? platform = null,Object? appVersion = null,Object? deviceName = freezed,}) {
  return _then(_LoginDevice(
platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String,deviceName: freezed == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
