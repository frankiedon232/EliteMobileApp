// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'terminal_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Terminal {

 String get terminalId; String? get location;@JsonKey(unknownEnumValue: TerminalStatus.unknown) TerminalStatus get status;/// Naira; null if unknown.
 double? get amount;@JsonKey(unknownEnumValue: CashBand.unknown) CashBand get cashBand; String? get locationType; String? get brand; String? get state; String? get region; String? get solId; DateTime? get lastTxnAt; String? get cardReader;/// Raw monitoring text, e.g. "No Cash Jams" or "Cash Jam: Please clear cash ASAP".
 String? get cashJam; bool get hasCashJam; bool get isIdle; bool get isOfInterest;
/// Create a copy of Terminal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TerminalCopyWith<Terminal> get copyWith => _$TerminalCopyWithImpl<Terminal>(this as Terminal, _$identity);

  /// Serializes this Terminal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Terminal;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Terminal&&(identical(other.terminalId, _this.terminalId) || other.terminalId == _this.terminalId)&&(identical(other.location, _this.location) || other.location == _this.location)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.cashBand, _this.cashBand) || other.cashBand == _this.cashBand)&&(identical(other.locationType, _this.locationType) || other.locationType == _this.locationType)&&(identical(other.brand, _this.brand) || other.brand == _this.brand)&&(identical(other.state, _this.state) || other.state == _this.state)&&(identical(other.region, _this.region) || other.region == _this.region)&&(identical(other.solId, _this.solId) || other.solId == _this.solId)&&(identical(other.lastTxnAt, _this.lastTxnAt) || other.lastTxnAt == _this.lastTxnAt)&&(identical(other.cardReader, _this.cardReader) || other.cardReader == _this.cardReader)&&(identical(other.cashJam, _this.cashJam) || other.cashJam == _this.cashJam)&&(identical(other.hasCashJam, _this.hasCashJam) || other.hasCashJam == _this.hasCashJam)&&(identical(other.isIdle, _this.isIdle) || other.isIdle == _this.isIdle)&&(identical(other.isOfInterest, _this.isOfInterest) || other.isOfInterest == _this.isOfInterest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Terminal;
  return Object.hash(runtimeType,_this.terminalId,_this.location,_this.status,_this.amount,_this.cashBand,_this.locationType,_this.brand,_this.state,_this.region,_this.solId,_this.lastTxnAt,_this.cardReader,_this.cashJam,_this.hasCashJam,_this.isIdle,_this.isOfInterest);
}

@override
String toString() {
  final _this = this as Terminal;
  return 'Terminal(terminalId: ${_this.terminalId}, location: ${_this.location}, status: ${_this.status}, amount: ${_this.amount}, cashBand: ${_this.cashBand}, locationType: ${_this.locationType}, brand: ${_this.brand}, state: ${_this.state}, region: ${_this.region}, solId: ${_this.solId}, lastTxnAt: ${_this.lastTxnAt}, cardReader: ${_this.cardReader}, cashJam: ${_this.cashJam}, hasCashJam: ${_this.hasCashJam}, isIdle: ${_this.isIdle}, isOfInterest: ${_this.isOfInterest})';
}


}

/// @nodoc
abstract mixin class $TerminalCopyWith<$Res>  {
  factory $TerminalCopyWith(Terminal value, $Res Function(Terminal) _then) = _$TerminalCopyWithImpl;
@useResult
$Res call({
 String terminalId, String? location,@JsonKey(unknownEnumValue: TerminalStatus.unknown) TerminalStatus status, double? amount,@JsonKey(unknownEnumValue: CashBand.unknown) CashBand cashBand, String? locationType, String? brand, String? state, String? region, String? solId, DateTime? lastTxnAt, String? cardReader, String? cashJam, bool hasCashJam, bool isIdle, bool isOfInterest
});




}
/// @nodoc
class _$TerminalCopyWithImpl<$Res>
    implements $TerminalCopyWith<$Res> {
  _$TerminalCopyWithImpl(this._self, this._then);

  final Terminal _self;
  final $Res Function(Terminal) _then;

/// Create a copy of Terminal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? terminalId = null,Object? location = freezed,Object? status = null,Object? amount = freezed,Object? cashBand = null,Object? locationType = freezed,Object? brand = freezed,Object? state = freezed,Object? region = freezed,Object? solId = freezed,Object? lastTxnAt = freezed,Object? cardReader = freezed,Object? cashJam = freezed,Object? hasCashJam = null,Object? isIdle = null,Object? isOfInterest = null,}) {
  return _then(Terminal(
terminalId: null == terminalId ? _self.terminalId : terminalId // ignore: cast_nullable_to_non_nullable
as String,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TerminalStatus,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,cashBand: null == cashBand ? _self.cashBand : cashBand // ignore: cast_nullable_to_non_nullable
as CashBand,locationType: freezed == locationType ? _self.locationType : locationType // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,solId: freezed == solId ? _self.solId : solId // ignore: cast_nullable_to_non_nullable
as String?,lastTxnAt: freezed == lastTxnAt ? _self.lastTxnAt : lastTxnAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cardReader: freezed == cardReader ? _self.cardReader : cardReader // ignore: cast_nullable_to_non_nullable
as String?,cashJam: freezed == cashJam ? _self.cashJam : cashJam // ignore: cast_nullable_to_non_nullable
as String?,hasCashJam: null == hasCashJam ? _self.hasCashJam : hasCashJam // ignore: cast_nullable_to_non_nullable
as bool,isIdle: null == isIdle ? _self.isIdle : isIdle // ignore: cast_nullable_to_non_nullable
as bool,isOfInterest: null == isOfInterest ? _self.isOfInterest : isOfInterest // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Terminal].
extension TerminalPatterns on Terminal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Terminal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Terminal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Terminal value)  $default,){
final _that = this;
switch (_that) {
case _Terminal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Terminal value)?  $default,){
final _that = this;
switch (_that) {
case _Terminal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String terminalId,  String? location, @JsonKey(unknownEnumValue: TerminalStatus.unknown)  TerminalStatus status,  double? amount, @JsonKey(unknownEnumValue: CashBand.unknown)  CashBand cashBand,  String? locationType,  String? brand,  String? state,  String? region,  String? solId,  DateTime? lastTxnAt,  String? cardReader,  String? cashJam,  bool hasCashJam,  bool isIdle,  bool isOfInterest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Terminal() when $default != null:
return $default(_that.terminalId,_that.location,_that.status,_that.amount,_that.cashBand,_that.locationType,_that.brand,_that.state,_that.region,_that.solId,_that.lastTxnAt,_that.cardReader,_that.cashJam,_that.hasCashJam,_that.isIdle,_that.isOfInterest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String terminalId,  String? location, @JsonKey(unknownEnumValue: TerminalStatus.unknown)  TerminalStatus status,  double? amount, @JsonKey(unknownEnumValue: CashBand.unknown)  CashBand cashBand,  String? locationType,  String? brand,  String? state,  String? region,  String? solId,  DateTime? lastTxnAt,  String? cardReader,  String? cashJam,  bool hasCashJam,  bool isIdle,  bool isOfInterest)  $default,) {final _that = this;
switch (_that) {
case _Terminal():
return $default(_that.terminalId,_that.location,_that.status,_that.amount,_that.cashBand,_that.locationType,_that.brand,_that.state,_that.region,_that.solId,_that.lastTxnAt,_that.cardReader,_that.cashJam,_that.hasCashJam,_that.isIdle,_that.isOfInterest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String terminalId,  String? location, @JsonKey(unknownEnumValue: TerminalStatus.unknown)  TerminalStatus status,  double? amount, @JsonKey(unknownEnumValue: CashBand.unknown)  CashBand cashBand,  String? locationType,  String? brand,  String? state,  String? region,  String? solId,  DateTime? lastTxnAt,  String? cardReader,  String? cashJam,  bool hasCashJam,  bool isIdle,  bool isOfInterest)?  $default,) {final _that = this;
switch (_that) {
case _Terminal() when $default != null:
return $default(_that.terminalId,_that.location,_that.status,_that.amount,_that.cashBand,_that.locationType,_that.brand,_that.state,_that.region,_that.solId,_that.lastTxnAt,_that.cardReader,_that.cashJam,_that.hasCashJam,_that.isIdle,_that.isOfInterest);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Terminal implements Terminal {
  const _Terminal({required this.terminalId, this.location, @JsonKey(unknownEnumValue: TerminalStatus.unknown) required this.status, this.amount, @JsonKey(unknownEnumValue: CashBand.unknown) required this.cashBand, this.locationType, this.brand, this.state, this.region, this.solId, this.lastTxnAt, this.cardReader, this.cashJam, required this.hasCashJam, required this.isIdle, required this.isOfInterest});
  factory _Terminal.fromJson(Map<String, dynamic> json) => _$TerminalFromJson(json);

@override final  String terminalId;
@override final  String? location;
@override@JsonKey(unknownEnumValue: TerminalStatus.unknown) final  TerminalStatus status;
/// Naira; null if unknown.
@override final  double? amount;
@override@JsonKey(unknownEnumValue: CashBand.unknown) final  CashBand cashBand;
@override final  String? locationType;
@override final  String? brand;
@override final  String? state;
@override final  String? region;
@override final  String? solId;
@override final  DateTime? lastTxnAt;
@override final  String? cardReader;
/// Raw monitoring text, e.g. "No Cash Jams" or "Cash Jam: Please clear cash ASAP".
@override final  String? cashJam;
@override final  bool hasCashJam;
@override final  bool isIdle;
@override final  bool isOfInterest;

/// Create a copy of Terminal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TerminalCopyWith<_Terminal> get copyWith => __$TerminalCopyWithImpl<_Terminal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TerminalToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Terminal&&(identical(other.terminalId, terminalId) || other.terminalId == terminalId)&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.cashBand, cashBand) || other.cashBand == cashBand)&&(identical(other.locationType, locationType) || other.locationType == locationType)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.state, state) || other.state == state)&&(identical(other.region, region) || other.region == region)&&(identical(other.solId, solId) || other.solId == solId)&&(identical(other.lastTxnAt, lastTxnAt) || other.lastTxnAt == lastTxnAt)&&(identical(other.cardReader, cardReader) || other.cardReader == cardReader)&&(identical(other.cashJam, cashJam) || other.cashJam == cashJam)&&(identical(other.hasCashJam, hasCashJam) || other.hasCashJam == hasCashJam)&&(identical(other.isIdle, isIdle) || other.isIdle == isIdle)&&(identical(other.isOfInterest, isOfInterest) || other.isOfInterest == isOfInterest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,terminalId,location,status,amount,cashBand,locationType,brand,state,region,solId,lastTxnAt,cardReader,cashJam,hasCashJam,isIdle,isOfInterest);
}

@override
String toString() {
    return 'Terminal(terminalId: $terminalId, location: $location, status: $status, amount: $amount, cashBand: $cashBand, locationType: $locationType, brand: $brand, state: $state, region: $region, solId: $solId, lastTxnAt: $lastTxnAt, cardReader: $cardReader, cashJam: $cashJam, hasCashJam: $hasCashJam, isIdle: $isIdle, isOfInterest: $isOfInterest)';
}


}

/// @nodoc
abstract mixin class _$TerminalCopyWith<$Res> implements $TerminalCopyWith<$Res> {
  factory _$TerminalCopyWith(_Terminal value, $Res Function(_Terminal) _then) = __$TerminalCopyWithImpl;
@override @useResult
$Res call({
 String terminalId, String? location,@JsonKey(unknownEnumValue: TerminalStatus.unknown) TerminalStatus status, double? amount,@JsonKey(unknownEnumValue: CashBand.unknown) CashBand cashBand, String? locationType, String? brand, String? state, String? region, String? solId, DateTime? lastTxnAt, String? cardReader, String? cashJam, bool hasCashJam, bool isIdle, bool isOfInterest
});




}
/// @nodoc
class __$TerminalCopyWithImpl<$Res>
    implements _$TerminalCopyWith<$Res> {
  __$TerminalCopyWithImpl(this._self, this._then);

  final _Terminal _self;
  final $Res Function(_Terminal) _then;

/// Create a copy of Terminal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? terminalId = null,Object? location = freezed,Object? status = null,Object? amount = freezed,Object? cashBand = null,Object? locationType = freezed,Object? brand = freezed,Object? state = freezed,Object? region = freezed,Object? solId = freezed,Object? lastTxnAt = freezed,Object? cardReader = freezed,Object? cashJam = freezed,Object? hasCashJam = null,Object? isIdle = null,Object? isOfInterest = null,}) {
  return _then(_Terminal(
terminalId: null == terminalId ? _self.terminalId : terminalId // ignore: cast_nullable_to_non_nullable
as String,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TerminalStatus,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,cashBand: null == cashBand ? _self.cashBand : cashBand // ignore: cast_nullable_to_non_nullable
as CashBand,locationType: freezed == locationType ? _self.locationType : locationType // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,solId: freezed == solId ? _self.solId : solId // ignore: cast_nullable_to_non_nullable
as String?,lastTxnAt: freezed == lastTxnAt ? _self.lastTxnAt : lastTxnAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cardReader: freezed == cardReader ? _self.cardReader : cardReader // ignore: cast_nullable_to_non_nullable
as String?,cashJam: freezed == cashJam ? _self.cashJam : cashJam // ignore: cast_nullable_to_non_nullable
as String?,hasCashJam: null == hasCashJam ? _self.hasCashJam : hasCashJam // ignore: cast_nullable_to_non_nullable
as bool,isIdle: null == isIdle ? _self.isIdle : isIdle // ignore: cast_nullable_to_non_nullable
as bool,isOfInterest: null == isOfInterest ? _self.isOfInterest : isOfInterest // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$BackedOutTerminal {

 Terminal get terminal; int? get backedOutDurationSeconds;
/// Create a copy of BackedOutTerminal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackedOutTerminalCopyWith<BackedOutTerminal> get copyWith => _$BackedOutTerminalCopyWithImpl<BackedOutTerminal>(this as BackedOutTerminal, _$identity);

  /// Serializes this BackedOutTerminal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BackedOutTerminal;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackedOutTerminal&&(identical(other.terminal, _this.terminal) || other.terminal == _this.terminal)&&(identical(other.backedOutDurationSeconds, _this.backedOutDurationSeconds) || other.backedOutDurationSeconds == _this.backedOutDurationSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BackedOutTerminal;
  return Object.hash(runtimeType,_this.terminal,_this.backedOutDurationSeconds);
}

@override
String toString() {
  final _this = this as BackedOutTerminal;
  return 'BackedOutTerminal(terminal: ${_this.terminal}, backedOutDurationSeconds: ${_this.backedOutDurationSeconds})';
}


}

/// @nodoc
abstract mixin class $BackedOutTerminalCopyWith<$Res>  {
  factory $BackedOutTerminalCopyWith(BackedOutTerminal value, $Res Function(BackedOutTerminal) _then) = _$BackedOutTerminalCopyWithImpl;
@useResult
$Res call({
 Terminal terminal, int? backedOutDurationSeconds
});


$TerminalCopyWith<$Res> get terminal;

}
/// @nodoc
class _$BackedOutTerminalCopyWithImpl<$Res>
    implements $BackedOutTerminalCopyWith<$Res> {
  _$BackedOutTerminalCopyWithImpl(this._self, this._then);

  final BackedOutTerminal _self;
  final $Res Function(BackedOutTerminal) _then;

/// Create a copy of BackedOutTerminal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? terminal = null,Object? backedOutDurationSeconds = freezed,}) {
  return _then(BackedOutTerminal(
terminal: null == terminal ? _self.terminal : terminal // ignore: cast_nullable_to_non_nullable
as Terminal,backedOutDurationSeconds: freezed == backedOutDurationSeconds ? _self.backedOutDurationSeconds : backedOutDurationSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of BackedOutTerminal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TerminalCopyWith<$Res> get terminal {
  
  return $TerminalCopyWith<$Res>(_self.terminal, (value) {
    return _then(_self.copyWith(terminal: value));
  });
}
}


/// Adds pattern-matching-related methods to [BackedOutTerminal].
extension BackedOutTerminalPatterns on BackedOutTerminal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackedOutTerminal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackedOutTerminal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackedOutTerminal value)  $default,){
final _that = this;
switch (_that) {
case _BackedOutTerminal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackedOutTerminal value)?  $default,){
final _that = this;
switch (_that) {
case _BackedOutTerminal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Terminal terminal,  int? backedOutDurationSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackedOutTerminal() when $default != null:
return $default(_that.terminal,_that.backedOutDurationSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Terminal terminal,  int? backedOutDurationSeconds)  $default,) {final _that = this;
switch (_that) {
case _BackedOutTerminal():
return $default(_that.terminal,_that.backedOutDurationSeconds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Terminal terminal,  int? backedOutDurationSeconds)?  $default,) {final _that = this;
switch (_that) {
case _BackedOutTerminal() when $default != null:
return $default(_that.terminal,_that.backedOutDurationSeconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BackedOutTerminal extends BackedOutTerminal {
  const _BackedOutTerminal({required this.terminal, this.backedOutDurationSeconds}): super._();
  factory _BackedOutTerminal.fromJson(Map<String, dynamic> json) => _$BackedOutTerminalFromJson(json);

@override final  Terminal terminal;
@override final  int? backedOutDurationSeconds;

/// Create a copy of BackedOutTerminal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackedOutTerminalCopyWith<_BackedOutTerminal> get copyWith => __$BackedOutTerminalCopyWithImpl<_BackedOutTerminal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BackedOutTerminalToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackedOutTerminal&&(identical(other.terminal, terminal) || other.terminal == terminal)&&(identical(other.backedOutDurationSeconds, backedOutDurationSeconds) || other.backedOutDurationSeconds == backedOutDurationSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,terminal,backedOutDurationSeconds);
}

@override
String toString() {
    return 'BackedOutTerminal(terminal: $terminal, backedOutDurationSeconds: $backedOutDurationSeconds)';
}


}

/// @nodoc
abstract mixin class _$BackedOutTerminalCopyWith<$Res> implements $BackedOutTerminalCopyWith<$Res> {
  factory _$BackedOutTerminalCopyWith(_BackedOutTerminal value, $Res Function(_BackedOutTerminal) _then) = __$BackedOutTerminalCopyWithImpl;
@override @useResult
$Res call({
 Terminal terminal, int? backedOutDurationSeconds
});


@override $TerminalCopyWith<$Res> get terminal;

}
/// @nodoc
class __$BackedOutTerminalCopyWithImpl<$Res>
    implements _$BackedOutTerminalCopyWith<$Res> {
  __$BackedOutTerminalCopyWithImpl(this._self, this._then);

  final _BackedOutTerminal _self;
  final $Res Function(_BackedOutTerminal) _then;

/// Create a copy of BackedOutTerminal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? terminal = null,Object? backedOutDurationSeconds = freezed,}) {
  return _then(_BackedOutTerminal(
terminal: null == terminal ? _self.terminal : terminal // ignore: cast_nullable_to_non_nullable
as Terminal,backedOutDurationSeconds: freezed == backedOutDurationSeconds ? _self.backedOutDurationSeconds : backedOutDurationSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of BackedOutTerminal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TerminalCopyWith<$Res> get terminal {
  
  return $TerminalCopyWith<$Res>(_self.terminal, (value) {
    return _then(_self.copyWith(terminal: value));
  });
}
}


/// @nodoc
mixin _$TerminalInfo {

 Terminal get terminal; String? get address; String? get branchCode; String? get branchName; String? get country;
/// Create a copy of TerminalInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TerminalInfoCopyWith<TerminalInfo> get copyWith => _$TerminalInfoCopyWithImpl<TerminalInfo>(this as TerminalInfo, _$identity);

  /// Serializes this TerminalInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TerminalInfo;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TerminalInfo&&(identical(other.terminal, _this.terminal) || other.terminal == _this.terminal)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.branchCode, _this.branchCode) || other.branchCode == _this.branchCode)&&(identical(other.branchName, _this.branchName) || other.branchName == _this.branchName)&&(identical(other.country, _this.country) || other.country == _this.country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TerminalInfo;
  return Object.hash(runtimeType,_this.terminal,_this.address,_this.branchCode,_this.branchName,_this.country);
}

@override
String toString() {
  final _this = this as TerminalInfo;
  return 'TerminalInfo(terminal: ${_this.terminal}, address: ${_this.address}, branchCode: ${_this.branchCode}, branchName: ${_this.branchName}, country: ${_this.country})';
}


}

/// @nodoc
abstract mixin class $TerminalInfoCopyWith<$Res>  {
  factory $TerminalInfoCopyWith(TerminalInfo value, $Res Function(TerminalInfo) _then) = _$TerminalInfoCopyWithImpl;
@useResult
$Res call({
 Terminal terminal, String? address, String? branchCode, String? branchName, String? country
});


$TerminalCopyWith<$Res> get terminal;

}
/// @nodoc
class _$TerminalInfoCopyWithImpl<$Res>
    implements $TerminalInfoCopyWith<$Res> {
  _$TerminalInfoCopyWithImpl(this._self, this._then);

  final TerminalInfo _self;
  final $Res Function(TerminalInfo) _then;

/// Create a copy of TerminalInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? terminal = null,Object? address = freezed,Object? branchCode = freezed,Object? branchName = freezed,Object? country = freezed,}) {
  return _then(TerminalInfo(
terminal: null == terminal ? _self.terminal : terminal // ignore: cast_nullable_to_non_nullable
as Terminal,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,branchCode: freezed == branchCode ? _self.branchCode : branchCode // ignore: cast_nullable_to_non_nullable
as String?,branchName: freezed == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TerminalInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TerminalCopyWith<$Res> get terminal {
  
  return $TerminalCopyWith<$Res>(_self.terminal, (value) {
    return _then(_self.copyWith(terminal: value));
  });
}
}


/// Adds pattern-matching-related methods to [TerminalInfo].
extension TerminalInfoPatterns on TerminalInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TerminalInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TerminalInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TerminalInfo value)  $default,){
final _that = this;
switch (_that) {
case _TerminalInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TerminalInfo value)?  $default,){
final _that = this;
switch (_that) {
case _TerminalInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Terminal terminal,  String? address,  String? branchCode,  String? branchName,  String? country)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TerminalInfo() when $default != null:
return $default(_that.terminal,_that.address,_that.branchCode,_that.branchName,_that.country);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Terminal terminal,  String? address,  String? branchCode,  String? branchName,  String? country)  $default,) {final _that = this;
switch (_that) {
case _TerminalInfo():
return $default(_that.terminal,_that.address,_that.branchCode,_that.branchName,_that.country);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Terminal terminal,  String? address,  String? branchCode,  String? branchName,  String? country)?  $default,) {final _that = this;
switch (_that) {
case _TerminalInfo() when $default != null:
return $default(_that.terminal,_that.address,_that.branchCode,_that.branchName,_that.country);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TerminalInfo implements TerminalInfo {
  const _TerminalInfo({required this.terminal, this.address, this.branchCode, this.branchName, this.country});
  factory _TerminalInfo.fromJson(Map<String, dynamic> json) => _$TerminalInfoFromJson(json);

@override final  Terminal terminal;
@override final  String? address;
@override final  String? branchCode;
@override final  String? branchName;
@override final  String? country;

/// Create a copy of TerminalInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TerminalInfoCopyWith<_TerminalInfo> get copyWith => __$TerminalInfoCopyWithImpl<_TerminalInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TerminalInfoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TerminalInfo&&(identical(other.terminal, terminal) || other.terminal == terminal)&&(identical(other.address, address) || other.address == address)&&(identical(other.branchCode, branchCode) || other.branchCode == branchCode)&&(identical(other.branchName, branchName) || other.branchName == branchName)&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,terminal,address,branchCode,branchName,country);
}

@override
String toString() {
    return 'TerminalInfo(terminal: $terminal, address: $address, branchCode: $branchCode, branchName: $branchName, country: $country)';
}


}

/// @nodoc
abstract mixin class _$TerminalInfoCopyWith<$Res> implements $TerminalInfoCopyWith<$Res> {
  factory _$TerminalInfoCopyWith(_TerminalInfo value, $Res Function(_TerminalInfo) _then) = __$TerminalInfoCopyWithImpl;
@override @useResult
$Res call({
 Terminal terminal, String? address, String? branchCode, String? branchName, String? country
});


@override $TerminalCopyWith<$Res> get terminal;

}
/// @nodoc
class __$TerminalInfoCopyWithImpl<$Res>
    implements _$TerminalInfoCopyWith<$Res> {
  __$TerminalInfoCopyWithImpl(this._self, this._then);

  final _TerminalInfo _self;
  final $Res Function(_TerminalInfo) _then;

/// Create a copy of TerminalInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? terminal = null,Object? address = freezed,Object? branchCode = freezed,Object? branchName = freezed,Object? country = freezed,}) {
  return _then(_TerminalInfo(
terminal: null == terminal ? _self.terminal : terminal // ignore: cast_nullable_to_non_nullable
as Terminal,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,branchCode: freezed == branchCode ? _self.branchCode : branchCode // ignore: cast_nullable_to_non_nullable
as String?,branchName: freezed == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TerminalInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TerminalCopyWith<$Res> get terminal {
  
  return $TerminalCopyWith<$Res>(_self.terminal, (value) {
    return _then(_self.copyWith(terminal: value));
  });
}
}


/// @nodoc
mixin _$TerminalDetail {

 TerminalInfo get info; PerformanceStats get performanceToday; DateTime get asAt;
/// Create a copy of TerminalDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TerminalDetailCopyWith<TerminalDetail> get copyWith => _$TerminalDetailCopyWithImpl<TerminalDetail>(this as TerminalDetail, _$identity);

  /// Serializes this TerminalDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TerminalDetail;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TerminalDetail&&(identical(other.info, _this.info) || other.info == _this.info)&&(identical(other.performanceToday, _this.performanceToday) || other.performanceToday == _this.performanceToday)&&(identical(other.asAt, _this.asAt) || other.asAt == _this.asAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TerminalDetail;
  return Object.hash(runtimeType,_this.info,_this.performanceToday,_this.asAt);
}

@override
String toString() {
  final _this = this as TerminalDetail;
  return 'TerminalDetail(info: ${_this.info}, performanceToday: ${_this.performanceToday}, asAt: ${_this.asAt})';
}


}

/// @nodoc
abstract mixin class $TerminalDetailCopyWith<$Res>  {
  factory $TerminalDetailCopyWith(TerminalDetail value, $Res Function(TerminalDetail) _then) = _$TerminalDetailCopyWithImpl;
@useResult
$Res call({
 TerminalInfo info, PerformanceStats performanceToday, DateTime asAt
});


$TerminalInfoCopyWith<$Res> get info;$PerformanceStatsCopyWith<$Res> get performanceToday;

}
/// @nodoc
class _$TerminalDetailCopyWithImpl<$Res>
    implements $TerminalDetailCopyWith<$Res> {
  _$TerminalDetailCopyWithImpl(this._self, this._then);

  final TerminalDetail _self;
  final $Res Function(TerminalDetail) _then;

/// Create a copy of TerminalDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? info = null,Object? performanceToday = null,Object? asAt = null,}) {
  return _then(TerminalDetail(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as TerminalInfo,performanceToday: null == performanceToday ? _self.performanceToday : performanceToday // ignore: cast_nullable_to_non_nullable
as PerformanceStats,asAt: null == asAt ? _self.asAt : asAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of TerminalDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TerminalInfoCopyWith<$Res> get info {
  
  return $TerminalInfoCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}/// Create a copy of TerminalDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PerformanceStatsCopyWith<$Res> get performanceToday {
  
  return $PerformanceStatsCopyWith<$Res>(_self.performanceToday, (value) {
    return _then(_self.copyWith(performanceToday: value));
  });
}
}


/// Adds pattern-matching-related methods to [TerminalDetail].
extension TerminalDetailPatterns on TerminalDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TerminalDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TerminalDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TerminalDetail value)  $default,){
final _that = this;
switch (_that) {
case _TerminalDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TerminalDetail value)?  $default,){
final _that = this;
switch (_that) {
case _TerminalDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TerminalInfo info,  PerformanceStats performanceToday,  DateTime asAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TerminalDetail() when $default != null:
return $default(_that.info,_that.performanceToday,_that.asAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TerminalInfo info,  PerformanceStats performanceToday,  DateTime asAt)  $default,) {final _that = this;
switch (_that) {
case _TerminalDetail():
return $default(_that.info,_that.performanceToday,_that.asAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TerminalInfo info,  PerformanceStats performanceToday,  DateTime asAt)?  $default,) {final _that = this;
switch (_that) {
case _TerminalDetail() when $default != null:
return $default(_that.info,_that.performanceToday,_that.asAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TerminalDetail implements TerminalDetail {
  const _TerminalDetail({required this.info, required this.performanceToday, required this.asAt});
  factory _TerminalDetail.fromJson(Map<String, dynamic> json) => _$TerminalDetailFromJson(json);

@override final  TerminalInfo info;
@override final  PerformanceStats performanceToday;
@override final  DateTime asAt;

/// Create a copy of TerminalDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TerminalDetailCopyWith<_TerminalDetail> get copyWith => __$TerminalDetailCopyWithImpl<_TerminalDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TerminalDetailToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TerminalDetail&&(identical(other.info, info) || other.info == info)&&(identical(other.performanceToday, performanceToday) || other.performanceToday == performanceToday)&&(identical(other.asAt, asAt) || other.asAt == asAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,info,performanceToday,asAt);
}

@override
String toString() {
    return 'TerminalDetail(info: $info, performanceToday: $performanceToday, asAt: $asAt)';
}


}

/// @nodoc
abstract mixin class _$TerminalDetailCopyWith<$Res> implements $TerminalDetailCopyWith<$Res> {
  factory _$TerminalDetailCopyWith(_TerminalDetail value, $Res Function(_TerminalDetail) _then) = __$TerminalDetailCopyWithImpl;
@override @useResult
$Res call({
 TerminalInfo info, PerformanceStats performanceToday, DateTime asAt
});


@override $TerminalInfoCopyWith<$Res> get info;@override $PerformanceStatsCopyWith<$Res> get performanceToday;

}
/// @nodoc
class __$TerminalDetailCopyWithImpl<$Res>
    implements _$TerminalDetailCopyWith<$Res> {
  __$TerminalDetailCopyWithImpl(this._self, this._then);

  final _TerminalDetail _self;
  final $Res Function(_TerminalDetail) _then;

/// Create a copy of TerminalDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? info = null,Object? performanceToday = null,Object? asAt = null,}) {
  return _then(_TerminalDetail(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as TerminalInfo,performanceToday: null == performanceToday ? _self.performanceToday : performanceToday // ignore: cast_nullable_to_non_nullable
as PerformanceStats,asAt: null == asAt ? _self.asAt : asAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of TerminalDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TerminalInfoCopyWith<$Res> get info {
  
  return $TerminalInfoCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}/// Create a copy of TerminalDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PerformanceStatsCopyWith<$Res> get performanceToday {
  
  return $PerformanceStatsCopyWith<$Res>(_self.performanceToday, (value) {
    return _then(_self.copyWith(performanceToday: value));
  });
}
}


/// @nodoc
mixin _$FacetValue {

 String get value; int get count;
/// Create a copy of FacetValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FacetValueCopyWith<FacetValue> get copyWith => _$FacetValueCopyWithImpl<FacetValue>(this as FacetValue, _$identity);

  /// Serializes this FacetValue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FacetValue;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FacetValue&&(identical(other.value, _this.value) || other.value == _this.value)&&(identical(other.count, _this.count) || other.count == _this.count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FacetValue;
  return Object.hash(runtimeType,_this.value,_this.count);
}

@override
String toString() {
  final _this = this as FacetValue;
  return 'FacetValue(value: ${_this.value}, count: ${_this.count})';
}


}

/// @nodoc
abstract mixin class $FacetValueCopyWith<$Res>  {
  factory $FacetValueCopyWith(FacetValue value, $Res Function(FacetValue) _then) = _$FacetValueCopyWithImpl;
@useResult
$Res call({
 String value, int count
});




}
/// @nodoc
class _$FacetValueCopyWithImpl<$Res>
    implements $FacetValueCopyWith<$Res> {
  _$FacetValueCopyWithImpl(this._self, this._then);

  final FacetValue _self;
  final $Res Function(FacetValue) _then;

/// Create a copy of FacetValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? count = null,}) {
  return _then(FacetValue(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FacetValue].
extension FacetValuePatterns on FacetValue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FacetValue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FacetValue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FacetValue value)  $default,){
final _that = this;
switch (_that) {
case _FacetValue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FacetValue value)?  $default,){
final _that = this;
switch (_that) {
case _FacetValue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FacetValue() when $default != null:
return $default(_that.value,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value,  int count)  $default,) {final _that = this;
switch (_that) {
case _FacetValue():
return $default(_that.value,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value,  int count)?  $default,) {final _that = this;
switch (_that) {
case _FacetValue() when $default != null:
return $default(_that.value,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FacetValue implements FacetValue {
  const _FacetValue({required this.value, required this.count});
  factory _FacetValue.fromJson(Map<String, dynamic> json) => _$FacetValueFromJson(json);

@override final  String value;
@override final  int count;

/// Create a copy of FacetValue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FacetValueCopyWith<_FacetValue> get copyWith => __$FacetValueCopyWithImpl<_FacetValue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FacetValueToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FacetValue&&(identical(other.value, value) || other.value == value)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,value,count);
}

@override
String toString() {
    return 'FacetValue(value: $value, count: $count)';
}


}

/// @nodoc
abstract mixin class _$FacetValueCopyWith<$Res> implements $FacetValueCopyWith<$Res> {
  factory _$FacetValueCopyWith(_FacetValue value, $Res Function(_FacetValue) _then) = __$FacetValueCopyWithImpl;
@override @useResult
$Res call({
 String value, int count
});




}
/// @nodoc
class __$FacetValueCopyWithImpl<$Res>
    implements _$FacetValueCopyWith<$Res> {
  __$FacetValueCopyWithImpl(this._self, this._then);

  final _FacetValue _self;
  final $Res Function(_FacetValue) _then;

/// Create a copy of FacetValue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? count = null,}) {
  return _then(_FacetValue(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$TerminalFacets {

 List<FacetValue> get state; List<FacetValue> get brand; List<FacetValue> get locationType; List<FacetValue> get region; List<FacetValue> get status;
/// Create a copy of TerminalFacets
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TerminalFacetsCopyWith<TerminalFacets> get copyWith => _$TerminalFacetsCopyWithImpl<TerminalFacets>(this as TerminalFacets, _$identity);

  /// Serializes this TerminalFacets to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TerminalFacets;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TerminalFacets&&const DeepCollectionEquality().equals(other.state, _this.state)&&const DeepCollectionEquality().equals(other.brand, _this.brand)&&const DeepCollectionEquality().equals(other.locationType, _this.locationType)&&const DeepCollectionEquality().equals(other.region, _this.region)&&const DeepCollectionEquality().equals(other.status, _this.status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TerminalFacets;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.state),const DeepCollectionEquality().hash(_this.brand),const DeepCollectionEquality().hash(_this.locationType),const DeepCollectionEquality().hash(_this.region),const DeepCollectionEquality().hash(_this.status));
}

@override
String toString() {
  final _this = this as TerminalFacets;
  return 'TerminalFacets(state: ${_this.state}, brand: ${_this.brand}, locationType: ${_this.locationType}, region: ${_this.region}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $TerminalFacetsCopyWith<$Res>  {
  factory $TerminalFacetsCopyWith(TerminalFacets value, $Res Function(TerminalFacets) _then) = _$TerminalFacetsCopyWithImpl;
@useResult
$Res call({
 List<FacetValue> state, List<FacetValue> brand, List<FacetValue> locationType, List<FacetValue> region, List<FacetValue> status
});




}
/// @nodoc
class _$TerminalFacetsCopyWithImpl<$Res>
    implements $TerminalFacetsCopyWith<$Res> {
  _$TerminalFacetsCopyWithImpl(this._self, this._then);

  final TerminalFacets _self;
  final $Res Function(TerminalFacets) _then;

/// Create a copy of TerminalFacets
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? brand = null,Object? locationType = null,Object? region = null,Object? status = null,}) {
  return _then(TerminalFacets(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as List<FacetValue>,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as List<FacetValue>,locationType: null == locationType ? _self.locationType : locationType // ignore: cast_nullable_to_non_nullable
as List<FacetValue>,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as List<FacetValue>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as List<FacetValue>,
  ));
}

}


/// Adds pattern-matching-related methods to [TerminalFacets].
extension TerminalFacetsPatterns on TerminalFacets {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TerminalFacets value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TerminalFacets() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TerminalFacets value)  $default,){
final _that = this;
switch (_that) {
case _TerminalFacets():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TerminalFacets value)?  $default,){
final _that = this;
switch (_that) {
case _TerminalFacets() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<FacetValue> state,  List<FacetValue> brand,  List<FacetValue> locationType,  List<FacetValue> region,  List<FacetValue> status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TerminalFacets() when $default != null:
return $default(_that.state,_that.brand,_that.locationType,_that.region,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<FacetValue> state,  List<FacetValue> brand,  List<FacetValue> locationType,  List<FacetValue> region,  List<FacetValue> status)  $default,) {final _that = this;
switch (_that) {
case _TerminalFacets():
return $default(_that.state,_that.brand,_that.locationType,_that.region,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<FacetValue> state,  List<FacetValue> brand,  List<FacetValue> locationType,  List<FacetValue> region,  List<FacetValue> status)?  $default,) {final _that = this;
switch (_that) {
case _TerminalFacets() when $default != null:
return $default(_that.state,_that.brand,_that.locationType,_that.region,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TerminalFacets implements TerminalFacets {
  const _TerminalFacets({ List<FacetValue> state = const <FacetValue>[],  List<FacetValue> brand = const <FacetValue>[],  List<FacetValue> locationType = const <FacetValue>[],  List<FacetValue> region = const <FacetValue>[],  List<FacetValue> status = const <FacetValue>[]}): _state = state,_brand = brand,_locationType = locationType,_region = region,_status = status;
  factory _TerminalFacets.fromJson(Map<String, dynamic> json) => _$TerminalFacetsFromJson(json);

 final  List<FacetValue> _state;
@override@JsonKey() List<FacetValue> get state {
  if (_state is EqualUnmodifiableListView) return _state;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_state);
}

 final  List<FacetValue> _brand;
@override@JsonKey() List<FacetValue> get brand {
  if (_brand is EqualUnmodifiableListView) return _brand;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_brand);
}

 final  List<FacetValue> _locationType;
@override@JsonKey() List<FacetValue> get locationType {
  if (_locationType is EqualUnmodifiableListView) return _locationType;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_locationType);
}

 final  List<FacetValue> _region;
@override@JsonKey() List<FacetValue> get region {
  if (_region is EqualUnmodifiableListView) return _region;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_region);
}

 final  List<FacetValue> _status;
@override@JsonKey() List<FacetValue> get status {
  if (_status is EqualUnmodifiableListView) return _status;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_status);
}


/// Create a copy of TerminalFacets
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TerminalFacetsCopyWith<_TerminalFacets> get copyWith => __$TerminalFacetsCopyWithImpl<_TerminalFacets>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TerminalFacetsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TerminalFacets&&const DeepCollectionEquality().equals(other.state, _state)&&const DeepCollectionEquality().equals(other.brand, _brand)&&const DeepCollectionEquality().equals(other.locationType, _locationType)&&const DeepCollectionEquality().equals(other.region, _region)&&const DeepCollectionEquality().equals(other.status, _status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_state),const DeepCollectionEquality().hash(_brand),const DeepCollectionEquality().hash(_locationType),const DeepCollectionEquality().hash(_region),const DeepCollectionEquality().hash(_status));
}

@override
String toString() {
    return 'TerminalFacets(state: $state, brand: $brand, locationType: $locationType, region: $region, status: $status)';
}


}

/// @nodoc
abstract mixin class _$TerminalFacetsCopyWith<$Res> implements $TerminalFacetsCopyWith<$Res> {
  factory _$TerminalFacetsCopyWith(_TerminalFacets value, $Res Function(_TerminalFacets) _then) = __$TerminalFacetsCopyWithImpl;
@override @useResult
$Res call({
 List<FacetValue> state, List<FacetValue> brand, List<FacetValue> locationType, List<FacetValue> region, List<FacetValue> status
});




}
/// @nodoc
class __$TerminalFacetsCopyWithImpl<$Res>
    implements _$TerminalFacetsCopyWith<$Res> {
  __$TerminalFacetsCopyWithImpl(this._self, this._then);

  final _TerminalFacets _self;
  final $Res Function(_TerminalFacets) _then;

/// Create a copy of TerminalFacets
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? brand = null,Object? locationType = null,Object? region = null,Object? status = null,}) {
  return _then(_TerminalFacets(
state: null == state ? _self._state : state // ignore: cast_nullable_to_non_nullable
as List<FacetValue>,brand: null == brand ? _self._brand : brand // ignore: cast_nullable_to_non_nullable
as List<FacetValue>,locationType: null == locationType ? _self._locationType : locationType // ignore: cast_nullable_to_non_nullable
as List<FacetValue>,region: null == region ? _self._region : region // ignore: cast_nullable_to_non_nullable
as List<FacetValue>,status: null == status ? _self._status : status // ignore: cast_nullable_to_non_nullable
as List<FacetValue>,
  ));
}


}

/// @nodoc
mixin _$TerminalQuery {

 TerminalFilter get filter; String? get region; List<String> get states; List<String> get brands; List<String> get locationTypes; List<TerminalStatus> get statuses; String? get search; int? get minAmount; int? get maxAmount; int? get idleHours; TerminalSort get sort; bool get ascending; int get perPage; bool get includeFacets;
/// Create a copy of TerminalQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TerminalQueryCopyWith<TerminalQuery> get copyWith => _$TerminalQueryCopyWithImpl<TerminalQuery>(this as TerminalQuery, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TerminalQuery;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TerminalQuery&&(identical(other.filter, _this.filter) || other.filter == _this.filter)&&(identical(other.region, _this.region) || other.region == _this.region)&&const DeepCollectionEquality().equals(other.states, _this.states)&&const DeepCollectionEquality().equals(other.brands, _this.brands)&&const DeepCollectionEquality().equals(other.locationTypes, _this.locationTypes)&&const DeepCollectionEquality().equals(other.statuses, _this.statuses)&&(identical(other.search, _this.search) || other.search == _this.search)&&(identical(other.minAmount, _this.minAmount) || other.minAmount == _this.minAmount)&&(identical(other.maxAmount, _this.maxAmount) || other.maxAmount == _this.maxAmount)&&(identical(other.idleHours, _this.idleHours) || other.idleHours == _this.idleHours)&&(identical(other.sort, _this.sort) || other.sort == _this.sort)&&(identical(other.ascending, _this.ascending) || other.ascending == _this.ascending)&&(identical(other.perPage, _this.perPage) || other.perPage == _this.perPage)&&(identical(other.includeFacets, _this.includeFacets) || other.includeFacets == _this.includeFacets));
}


@override
int get hashCode {
  final _this = this as TerminalQuery;
  return Object.hash(runtimeType,_this.filter,_this.region,const DeepCollectionEquality().hash(_this.states),const DeepCollectionEquality().hash(_this.brands),const DeepCollectionEquality().hash(_this.locationTypes),const DeepCollectionEquality().hash(_this.statuses),_this.search,_this.minAmount,_this.maxAmount,_this.idleHours,_this.sort,_this.ascending,_this.perPage,_this.includeFacets);
}

@override
String toString() {
  final _this = this as TerminalQuery;
  return 'TerminalQuery(filter: ${_this.filter}, region: ${_this.region}, states: ${_this.states}, brands: ${_this.brands}, locationTypes: ${_this.locationTypes}, statuses: ${_this.statuses}, search: ${_this.search}, minAmount: ${_this.minAmount}, maxAmount: ${_this.maxAmount}, idleHours: ${_this.idleHours}, sort: ${_this.sort}, ascending: ${_this.ascending}, perPage: ${_this.perPage}, includeFacets: ${_this.includeFacets})';
}


}

/// @nodoc
abstract mixin class $TerminalQueryCopyWith<$Res>  {
  factory $TerminalQueryCopyWith(TerminalQuery value, $Res Function(TerminalQuery) _then) = _$TerminalQueryCopyWithImpl;
@useResult
$Res call({
 TerminalFilter filter, String? region, List<String> states, List<String> brands, List<String> locationTypes, List<TerminalStatus> statuses, String? search, int? minAmount, int? maxAmount, int? idleHours, TerminalSort sort, bool ascending, int perPage, bool includeFacets
});




}
/// @nodoc
class _$TerminalQueryCopyWithImpl<$Res>
    implements $TerminalQueryCopyWith<$Res> {
  _$TerminalQueryCopyWithImpl(this._self, this._then);

  final TerminalQuery _self;
  final $Res Function(TerminalQuery) _then;

/// Create a copy of TerminalQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filter = null,Object? region = freezed,Object? states = null,Object? brands = null,Object? locationTypes = null,Object? statuses = null,Object? search = freezed,Object? minAmount = freezed,Object? maxAmount = freezed,Object? idleHours = freezed,Object? sort = null,Object? ascending = null,Object? perPage = null,Object? includeFacets = null,}) {
  return _then(TerminalQuery(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as TerminalFilter,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,states: null == states ? _self.states : states // ignore: cast_nullable_to_non_nullable
as List<String>,brands: null == brands ? _self.brands : brands // ignore: cast_nullable_to_non_nullable
as List<String>,locationTypes: null == locationTypes ? _self.locationTypes : locationTypes // ignore: cast_nullable_to_non_nullable
as List<String>,statuses: null == statuses ? _self.statuses : statuses // ignore: cast_nullable_to_non_nullable
as List<TerminalStatus>,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,minAmount: freezed == minAmount ? _self.minAmount : minAmount // ignore: cast_nullable_to_non_nullable
as int?,maxAmount: freezed == maxAmount ? _self.maxAmount : maxAmount // ignore: cast_nullable_to_non_nullable
as int?,idleHours: freezed == idleHours ? _self.idleHours : idleHours // ignore: cast_nullable_to_non_nullable
as int?,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as TerminalSort,ascending: null == ascending ? _self.ascending : ascending // ignore: cast_nullable_to_non_nullable
as bool,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,includeFacets: null == includeFacets ? _self.includeFacets : includeFacets // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TerminalQuery].
extension TerminalQueryPatterns on TerminalQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TerminalQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TerminalQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TerminalQuery value)  $default,){
final _that = this;
switch (_that) {
case _TerminalQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TerminalQuery value)?  $default,){
final _that = this;
switch (_that) {
case _TerminalQuery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TerminalFilter filter,  String? region,  List<String> states,  List<String> brands,  List<String> locationTypes,  List<TerminalStatus> statuses,  String? search,  int? minAmount,  int? maxAmount,  int? idleHours,  TerminalSort sort,  bool ascending,  int perPage,  bool includeFacets)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TerminalQuery() when $default != null:
return $default(_that.filter,_that.region,_that.states,_that.brands,_that.locationTypes,_that.statuses,_that.search,_that.minAmount,_that.maxAmount,_that.idleHours,_that.sort,_that.ascending,_that.perPage,_that.includeFacets);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TerminalFilter filter,  String? region,  List<String> states,  List<String> brands,  List<String> locationTypes,  List<TerminalStatus> statuses,  String? search,  int? minAmount,  int? maxAmount,  int? idleHours,  TerminalSort sort,  bool ascending,  int perPage,  bool includeFacets)  $default,) {final _that = this;
switch (_that) {
case _TerminalQuery():
return $default(_that.filter,_that.region,_that.states,_that.brands,_that.locationTypes,_that.statuses,_that.search,_that.minAmount,_that.maxAmount,_that.idleHours,_that.sort,_that.ascending,_that.perPage,_that.includeFacets);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TerminalFilter filter,  String? region,  List<String> states,  List<String> brands,  List<String> locationTypes,  List<TerminalStatus> statuses,  String? search,  int? minAmount,  int? maxAmount,  int? idleHours,  TerminalSort sort,  bool ascending,  int perPage,  bool includeFacets)?  $default,) {final _that = this;
switch (_that) {
case _TerminalQuery() when $default != null:
return $default(_that.filter,_that.region,_that.states,_that.brands,_that.locationTypes,_that.statuses,_that.search,_that.minAmount,_that.maxAmount,_that.idleHours,_that.sort,_that.ascending,_that.perPage,_that.includeFacets);case _:
  return null;

}
}

}

/// @nodoc


class _TerminalQuery extends TerminalQuery {
  const _TerminalQuery({this.filter = TerminalFilter.all, this.region,  List<String> states = const <String>[],  List<String> brands = const <String>[],  List<String> locationTypes = const <String>[],  List<TerminalStatus> statuses = const <TerminalStatus>[], this.search, this.minAmount, this.maxAmount, this.idleHours, this.sort = TerminalSort.terminalId, this.ascending = true, this.perPage = 20, this.includeFacets = false}): _states = states,_brands = brands,_locationTypes = locationTypes,_statuses = statuses,super._();
  

@override@JsonKey() final  TerminalFilter filter;
@override final  String? region;
 final  List<String> _states;
@override@JsonKey() List<String> get states {
  if (_states is EqualUnmodifiableListView) return _states;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_states);
}

 final  List<String> _brands;
@override@JsonKey() List<String> get brands {
  if (_brands is EqualUnmodifiableListView) return _brands;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_brands);
}

 final  List<String> _locationTypes;
@override@JsonKey() List<String> get locationTypes {
  if (_locationTypes is EqualUnmodifiableListView) return _locationTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_locationTypes);
}

 final  List<TerminalStatus> _statuses;
@override@JsonKey() List<TerminalStatus> get statuses {
  if (_statuses is EqualUnmodifiableListView) return _statuses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_statuses);
}

@override final  String? search;
@override final  int? minAmount;
@override final  int? maxAmount;
@override final  int? idleHours;
@override@JsonKey() final  TerminalSort sort;
@override@JsonKey() final  bool ascending;
@override@JsonKey() final  int perPage;
@override@JsonKey() final  bool includeFacets;

/// Create a copy of TerminalQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TerminalQueryCopyWith<_TerminalQuery> get copyWith => __$TerminalQueryCopyWithImpl<_TerminalQuery>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TerminalQuery&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.region, region) || other.region == region)&&const DeepCollectionEquality().equals(other.states, _states)&&const DeepCollectionEquality().equals(other.brands, _brands)&&const DeepCollectionEquality().equals(other.locationTypes, _locationTypes)&&const DeepCollectionEquality().equals(other.statuses, _statuses)&&(identical(other.search, search) || other.search == search)&&(identical(other.minAmount, minAmount) || other.minAmount == minAmount)&&(identical(other.maxAmount, maxAmount) || other.maxAmount == maxAmount)&&(identical(other.idleHours, idleHours) || other.idleHours == idleHours)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.ascending, ascending) || other.ascending == ascending)&&(identical(other.perPage, perPage) || other.perPage == perPage)&&(identical(other.includeFacets, includeFacets) || other.includeFacets == includeFacets));
}


@override
int get hashCode {
    return Object.hash(runtimeType,filter,region,const DeepCollectionEquality().hash(_states),const DeepCollectionEquality().hash(_brands),const DeepCollectionEquality().hash(_locationTypes),const DeepCollectionEquality().hash(_statuses),search,minAmount,maxAmount,idleHours,sort,ascending,perPage,includeFacets);
}

@override
String toString() {
    return 'TerminalQuery(filter: $filter, region: $region, states: $states, brands: $brands, locationTypes: $locationTypes, statuses: $statuses, search: $search, minAmount: $minAmount, maxAmount: $maxAmount, idleHours: $idleHours, sort: $sort, ascending: $ascending, perPage: $perPage, includeFacets: $includeFacets)';
}


}

/// @nodoc
abstract mixin class _$TerminalQueryCopyWith<$Res> implements $TerminalQueryCopyWith<$Res> {
  factory _$TerminalQueryCopyWith(_TerminalQuery value, $Res Function(_TerminalQuery) _then) = __$TerminalQueryCopyWithImpl;
@override @useResult
$Res call({
 TerminalFilter filter, String? region, List<String> states, List<String> brands, List<String> locationTypes, List<TerminalStatus> statuses, String? search, int? minAmount, int? maxAmount, int? idleHours, TerminalSort sort, bool ascending, int perPage, bool includeFacets
});




}
/// @nodoc
class __$TerminalQueryCopyWithImpl<$Res>
    implements _$TerminalQueryCopyWith<$Res> {
  __$TerminalQueryCopyWithImpl(this._self, this._then);

  final _TerminalQuery _self;
  final $Res Function(_TerminalQuery) _then;

/// Create a copy of TerminalQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filter = null,Object? region = freezed,Object? states = null,Object? brands = null,Object? locationTypes = null,Object? statuses = null,Object? search = freezed,Object? minAmount = freezed,Object? maxAmount = freezed,Object? idleHours = freezed,Object? sort = null,Object? ascending = null,Object? perPage = null,Object? includeFacets = null,}) {
  return _then(_TerminalQuery(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as TerminalFilter,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,states: null == states ? _self._states : states // ignore: cast_nullable_to_non_nullable
as List<String>,brands: null == brands ? _self._brands : brands // ignore: cast_nullable_to_non_nullable
as List<String>,locationTypes: null == locationTypes ? _self._locationTypes : locationTypes // ignore: cast_nullable_to_non_nullable
as List<String>,statuses: null == statuses ? _self._statuses : statuses // ignore: cast_nullable_to_non_nullable
as List<TerminalStatus>,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,minAmount: freezed == minAmount ? _self.minAmount : minAmount // ignore: cast_nullable_to_non_nullable
as int?,maxAmount: freezed == maxAmount ? _self.maxAmount : maxAmount // ignore: cast_nullable_to_non_nullable
as int?,idleHours: freezed == idleHours ? _self.idleHours : idleHours // ignore: cast_nullable_to_non_nullable
as int?,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as TerminalSort,ascending: null == ascending ? _self.ascending : ascending // ignore: cast_nullable_to_non_nullable
as bool,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,includeFacets: null == includeFacets ? _self.includeFacets : includeFacets // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
