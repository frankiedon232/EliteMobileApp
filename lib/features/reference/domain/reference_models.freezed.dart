// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reference_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RemoteConfig {

 String get minAppVersion; String get latestAppVersion; SupportContact get support; CashThresholds get cashThresholds; int get idleDays; int get performanceReportMaxDays; DateTime get serverTime;
/// Create a copy of RemoteConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteConfigCopyWith<RemoteConfig> get copyWith => _$RemoteConfigCopyWithImpl<RemoteConfig>(this as RemoteConfig, _$identity);

  /// Serializes this RemoteConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RemoteConfig;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteConfig&&(identical(other.minAppVersion, _this.minAppVersion) || other.minAppVersion == _this.minAppVersion)&&(identical(other.latestAppVersion, _this.latestAppVersion) || other.latestAppVersion == _this.latestAppVersion)&&(identical(other.support, _this.support) || other.support == _this.support)&&(identical(other.cashThresholds, _this.cashThresholds) || other.cashThresholds == _this.cashThresholds)&&(identical(other.idleDays, _this.idleDays) || other.idleDays == _this.idleDays)&&(identical(other.performanceReportMaxDays, _this.performanceReportMaxDays) || other.performanceReportMaxDays == _this.performanceReportMaxDays)&&(identical(other.serverTime, _this.serverTime) || other.serverTime == _this.serverTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RemoteConfig;
  return Object.hash(runtimeType,_this.minAppVersion,_this.latestAppVersion,_this.support,_this.cashThresholds,_this.idleDays,_this.performanceReportMaxDays,_this.serverTime);
}

@override
String toString() {
  final _this = this as RemoteConfig;
  return 'RemoteConfig(minAppVersion: ${_this.minAppVersion}, latestAppVersion: ${_this.latestAppVersion}, support: ${_this.support}, cashThresholds: ${_this.cashThresholds}, idleDays: ${_this.idleDays}, performanceReportMaxDays: ${_this.performanceReportMaxDays}, serverTime: ${_this.serverTime})';
}


}

/// @nodoc
abstract mixin class $RemoteConfigCopyWith<$Res>  {
  factory $RemoteConfigCopyWith(RemoteConfig value, $Res Function(RemoteConfig) _then) = _$RemoteConfigCopyWithImpl;
@useResult
$Res call({
 String minAppVersion, String latestAppVersion, SupportContact support, CashThresholds cashThresholds, int idleDays, int performanceReportMaxDays, DateTime serverTime
});


$SupportContactCopyWith<$Res> get support;$CashThresholdsCopyWith<$Res> get cashThresholds;

}
/// @nodoc
class _$RemoteConfigCopyWithImpl<$Res>
    implements $RemoteConfigCopyWith<$Res> {
  _$RemoteConfigCopyWithImpl(this._self, this._then);

  final RemoteConfig _self;
  final $Res Function(RemoteConfig) _then;

/// Create a copy of RemoteConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minAppVersion = null,Object? latestAppVersion = null,Object? support = null,Object? cashThresholds = null,Object? idleDays = null,Object? performanceReportMaxDays = null,Object? serverTime = null,}) {
  return _then(RemoteConfig(
minAppVersion: null == minAppVersion ? _self.minAppVersion : minAppVersion // ignore: cast_nullable_to_non_nullable
as String,latestAppVersion: null == latestAppVersion ? _self.latestAppVersion : latestAppVersion // ignore: cast_nullable_to_non_nullable
as String,support: null == support ? _self.support : support // ignore: cast_nullable_to_non_nullable
as SupportContact,cashThresholds: null == cashThresholds ? _self.cashThresholds : cashThresholds // ignore: cast_nullable_to_non_nullable
as CashThresholds,idleDays: null == idleDays ? _self.idleDays : idleDays // ignore: cast_nullable_to_non_nullable
as int,performanceReportMaxDays: null == performanceReportMaxDays ? _self.performanceReportMaxDays : performanceReportMaxDays // ignore: cast_nullable_to_non_nullable
as int,serverTime: null == serverTime ? _self.serverTime : serverTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of RemoteConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SupportContactCopyWith<$Res> get support {
  
  return $SupportContactCopyWith<$Res>(_self.support, (value) {
    return _then(_self.copyWith(support: value));
  });
}/// Create a copy of RemoteConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CashThresholdsCopyWith<$Res> get cashThresholds {
  
  return $CashThresholdsCopyWith<$Res>(_self.cashThresholds, (value) {
    return _then(_self.copyWith(cashThresholds: value));
  });
}
}


/// Adds pattern-matching-related methods to [RemoteConfig].
extension RemoteConfigPatterns on RemoteConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RemoteConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RemoteConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RemoteConfig value)  $default,){
final _that = this;
switch (_that) {
case _RemoteConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RemoteConfig value)?  $default,){
final _that = this;
switch (_that) {
case _RemoteConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String minAppVersion,  String latestAppVersion,  SupportContact support,  CashThresholds cashThresholds,  int idleDays,  int performanceReportMaxDays,  DateTime serverTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RemoteConfig() when $default != null:
return $default(_that.minAppVersion,_that.latestAppVersion,_that.support,_that.cashThresholds,_that.idleDays,_that.performanceReportMaxDays,_that.serverTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String minAppVersion,  String latestAppVersion,  SupportContact support,  CashThresholds cashThresholds,  int idleDays,  int performanceReportMaxDays,  DateTime serverTime)  $default,) {final _that = this;
switch (_that) {
case _RemoteConfig():
return $default(_that.minAppVersion,_that.latestAppVersion,_that.support,_that.cashThresholds,_that.idleDays,_that.performanceReportMaxDays,_that.serverTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String minAppVersion,  String latestAppVersion,  SupportContact support,  CashThresholds cashThresholds,  int idleDays,  int performanceReportMaxDays,  DateTime serverTime)?  $default,) {final _that = this;
switch (_that) {
case _RemoteConfig() when $default != null:
return $default(_that.minAppVersion,_that.latestAppVersion,_that.support,_that.cashThresholds,_that.idleDays,_that.performanceReportMaxDays,_that.serverTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RemoteConfig implements RemoteConfig {
  const _RemoteConfig({required this.minAppVersion, required this.latestAppVersion, required this.support, required this.cashThresholds, required this.idleDays, required this.performanceReportMaxDays, required this.serverTime});
  factory _RemoteConfig.fromJson(Map<String, dynamic> json) => _$RemoteConfigFromJson(json);

@override final  String minAppVersion;
@override final  String latestAppVersion;
@override final  SupportContact support;
@override final  CashThresholds cashThresholds;
@override final  int idleDays;
@override final  int performanceReportMaxDays;
@override final  DateTime serverTime;

/// Create a copy of RemoteConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoteConfigCopyWith<_RemoteConfig> get copyWith => __$RemoteConfigCopyWithImpl<_RemoteConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RemoteConfigToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoteConfig&&(identical(other.minAppVersion, minAppVersion) || other.minAppVersion == minAppVersion)&&(identical(other.latestAppVersion, latestAppVersion) || other.latestAppVersion == latestAppVersion)&&(identical(other.support, support) || other.support == support)&&(identical(other.cashThresholds, cashThresholds) || other.cashThresholds == cashThresholds)&&(identical(other.idleDays, idleDays) || other.idleDays == idleDays)&&(identical(other.performanceReportMaxDays, performanceReportMaxDays) || other.performanceReportMaxDays == performanceReportMaxDays)&&(identical(other.serverTime, serverTime) || other.serverTime == serverTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,minAppVersion,latestAppVersion,support,cashThresholds,idleDays,performanceReportMaxDays,serverTime);
}

@override
String toString() {
    return 'RemoteConfig(minAppVersion: $minAppVersion, latestAppVersion: $latestAppVersion, support: $support, cashThresholds: $cashThresholds, idleDays: $idleDays, performanceReportMaxDays: $performanceReportMaxDays, serverTime: $serverTime)';
}


}

/// @nodoc
abstract mixin class _$RemoteConfigCopyWith<$Res> implements $RemoteConfigCopyWith<$Res> {
  factory _$RemoteConfigCopyWith(_RemoteConfig value, $Res Function(_RemoteConfig) _then) = __$RemoteConfigCopyWithImpl;
@override @useResult
$Res call({
 String minAppVersion, String latestAppVersion, SupportContact support, CashThresholds cashThresholds, int idleDays, int performanceReportMaxDays, DateTime serverTime
});


@override $SupportContactCopyWith<$Res> get support;@override $CashThresholdsCopyWith<$Res> get cashThresholds;

}
/// @nodoc
class __$RemoteConfigCopyWithImpl<$Res>
    implements _$RemoteConfigCopyWith<$Res> {
  __$RemoteConfigCopyWithImpl(this._self, this._then);

  final _RemoteConfig _self;
  final $Res Function(_RemoteConfig) _then;

/// Create a copy of RemoteConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minAppVersion = null,Object? latestAppVersion = null,Object? support = null,Object? cashThresholds = null,Object? idleDays = null,Object? performanceReportMaxDays = null,Object? serverTime = null,}) {
  return _then(_RemoteConfig(
minAppVersion: null == minAppVersion ? _self.minAppVersion : minAppVersion // ignore: cast_nullable_to_non_nullable
as String,latestAppVersion: null == latestAppVersion ? _self.latestAppVersion : latestAppVersion // ignore: cast_nullable_to_non_nullable
as String,support: null == support ? _self.support : support // ignore: cast_nullable_to_non_nullable
as SupportContact,cashThresholds: null == cashThresholds ? _self.cashThresholds : cashThresholds // ignore: cast_nullable_to_non_nullable
as CashThresholds,idleDays: null == idleDays ? _self.idleDays : idleDays // ignore: cast_nullable_to_non_nullable
as int,performanceReportMaxDays: null == performanceReportMaxDays ? _self.performanceReportMaxDays : performanceReportMaxDays // ignore: cast_nullable_to_non_nullable
as int,serverTime: null == serverTime ? _self.serverTime : serverTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of RemoteConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SupportContactCopyWith<$Res> get support {
  
  return $SupportContactCopyWith<$Res>(_self.support, (value) {
    return _then(_self.copyWith(support: value));
  });
}/// Create a copy of RemoteConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CashThresholdsCopyWith<$Res> get cashThresholds {
  
  return $CashThresholdsCopyWith<$Res>(_self.cashThresholds, (value) {
    return _then(_self.copyWith(cashThresholds: value));
  });
}
}


/// @nodoc
mixin _$SupportContact {

 String? get email; String? get phone;
/// Create a copy of SupportContact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupportContactCopyWith<SupportContact> get copyWith => _$SupportContactCopyWithImpl<SupportContact>(this as SupportContact, _$identity);

  /// Serializes this SupportContact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SupportContact;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupportContact&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.phone, _this.phone) || other.phone == _this.phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SupportContact;
  return Object.hash(runtimeType,_this.email,_this.phone);
}

@override
String toString() {
  final _this = this as SupportContact;
  return 'SupportContact(email: ${_this.email}, phone: ${_this.phone})';
}


}

/// @nodoc
abstract mixin class $SupportContactCopyWith<$Res>  {
  factory $SupportContactCopyWith(SupportContact value, $Res Function(SupportContact) _then) = _$SupportContactCopyWithImpl;
@useResult
$Res call({
 String? email, String? phone
});




}
/// @nodoc
class _$SupportContactCopyWithImpl<$Res>
    implements $SupportContactCopyWith<$Res> {
  _$SupportContactCopyWithImpl(this._self, this._then);

  final SupportContact _self;
  final $Res Function(SupportContact) _then;

/// Create a copy of SupportContact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = freezed,Object? phone = freezed,}) {
  return _then(SupportContact(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SupportContact].
extension SupportContactPatterns on SupportContact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupportContact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupportContact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupportContact value)  $default,){
final _that = this;
switch (_that) {
case _SupportContact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupportContact value)?  $default,){
final _that = this;
switch (_that) {
case _SupportContact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? email,  String? phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupportContact() when $default != null:
return $default(_that.email,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? email,  String? phone)  $default,) {final _that = this;
switch (_that) {
case _SupportContact():
return $default(_that.email,_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? email,  String? phone)?  $default,) {final _that = this;
switch (_that) {
case _SupportContact() when $default != null:
return $default(_that.email,_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupportContact implements SupportContact {
  const _SupportContact({this.email, this.phone});
  factory _SupportContact.fromJson(Map<String, dynamic> json) => _$SupportContactFromJson(json);

@override final  String? email;
@override final  String? phone;

/// Create a copy of SupportContact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportContactCopyWith<_SupportContact> get copyWith => __$SupportContactCopyWithImpl<_SupportContact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupportContactToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportContact&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,email,phone);
}

@override
String toString() {
    return 'SupportContact(email: $email, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$SupportContactCopyWith<$Res> implements $SupportContactCopyWith<$Res> {
  factory _$SupportContactCopyWith(_SupportContact value, $Res Function(_SupportContact) _then) = __$SupportContactCopyWithImpl;
@override @useResult
$Res call({
 String? email, String? phone
});




}
/// @nodoc
class __$SupportContactCopyWithImpl<$Res>
    implements _$SupportContactCopyWith<$Res> {
  __$SupportContactCopyWithImpl(this._self, this._then);

  final _SupportContact _self;
  final $Res Function(_SupportContact) _then;

/// Create a copy of SupportContact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = freezed,Object? phone = freezed,}) {
  return _then(_SupportContact(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CashThresholds {

 int get noCash; AmountRange get low; AmountRange get moderate; AmountRange get high;
/// Create a copy of CashThresholds
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashThresholdsCopyWith<CashThresholds> get copyWith => _$CashThresholdsCopyWithImpl<CashThresholds>(this as CashThresholds, _$identity);

  /// Serializes this CashThresholds to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CashThresholds;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashThresholds&&(identical(other.noCash, _this.noCash) || other.noCash == _this.noCash)&&(identical(other.low, _this.low) || other.low == _this.low)&&(identical(other.moderate, _this.moderate) || other.moderate == _this.moderate)&&(identical(other.high, _this.high) || other.high == _this.high));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CashThresholds;
  return Object.hash(runtimeType,_this.noCash,_this.low,_this.moderate,_this.high);
}

@override
String toString() {
  final _this = this as CashThresholds;
  return 'CashThresholds(noCash: ${_this.noCash}, low: ${_this.low}, moderate: ${_this.moderate}, high: ${_this.high})';
}


}

/// @nodoc
abstract mixin class $CashThresholdsCopyWith<$Res>  {
  factory $CashThresholdsCopyWith(CashThresholds value, $Res Function(CashThresholds) _then) = _$CashThresholdsCopyWithImpl;
@useResult
$Res call({
 int noCash, AmountRange low, AmountRange moderate, AmountRange high
});


$AmountRangeCopyWith<$Res> get low;$AmountRangeCopyWith<$Res> get moderate;$AmountRangeCopyWith<$Res> get high;

}
/// @nodoc
class _$CashThresholdsCopyWithImpl<$Res>
    implements $CashThresholdsCopyWith<$Res> {
  _$CashThresholdsCopyWithImpl(this._self, this._then);

  final CashThresholds _self;
  final $Res Function(CashThresholds) _then;

/// Create a copy of CashThresholds
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? noCash = null,Object? low = null,Object? moderate = null,Object? high = null,}) {
  return _then(CashThresholds(
noCash: null == noCash ? _self.noCash : noCash // ignore: cast_nullable_to_non_nullable
as int,low: null == low ? _self.low : low // ignore: cast_nullable_to_non_nullable
as AmountRange,moderate: null == moderate ? _self.moderate : moderate // ignore: cast_nullable_to_non_nullable
as AmountRange,high: null == high ? _self.high : high // ignore: cast_nullable_to_non_nullable
as AmountRange,
  ));
}
/// Create a copy of CashThresholds
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountRangeCopyWith<$Res> get low {
  
  return $AmountRangeCopyWith<$Res>(_self.low, (value) {
    return _then(_self.copyWith(low: value));
  });
}/// Create a copy of CashThresholds
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountRangeCopyWith<$Res> get moderate {
  
  return $AmountRangeCopyWith<$Res>(_self.moderate, (value) {
    return _then(_self.copyWith(moderate: value));
  });
}/// Create a copy of CashThresholds
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountRangeCopyWith<$Res> get high {
  
  return $AmountRangeCopyWith<$Res>(_self.high, (value) {
    return _then(_self.copyWith(high: value));
  });
}
}


/// Adds pattern-matching-related methods to [CashThresholds].
extension CashThresholdsPatterns on CashThresholds {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashThresholds value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashThresholds() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashThresholds value)  $default,){
final _that = this;
switch (_that) {
case _CashThresholds():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashThresholds value)?  $default,){
final _that = this;
switch (_that) {
case _CashThresholds() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int noCash,  AmountRange low,  AmountRange moderate,  AmountRange high)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashThresholds() when $default != null:
return $default(_that.noCash,_that.low,_that.moderate,_that.high);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int noCash,  AmountRange low,  AmountRange moderate,  AmountRange high)  $default,) {final _that = this;
switch (_that) {
case _CashThresholds():
return $default(_that.noCash,_that.low,_that.moderate,_that.high);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int noCash,  AmountRange low,  AmountRange moderate,  AmountRange high)?  $default,) {final _that = this;
switch (_that) {
case _CashThresholds() when $default != null:
return $default(_that.noCash,_that.low,_that.moderate,_that.high);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CashThresholds implements CashThresholds {
  const _CashThresholds({required this.noCash, required this.low, required this.moderate, required this.high});
  factory _CashThresholds.fromJson(Map<String, dynamic> json) => _$CashThresholdsFromJson(json);

@override final  int noCash;
@override final  AmountRange low;
@override final  AmountRange moderate;
@override final  AmountRange high;

/// Create a copy of CashThresholds
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashThresholdsCopyWith<_CashThresholds> get copyWith => __$CashThresholdsCopyWithImpl<_CashThresholds>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CashThresholdsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashThresholds&&(identical(other.noCash, noCash) || other.noCash == noCash)&&(identical(other.low, low) || other.low == low)&&(identical(other.moderate, moderate) || other.moderate == moderate)&&(identical(other.high, high) || other.high == high));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,noCash,low,moderate,high);
}

@override
String toString() {
    return 'CashThresholds(noCash: $noCash, low: $low, moderate: $moderate, high: $high)';
}


}

/// @nodoc
abstract mixin class _$CashThresholdsCopyWith<$Res> implements $CashThresholdsCopyWith<$Res> {
  factory _$CashThresholdsCopyWith(_CashThresholds value, $Res Function(_CashThresholds) _then) = __$CashThresholdsCopyWithImpl;
@override @useResult
$Res call({
 int noCash, AmountRange low, AmountRange moderate, AmountRange high
});


@override $AmountRangeCopyWith<$Res> get low;@override $AmountRangeCopyWith<$Res> get moderate;@override $AmountRangeCopyWith<$Res> get high;

}
/// @nodoc
class __$CashThresholdsCopyWithImpl<$Res>
    implements _$CashThresholdsCopyWith<$Res> {
  __$CashThresholdsCopyWithImpl(this._self, this._then);

  final _CashThresholds _self;
  final $Res Function(_CashThresholds) _then;

/// Create a copy of CashThresholds
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? noCash = null,Object? low = null,Object? moderate = null,Object? high = null,}) {
  return _then(_CashThresholds(
noCash: null == noCash ? _self.noCash : noCash // ignore: cast_nullable_to_non_nullable
as int,low: null == low ? _self.low : low // ignore: cast_nullable_to_non_nullable
as AmountRange,moderate: null == moderate ? _self.moderate : moderate // ignore: cast_nullable_to_non_nullable
as AmountRange,high: null == high ? _self.high : high // ignore: cast_nullable_to_non_nullable
as AmountRange,
  ));
}

/// Create a copy of CashThresholds
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountRangeCopyWith<$Res> get low {
  
  return $AmountRangeCopyWith<$Res>(_self.low, (value) {
    return _then(_self.copyWith(low: value));
  });
}/// Create a copy of CashThresholds
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountRangeCopyWith<$Res> get moderate {
  
  return $AmountRangeCopyWith<$Res>(_self.moderate, (value) {
    return _then(_self.copyWith(moderate: value));
  });
}/// Create a copy of CashThresholds
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountRangeCopyWith<$Res> get high {
  
  return $AmountRangeCopyWith<$Res>(_self.high, (value) {
    return _then(_self.copyWith(high: value));
  });
}
}


/// @nodoc
mixin _$AmountRange {

 int get min; int get max;
/// Create a copy of AmountRange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AmountRangeCopyWith<AmountRange> get copyWith => _$AmountRangeCopyWithImpl<AmountRange>(this as AmountRange, _$identity);

  /// Serializes this AmountRange to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AmountRange;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AmountRange&&(identical(other.min, _this.min) || other.min == _this.min)&&(identical(other.max, _this.max) || other.max == _this.max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AmountRange;
  return Object.hash(runtimeType,_this.min,_this.max);
}

@override
String toString() {
  final _this = this as AmountRange;
  return 'AmountRange(min: ${_this.min}, max: ${_this.max})';
}


}

/// @nodoc
abstract mixin class $AmountRangeCopyWith<$Res>  {
  factory $AmountRangeCopyWith(AmountRange value, $Res Function(AmountRange) _then) = _$AmountRangeCopyWithImpl;
@useResult
$Res call({
 int min, int max
});




}
/// @nodoc
class _$AmountRangeCopyWithImpl<$Res>
    implements $AmountRangeCopyWith<$Res> {
  _$AmountRangeCopyWithImpl(this._self, this._then);

  final AmountRange _self;
  final $Res Function(AmountRange) _then;

/// Create a copy of AmountRange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? min = null,Object? max = null,}) {
  return _then(AmountRange(
min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as int,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AmountRange].
extension AmountRangePatterns on AmountRange {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AmountRange value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AmountRange() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AmountRange value)  $default,){
final _that = this;
switch (_that) {
case _AmountRange():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AmountRange value)?  $default,){
final _that = this;
switch (_that) {
case _AmountRange() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int min,  int max)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AmountRange() when $default != null:
return $default(_that.min,_that.max);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int min,  int max)  $default,) {final _that = this;
switch (_that) {
case _AmountRange():
return $default(_that.min,_that.max);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int min,  int max)?  $default,) {final _that = this;
switch (_that) {
case _AmountRange() when $default != null:
return $default(_that.min,_that.max);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AmountRange implements AmountRange {
  const _AmountRange({required this.min, required this.max});
  factory _AmountRange.fromJson(Map<String, dynamic> json) => _$AmountRangeFromJson(json);

@override final  int min;
@override final  int max;

/// Create a copy of AmountRange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AmountRangeCopyWith<_AmountRange> get copyWith => __$AmountRangeCopyWithImpl<_AmountRange>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AmountRangeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AmountRange&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,min,max);
}

@override
String toString() {
    return 'AmountRange(min: $min, max: $max)';
}


}

/// @nodoc
abstract mixin class _$AmountRangeCopyWith<$Res> implements $AmountRangeCopyWith<$Res> {
  factory _$AmountRangeCopyWith(_AmountRange value, $Res Function(_AmountRange) _then) = __$AmountRangeCopyWithImpl;
@override @useResult
$Res call({
 int min, int max
});




}
/// @nodoc
class __$AmountRangeCopyWithImpl<$Res>
    implements _$AmountRangeCopyWith<$Res> {
  __$AmountRangeCopyWithImpl(this._self, this._then);

  final _AmountRange _self;
  final $Res Function(_AmountRange) _then;

/// Create a copy of AmountRange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? min = null,Object? max = null,}) {
  return _then(_AmountRange(
min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as int,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$RegionOption {

 String get value; String get label;
/// Create a copy of RegionOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegionOptionCopyWith<RegionOption> get copyWith => _$RegionOptionCopyWithImpl<RegionOption>(this as RegionOption, _$identity);

  /// Serializes this RegionOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RegionOption;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegionOption&&(identical(other.value, _this.value) || other.value == _this.value)&&(identical(other.label, _this.label) || other.label == _this.label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RegionOption;
  return Object.hash(runtimeType,_this.value,_this.label);
}

@override
String toString() {
  final _this = this as RegionOption;
  return 'RegionOption(value: ${_this.value}, label: ${_this.label})';
}


}

/// @nodoc
abstract mixin class $RegionOptionCopyWith<$Res>  {
  factory $RegionOptionCopyWith(RegionOption value, $Res Function(RegionOption) _then) = _$RegionOptionCopyWithImpl;
@useResult
$Res call({
 String value, String label
});




}
/// @nodoc
class _$RegionOptionCopyWithImpl<$Res>
    implements $RegionOptionCopyWith<$Res> {
  _$RegionOptionCopyWithImpl(this._self, this._then);

  final RegionOption _self;
  final $Res Function(RegionOption) _then;

/// Create a copy of RegionOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? label = null,}) {
  return _then(RegionOption(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RegionOption].
extension RegionOptionPatterns on RegionOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegionOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegionOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegionOption value)  $default,){
final _that = this;
switch (_that) {
case _RegionOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegionOption value)?  $default,){
final _that = this;
switch (_that) {
case _RegionOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value,  String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegionOption() when $default != null:
return $default(_that.value,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value,  String label)  $default,) {final _that = this;
switch (_that) {
case _RegionOption():
return $default(_that.value,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value,  String label)?  $default,) {final _that = this;
switch (_that) {
case _RegionOption() when $default != null:
return $default(_that.value,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegionOption extends RegionOption {
  const _RegionOption({required this.value, required this.label}): super._();
  factory _RegionOption.fromJson(Map<String, dynamic> json) => _$RegionOptionFromJson(json);

@override final  String value;
@override final  String label;

/// Create a copy of RegionOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegionOptionCopyWith<_RegionOption> get copyWith => __$RegionOptionCopyWithImpl<_RegionOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegionOptionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegionOption&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,value,label);
}

@override
String toString() {
    return 'RegionOption(value: $value, label: $label)';
}


}

/// @nodoc
abstract mixin class _$RegionOptionCopyWith<$Res> implements $RegionOptionCopyWith<$Res> {
  factory _$RegionOptionCopyWith(_RegionOption value, $Res Function(_RegionOption) _then) = __$RegionOptionCopyWithImpl;
@override @useResult
$Res call({
 String value, String label
});




}
/// @nodoc
class __$RegionOptionCopyWithImpl<$Res>
    implements _$RegionOptionCopyWith<$Res> {
  __$RegionOptionCopyWithImpl(this._self, this._then);

  final _RegionOption _self;
  final $Res Function(_RegionOption) _then;

/// Create a copy of RegionOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? label = null,}) {
  return _then(_RegionOption(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$FilterOption {

@JsonKey(unknownEnumValue: TerminalFilter.all) TerminalFilter get key; String get label;
/// Create a copy of FilterOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterOptionCopyWith<FilterOption> get copyWith => _$FilterOptionCopyWithImpl<FilterOption>(this as FilterOption, _$identity);

  /// Serializes this FilterOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FilterOption;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterOption&&(identical(other.key, _this.key) || other.key == _this.key)&&(identical(other.label, _this.label) || other.label == _this.label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FilterOption;
  return Object.hash(runtimeType,_this.key,_this.label);
}

@override
String toString() {
  final _this = this as FilterOption;
  return 'FilterOption(key: ${_this.key}, label: ${_this.label})';
}


}

/// @nodoc
abstract mixin class $FilterOptionCopyWith<$Res>  {
  factory $FilterOptionCopyWith(FilterOption value, $Res Function(FilterOption) _then) = _$FilterOptionCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: TerminalFilter.all) TerminalFilter key, String label
});




}
/// @nodoc
class _$FilterOptionCopyWithImpl<$Res>
    implements $FilterOptionCopyWith<$Res> {
  _$FilterOptionCopyWithImpl(this._self, this._then);

  final FilterOption _self;
  final $Res Function(FilterOption) _then;

/// Create a copy of FilterOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? label = null,}) {
  return _then(FilterOption(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as TerminalFilter,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FilterOption].
extension FilterOptionPatterns on FilterOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FilterOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FilterOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FilterOption value)  $default,){
final _that = this;
switch (_that) {
case _FilterOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FilterOption value)?  $default,){
final _that = this;
switch (_that) {
case _FilterOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: TerminalFilter.all)  TerminalFilter key,  String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FilterOption() when $default != null:
return $default(_that.key,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: TerminalFilter.all)  TerminalFilter key,  String label)  $default,) {final _that = this;
switch (_that) {
case _FilterOption():
return $default(_that.key,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: TerminalFilter.all)  TerminalFilter key,  String label)?  $default,) {final _that = this;
switch (_that) {
case _FilterOption() when $default != null:
return $default(_that.key,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FilterOption implements FilterOption {
  const _FilterOption({@JsonKey(unknownEnumValue: TerminalFilter.all) required this.key, required this.label});
  factory _FilterOption.fromJson(Map<String, dynamic> json) => _$FilterOptionFromJson(json);

@override@JsonKey(unknownEnumValue: TerminalFilter.all) final  TerminalFilter key;
@override final  String label;

/// Create a copy of FilterOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterOptionCopyWith<_FilterOption> get copyWith => __$FilterOptionCopyWithImpl<_FilterOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FilterOptionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterOption&&(identical(other.key, key) || other.key == key)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,key,label);
}

@override
String toString() {
    return 'FilterOption(key: $key, label: $label)';
}


}

/// @nodoc
abstract mixin class _$FilterOptionCopyWith<$Res> implements $FilterOptionCopyWith<$Res> {
  factory _$FilterOptionCopyWith(_FilterOption value, $Res Function(_FilterOption) _then) = __$FilterOptionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: TerminalFilter.all) TerminalFilter key, String label
});




}
/// @nodoc
class __$FilterOptionCopyWithImpl<$Res>
    implements _$FilterOptionCopyWith<$Res> {
  __$FilterOptionCopyWithImpl(this._self, this._then);

  final _FilterOption _self;
  final $Res Function(_FilterOption) _then;

/// Create a copy of FilterOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? label = null,}) {
  return _then(_FilterOption(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as TerminalFilter,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
