// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'performance_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PerformanceStats {

 int get samples; double? get uptime; double? get downtime; double? get offline; double? get closed; double? get cashJam; bool get noData;
/// Create a copy of PerformanceStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PerformanceStatsCopyWith<PerformanceStats> get copyWith => _$PerformanceStatsCopyWithImpl<PerformanceStats>(this as PerformanceStats, _$identity);

  /// Serializes this PerformanceStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PerformanceStats;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PerformanceStats&&(identical(other.samples, _this.samples) || other.samples == _this.samples)&&(identical(other.uptime, _this.uptime) || other.uptime == _this.uptime)&&(identical(other.downtime, _this.downtime) || other.downtime == _this.downtime)&&(identical(other.offline, _this.offline) || other.offline == _this.offline)&&(identical(other.closed, _this.closed) || other.closed == _this.closed)&&(identical(other.cashJam, _this.cashJam) || other.cashJam == _this.cashJam)&&(identical(other.noData, _this.noData) || other.noData == _this.noData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PerformanceStats;
  return Object.hash(runtimeType,_this.samples,_this.uptime,_this.downtime,_this.offline,_this.closed,_this.cashJam,_this.noData);
}

@override
String toString() {
  final _this = this as PerformanceStats;
  return 'PerformanceStats(samples: ${_this.samples}, uptime: ${_this.uptime}, downtime: ${_this.downtime}, offline: ${_this.offline}, closed: ${_this.closed}, cashJam: ${_this.cashJam}, noData: ${_this.noData})';
}


}

/// @nodoc
abstract mixin class $PerformanceStatsCopyWith<$Res>  {
  factory $PerformanceStatsCopyWith(PerformanceStats value, $Res Function(PerformanceStats) _then) = _$PerformanceStatsCopyWithImpl;
@useResult
$Res call({
 int samples, double? uptime, double? downtime, double? offline, double? closed, double? cashJam, bool noData
});




}
/// @nodoc
class _$PerformanceStatsCopyWithImpl<$Res>
    implements $PerformanceStatsCopyWith<$Res> {
  _$PerformanceStatsCopyWithImpl(this._self, this._then);

  final PerformanceStats _self;
  final $Res Function(PerformanceStats) _then;

/// Create a copy of PerformanceStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? samples = null,Object? uptime = freezed,Object? downtime = freezed,Object? offline = freezed,Object? closed = freezed,Object? cashJam = freezed,Object? noData = null,}) {
  return _then(PerformanceStats(
samples: null == samples ? _self.samples : samples // ignore: cast_nullable_to_non_nullable
as int,uptime: freezed == uptime ? _self.uptime : uptime // ignore: cast_nullable_to_non_nullable
as double?,downtime: freezed == downtime ? _self.downtime : downtime // ignore: cast_nullable_to_non_nullable
as double?,offline: freezed == offline ? _self.offline : offline // ignore: cast_nullable_to_non_nullable
as double?,closed: freezed == closed ? _self.closed : closed // ignore: cast_nullable_to_non_nullable
as double?,cashJam: freezed == cashJam ? _self.cashJam : cashJam // ignore: cast_nullable_to_non_nullable
as double?,noData: null == noData ? _self.noData : noData // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PerformanceStats].
extension PerformanceStatsPatterns on PerformanceStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PerformanceStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PerformanceStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PerformanceStats value)  $default,){
final _that = this;
switch (_that) {
case _PerformanceStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PerformanceStats value)?  $default,){
final _that = this;
switch (_that) {
case _PerformanceStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int samples,  double? uptime,  double? downtime,  double? offline,  double? closed,  double? cashJam,  bool noData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PerformanceStats() when $default != null:
return $default(_that.samples,_that.uptime,_that.downtime,_that.offline,_that.closed,_that.cashJam,_that.noData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int samples,  double? uptime,  double? downtime,  double? offline,  double? closed,  double? cashJam,  bool noData)  $default,) {final _that = this;
switch (_that) {
case _PerformanceStats():
return $default(_that.samples,_that.uptime,_that.downtime,_that.offline,_that.closed,_that.cashJam,_that.noData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int samples,  double? uptime,  double? downtime,  double? offline,  double? closed,  double? cashJam,  bool noData)?  $default,) {final _that = this;
switch (_that) {
case _PerformanceStats() when $default != null:
return $default(_that.samples,_that.uptime,_that.downtime,_that.offline,_that.closed,_that.cashJam,_that.noData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PerformanceStats implements PerformanceStats {
  const _PerformanceStats({required this.samples, this.uptime, this.downtime, this.offline, this.closed, this.cashJam, required this.noData});
  factory _PerformanceStats.fromJson(Map<String, dynamic> json) => _$PerformanceStatsFromJson(json);

@override final  int samples;
@override final  double? uptime;
@override final  double? downtime;
@override final  double? offline;
@override final  double? closed;
@override final  double? cashJam;
@override final  bool noData;

/// Create a copy of PerformanceStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PerformanceStatsCopyWith<_PerformanceStats> get copyWith => __$PerformanceStatsCopyWithImpl<_PerformanceStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PerformanceStatsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PerformanceStats&&(identical(other.samples, samples) || other.samples == samples)&&(identical(other.uptime, uptime) || other.uptime == uptime)&&(identical(other.downtime, downtime) || other.downtime == downtime)&&(identical(other.offline, offline) || other.offline == offline)&&(identical(other.closed, closed) || other.closed == closed)&&(identical(other.cashJam, cashJam) || other.cashJam == cashJam)&&(identical(other.noData, noData) || other.noData == noData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,samples,uptime,downtime,offline,closed,cashJam,noData);
}

@override
String toString() {
    return 'PerformanceStats(samples: $samples, uptime: $uptime, downtime: $downtime, offline: $offline, closed: $closed, cashJam: $cashJam, noData: $noData)';
}


}

/// @nodoc
abstract mixin class _$PerformanceStatsCopyWith<$Res> implements $PerformanceStatsCopyWith<$Res> {
  factory _$PerformanceStatsCopyWith(_PerformanceStats value, $Res Function(_PerformanceStats) _then) = __$PerformanceStatsCopyWithImpl;
@override @useResult
$Res call({
 int samples, double? uptime, double? downtime, double? offline, double? closed, double? cashJam, bool noData
});




}
/// @nodoc
class __$PerformanceStatsCopyWithImpl<$Res>
    implements _$PerformanceStatsCopyWith<$Res> {
  __$PerformanceStatsCopyWithImpl(this._self, this._then);

  final _PerformanceStats _self;
  final $Res Function(_PerformanceStats) _then;

/// Create a copy of PerformanceStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? samples = null,Object? uptime = freezed,Object? downtime = freezed,Object? offline = freezed,Object? closed = freezed,Object? cashJam = freezed,Object? noData = null,}) {
  return _then(_PerformanceStats(
samples: null == samples ? _self.samples : samples // ignore: cast_nullable_to_non_nullable
as int,uptime: freezed == uptime ? _self.uptime : uptime // ignore: cast_nullable_to_non_nullable
as double?,downtime: freezed == downtime ? _self.downtime : downtime // ignore: cast_nullable_to_non_nullable
as double?,offline: freezed == offline ? _self.offline : offline // ignore: cast_nullable_to_non_nullable
as double?,closed: freezed == closed ? _self.closed : closed // ignore: cast_nullable_to_non_nullable
as double?,cashJam: freezed == cashJam ? _self.cashJam : cashJam // ignore: cast_nullable_to_non_nullable
as double?,noData: null == noData ? _self.noData : noData // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$TerminalSummary {

 String get terminalId; String? get location; String? get solId; String? get region; String? get state; String? get brand;
/// Create a copy of TerminalSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TerminalSummaryCopyWith<TerminalSummary> get copyWith => _$TerminalSummaryCopyWithImpl<TerminalSummary>(this as TerminalSummary, _$identity);

  /// Serializes this TerminalSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TerminalSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TerminalSummary&&(identical(other.terminalId, _this.terminalId) || other.terminalId == _this.terminalId)&&(identical(other.location, _this.location) || other.location == _this.location)&&(identical(other.solId, _this.solId) || other.solId == _this.solId)&&(identical(other.region, _this.region) || other.region == _this.region)&&(identical(other.state, _this.state) || other.state == _this.state)&&(identical(other.brand, _this.brand) || other.brand == _this.brand));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TerminalSummary;
  return Object.hash(runtimeType,_this.terminalId,_this.location,_this.solId,_this.region,_this.state,_this.brand);
}

@override
String toString() {
  final _this = this as TerminalSummary;
  return 'TerminalSummary(terminalId: ${_this.terminalId}, location: ${_this.location}, solId: ${_this.solId}, region: ${_this.region}, state: ${_this.state}, brand: ${_this.brand})';
}


}

/// @nodoc
abstract mixin class $TerminalSummaryCopyWith<$Res>  {
  factory $TerminalSummaryCopyWith(TerminalSummary value, $Res Function(TerminalSummary) _then) = _$TerminalSummaryCopyWithImpl;
@useResult
$Res call({
 String terminalId, String? location, String? solId, String? region, String? state, String? brand
});




}
/// @nodoc
class _$TerminalSummaryCopyWithImpl<$Res>
    implements $TerminalSummaryCopyWith<$Res> {
  _$TerminalSummaryCopyWithImpl(this._self, this._then);

  final TerminalSummary _self;
  final $Res Function(TerminalSummary) _then;

/// Create a copy of TerminalSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? terminalId = null,Object? location = freezed,Object? solId = freezed,Object? region = freezed,Object? state = freezed,Object? brand = freezed,}) {
  return _then(TerminalSummary(
terminalId: null == terminalId ? _self.terminalId : terminalId // ignore: cast_nullable_to_non_nullable
as String,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,solId: freezed == solId ? _self.solId : solId // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TerminalSummary].
extension TerminalSummaryPatterns on TerminalSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TerminalSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TerminalSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TerminalSummary value)  $default,){
final _that = this;
switch (_that) {
case _TerminalSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TerminalSummary value)?  $default,){
final _that = this;
switch (_that) {
case _TerminalSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String terminalId,  String? location,  String? solId,  String? region,  String? state,  String? brand)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TerminalSummary() when $default != null:
return $default(_that.terminalId,_that.location,_that.solId,_that.region,_that.state,_that.brand);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String terminalId,  String? location,  String? solId,  String? region,  String? state,  String? brand)  $default,) {final _that = this;
switch (_that) {
case _TerminalSummary():
return $default(_that.terminalId,_that.location,_that.solId,_that.region,_that.state,_that.brand);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String terminalId,  String? location,  String? solId,  String? region,  String? state,  String? brand)?  $default,) {final _that = this;
switch (_that) {
case _TerminalSummary() when $default != null:
return $default(_that.terminalId,_that.location,_that.solId,_that.region,_that.state,_that.brand);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TerminalSummary implements TerminalSummary {
  const _TerminalSummary({required this.terminalId, this.location, this.solId, this.region, this.state, this.brand});
  factory _TerminalSummary.fromJson(Map<String, dynamic> json) => _$TerminalSummaryFromJson(json);

@override final  String terminalId;
@override final  String? location;
@override final  String? solId;
@override final  String? region;
@override final  String? state;
@override final  String? brand;

/// Create a copy of TerminalSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TerminalSummaryCopyWith<_TerminalSummary> get copyWith => __$TerminalSummaryCopyWithImpl<_TerminalSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TerminalSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TerminalSummary&&(identical(other.terminalId, terminalId) || other.terminalId == terminalId)&&(identical(other.location, location) || other.location == location)&&(identical(other.solId, solId) || other.solId == solId)&&(identical(other.region, region) || other.region == region)&&(identical(other.state, state) || other.state == state)&&(identical(other.brand, brand) || other.brand == brand));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,terminalId,location,solId,region,state,brand);
}

@override
String toString() {
    return 'TerminalSummary(terminalId: $terminalId, location: $location, solId: $solId, region: $region, state: $state, brand: $brand)';
}


}

/// @nodoc
abstract mixin class _$TerminalSummaryCopyWith<$Res> implements $TerminalSummaryCopyWith<$Res> {
  factory _$TerminalSummaryCopyWith(_TerminalSummary value, $Res Function(_TerminalSummary) _then) = __$TerminalSummaryCopyWithImpl;
@override @useResult
$Res call({
 String terminalId, String? location, String? solId, String? region, String? state, String? brand
});




}
/// @nodoc
class __$TerminalSummaryCopyWithImpl<$Res>
    implements _$TerminalSummaryCopyWith<$Res> {
  __$TerminalSummaryCopyWithImpl(this._self, this._then);

  final _TerminalSummary _self;
  final $Res Function(_TerminalSummary) _then;

/// Create a copy of TerminalSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? terminalId = null,Object? location = freezed,Object? solId = freezed,Object? region = freezed,Object? state = freezed,Object? brand = freezed,}) {
  return _then(_TerminalSummary(
terminalId: null == terminalId ? _self.terminalId : terminalId // ignore: cast_nullable_to_non_nullable
as String,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,solId: freezed == solId ? _self.solId : solId // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DailyPerformance {

 DateTime get date; PerformanceStats get stats;
/// Create a copy of DailyPerformance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyPerformanceCopyWith<DailyPerformance> get copyWith => _$DailyPerformanceCopyWithImpl<DailyPerformance>(this as DailyPerformance, _$identity);

  /// Serializes this DailyPerformance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DailyPerformance;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyPerformance&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.stats, _this.stats) || other.stats == _this.stats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DailyPerformance;
  return Object.hash(runtimeType,_this.date,_this.stats);
}

@override
String toString() {
  final _this = this as DailyPerformance;
  return 'DailyPerformance(date: ${_this.date}, stats: ${_this.stats})';
}


}

/// @nodoc
abstract mixin class $DailyPerformanceCopyWith<$Res>  {
  factory $DailyPerformanceCopyWith(DailyPerformance value, $Res Function(DailyPerformance) _then) = _$DailyPerformanceCopyWithImpl;
@useResult
$Res call({
 DateTime date, PerformanceStats stats
});


$PerformanceStatsCopyWith<$Res> get stats;

}
/// @nodoc
class _$DailyPerformanceCopyWithImpl<$Res>
    implements $DailyPerformanceCopyWith<$Res> {
  _$DailyPerformanceCopyWithImpl(this._self, this._then);

  final DailyPerformance _self;
  final $Res Function(DailyPerformance) _then;

/// Create a copy of DailyPerformance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? stats = null,}) {
  return _then(DailyPerformance(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as PerformanceStats,
  ));
}
/// Create a copy of DailyPerformance
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PerformanceStatsCopyWith<$Res> get stats {
  
  return $PerformanceStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// Adds pattern-matching-related methods to [DailyPerformance].
extension DailyPerformancePatterns on DailyPerformance {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyPerformance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyPerformance() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyPerformance value)  $default,){
final _that = this;
switch (_that) {
case _DailyPerformance():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyPerformance value)?  $default,){
final _that = this;
switch (_that) {
case _DailyPerformance() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  PerformanceStats stats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyPerformance() when $default != null:
return $default(_that.date,_that.stats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  PerformanceStats stats)  $default,) {final _that = this;
switch (_that) {
case _DailyPerformance():
return $default(_that.date,_that.stats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  PerformanceStats stats)?  $default,) {final _that = this;
switch (_that) {
case _DailyPerformance() when $default != null:
return $default(_that.date,_that.stats);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyPerformance implements DailyPerformance {
  const _DailyPerformance({required this.date, required this.stats});
  factory _DailyPerformance.fromJson(Map<String, dynamic> json) => _$DailyPerformanceFromJson(json);

@override final  DateTime date;
@override final  PerformanceStats stats;

/// Create a copy of DailyPerformance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyPerformanceCopyWith<_DailyPerformance> get copyWith => __$DailyPerformanceCopyWithImpl<_DailyPerformance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyPerformanceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyPerformance&&(identical(other.date, date) || other.date == date)&&(identical(other.stats, stats) || other.stats == stats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,date,stats);
}

@override
String toString() {
    return 'DailyPerformance(date: $date, stats: $stats)';
}


}

/// @nodoc
abstract mixin class _$DailyPerformanceCopyWith<$Res> implements $DailyPerformanceCopyWith<$Res> {
  factory _$DailyPerformanceCopyWith(_DailyPerformance value, $Res Function(_DailyPerformance) _then) = __$DailyPerformanceCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, PerformanceStats stats
});


@override $PerformanceStatsCopyWith<$Res> get stats;

}
/// @nodoc
class __$DailyPerformanceCopyWithImpl<$Res>
    implements _$DailyPerformanceCopyWith<$Res> {
  __$DailyPerformanceCopyWithImpl(this._self, this._then);

  final _DailyPerformance _self;
  final $Res Function(_DailyPerformance) _then;

/// Create a copy of DailyPerformance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? stats = null,}) {
  return _then(_DailyPerformance(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as PerformanceStats,
  ));
}

/// Create a copy of DailyPerformance
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PerformanceStatsCopyWith<$Res> get stats {
  
  return $PerformanceStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// @nodoc
mixin _$PerformanceReport {

 TerminalSummary get terminal; DateTime get from; DateTime get to; List<DailyPerformance> get days; PerformanceStats get totals;
/// Create a copy of PerformanceReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PerformanceReportCopyWith<PerformanceReport> get copyWith => _$PerformanceReportCopyWithImpl<PerformanceReport>(this as PerformanceReport, _$identity);

  /// Serializes this PerformanceReport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PerformanceReport;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PerformanceReport&&(identical(other.terminal, _this.terminal) || other.terminal == _this.terminal)&&(identical(other.from, _this.from) || other.from == _this.from)&&(identical(other.to, _this.to) || other.to == _this.to)&&const DeepCollectionEquality().equals(other.days, _this.days)&&(identical(other.totals, _this.totals) || other.totals == _this.totals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PerformanceReport;
  return Object.hash(runtimeType,_this.terminal,_this.from,_this.to,const DeepCollectionEquality().hash(_this.days),_this.totals);
}

@override
String toString() {
  final _this = this as PerformanceReport;
  return 'PerformanceReport(terminal: ${_this.terminal}, from: ${_this.from}, to: ${_this.to}, days: ${_this.days}, totals: ${_this.totals})';
}


}

/// @nodoc
abstract mixin class $PerformanceReportCopyWith<$Res>  {
  factory $PerformanceReportCopyWith(PerformanceReport value, $Res Function(PerformanceReport) _then) = _$PerformanceReportCopyWithImpl;
@useResult
$Res call({
 TerminalSummary terminal, DateTime from, DateTime to, List<DailyPerformance> days, PerformanceStats totals
});


$TerminalSummaryCopyWith<$Res> get terminal;$PerformanceStatsCopyWith<$Res> get totals;

}
/// @nodoc
class _$PerformanceReportCopyWithImpl<$Res>
    implements $PerformanceReportCopyWith<$Res> {
  _$PerformanceReportCopyWithImpl(this._self, this._then);

  final PerformanceReport _self;
  final $Res Function(PerformanceReport) _then;

/// Create a copy of PerformanceReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? terminal = null,Object? from = null,Object? to = null,Object? days = null,Object? totals = null,}) {
  return _then(PerformanceReport(
terminal: null == terminal ? _self.terminal : terminal // ignore: cast_nullable_to_non_nullable
as TerminalSummary,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as List<DailyPerformance>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as PerformanceStats,
  ));
}
/// Create a copy of PerformanceReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TerminalSummaryCopyWith<$Res> get terminal {
  
  return $TerminalSummaryCopyWith<$Res>(_self.terminal, (value) {
    return _then(_self.copyWith(terminal: value));
  });
}/// Create a copy of PerformanceReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PerformanceStatsCopyWith<$Res> get totals {
  
  return $PerformanceStatsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// Adds pattern-matching-related methods to [PerformanceReport].
extension PerformanceReportPatterns on PerformanceReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PerformanceReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PerformanceReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PerformanceReport value)  $default,){
final _that = this;
switch (_that) {
case _PerformanceReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PerformanceReport value)?  $default,){
final _that = this;
switch (_that) {
case _PerformanceReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TerminalSummary terminal,  DateTime from,  DateTime to,  List<DailyPerformance> days,  PerformanceStats totals)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PerformanceReport() when $default != null:
return $default(_that.terminal,_that.from,_that.to,_that.days,_that.totals);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TerminalSummary terminal,  DateTime from,  DateTime to,  List<DailyPerformance> days,  PerformanceStats totals)  $default,) {final _that = this;
switch (_that) {
case _PerformanceReport():
return $default(_that.terminal,_that.from,_that.to,_that.days,_that.totals);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TerminalSummary terminal,  DateTime from,  DateTime to,  List<DailyPerformance> days,  PerformanceStats totals)?  $default,) {final _that = this;
switch (_that) {
case _PerformanceReport() when $default != null:
return $default(_that.terminal,_that.from,_that.to,_that.days,_that.totals);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PerformanceReport implements PerformanceReport {
  const _PerformanceReport({required this.terminal, required this.from, required this.to, required  List<DailyPerformance> days, required this.totals}): _days = days;
  factory _PerformanceReport.fromJson(Map<String, dynamic> json) => _$PerformanceReportFromJson(json);

@override final  TerminalSummary terminal;
@override final  DateTime from;
@override final  DateTime to;
 final  List<DailyPerformance> _days;
@override List<DailyPerformance> get days {
  if (_days is EqualUnmodifiableListView) return _days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_days);
}

@override final  PerformanceStats totals;

/// Create a copy of PerformanceReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PerformanceReportCopyWith<_PerformanceReport> get copyWith => __$PerformanceReportCopyWithImpl<_PerformanceReport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PerformanceReportToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PerformanceReport&&(identical(other.terminal, terminal) || other.terminal == terminal)&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&const DeepCollectionEquality().equals(other.days, _days)&&(identical(other.totals, totals) || other.totals == totals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,terminal,from,to,const DeepCollectionEquality().hash(_days),totals);
}

@override
String toString() {
    return 'PerformanceReport(terminal: $terminal, from: $from, to: $to, days: $days, totals: $totals)';
}


}

/// @nodoc
abstract mixin class _$PerformanceReportCopyWith<$Res> implements $PerformanceReportCopyWith<$Res> {
  factory _$PerformanceReportCopyWith(_PerformanceReport value, $Res Function(_PerformanceReport) _then) = __$PerformanceReportCopyWithImpl;
@override @useResult
$Res call({
 TerminalSummary terminal, DateTime from, DateTime to, List<DailyPerformance> days, PerformanceStats totals
});


@override $TerminalSummaryCopyWith<$Res> get terminal;@override $PerformanceStatsCopyWith<$Res> get totals;

}
/// @nodoc
class __$PerformanceReportCopyWithImpl<$Res>
    implements _$PerformanceReportCopyWith<$Res> {
  __$PerformanceReportCopyWithImpl(this._self, this._then);

  final _PerformanceReport _self;
  final $Res Function(_PerformanceReport) _then;

/// Create a copy of PerformanceReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? terminal = null,Object? from = null,Object? to = null,Object? days = null,Object? totals = null,}) {
  return _then(_PerformanceReport(
terminal: null == terminal ? _self.terminal : terminal // ignore: cast_nullable_to_non_nullable
as TerminalSummary,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime,days: null == days ? _self._days : days // ignore: cast_nullable_to_non_nullable
as List<DailyPerformance>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as PerformanceStats,
  ));
}

/// Create a copy of PerformanceReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TerminalSummaryCopyWith<$Res> get terminal {
  
  return $TerminalSummaryCopyWith<$Res>(_self.terminal, (value) {
    return _then(_self.copyWith(terminal: value));
  });
}/// Create a copy of PerformanceReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PerformanceStatsCopyWith<$Res> get totals {
  
  return $PerformanceStatsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}
}


/// @nodoc
mixin _$RealtimeRecord {

 TerminalSummary get terminal; PerformanceStats get stats;
/// Create a copy of RealtimeRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RealtimeRecordCopyWith<RealtimeRecord> get copyWith => _$RealtimeRecordCopyWithImpl<RealtimeRecord>(this as RealtimeRecord, _$identity);

  /// Serializes this RealtimeRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RealtimeRecord;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RealtimeRecord&&(identical(other.terminal, _this.terminal) || other.terminal == _this.terminal)&&(identical(other.stats, _this.stats) || other.stats == _this.stats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RealtimeRecord;
  return Object.hash(runtimeType,_this.terminal,_this.stats);
}

@override
String toString() {
  final _this = this as RealtimeRecord;
  return 'RealtimeRecord(terminal: ${_this.terminal}, stats: ${_this.stats})';
}


}

/// @nodoc
abstract mixin class $RealtimeRecordCopyWith<$Res>  {
  factory $RealtimeRecordCopyWith(RealtimeRecord value, $Res Function(RealtimeRecord) _then) = _$RealtimeRecordCopyWithImpl;
@useResult
$Res call({
 TerminalSummary terminal, PerformanceStats stats
});


$TerminalSummaryCopyWith<$Res> get terminal;$PerformanceStatsCopyWith<$Res> get stats;

}
/// @nodoc
class _$RealtimeRecordCopyWithImpl<$Res>
    implements $RealtimeRecordCopyWith<$Res> {
  _$RealtimeRecordCopyWithImpl(this._self, this._then);

  final RealtimeRecord _self;
  final $Res Function(RealtimeRecord) _then;

/// Create a copy of RealtimeRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? terminal = null,Object? stats = null,}) {
  return _then(RealtimeRecord(
terminal: null == terminal ? _self.terminal : terminal // ignore: cast_nullable_to_non_nullable
as TerminalSummary,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as PerformanceStats,
  ));
}
/// Create a copy of RealtimeRecord
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TerminalSummaryCopyWith<$Res> get terminal {
  
  return $TerminalSummaryCopyWith<$Res>(_self.terminal, (value) {
    return _then(_self.copyWith(terminal: value));
  });
}/// Create a copy of RealtimeRecord
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PerformanceStatsCopyWith<$Res> get stats {
  
  return $PerformanceStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// Adds pattern-matching-related methods to [RealtimeRecord].
extension RealtimeRecordPatterns on RealtimeRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RealtimeRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RealtimeRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RealtimeRecord value)  $default,){
final _that = this;
switch (_that) {
case _RealtimeRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RealtimeRecord value)?  $default,){
final _that = this;
switch (_that) {
case _RealtimeRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TerminalSummary terminal,  PerformanceStats stats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RealtimeRecord() when $default != null:
return $default(_that.terminal,_that.stats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TerminalSummary terminal,  PerformanceStats stats)  $default,) {final _that = this;
switch (_that) {
case _RealtimeRecord():
return $default(_that.terminal,_that.stats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TerminalSummary terminal,  PerformanceStats stats)?  $default,) {final _that = this;
switch (_that) {
case _RealtimeRecord() when $default != null:
return $default(_that.terminal,_that.stats);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RealtimeRecord implements RealtimeRecord {
  const _RealtimeRecord({required this.terminal, required this.stats});
  factory _RealtimeRecord.fromJson(Map<String, dynamic> json) => _$RealtimeRecordFromJson(json);

@override final  TerminalSummary terminal;
@override final  PerformanceStats stats;

/// Create a copy of RealtimeRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RealtimeRecordCopyWith<_RealtimeRecord> get copyWith => __$RealtimeRecordCopyWithImpl<_RealtimeRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RealtimeRecordToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RealtimeRecord&&(identical(other.terminal, terminal) || other.terminal == terminal)&&(identical(other.stats, stats) || other.stats == stats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,terminal,stats);
}

@override
String toString() {
    return 'RealtimeRecord(terminal: $terminal, stats: $stats)';
}


}

/// @nodoc
abstract mixin class _$RealtimeRecordCopyWith<$Res> implements $RealtimeRecordCopyWith<$Res> {
  factory _$RealtimeRecordCopyWith(_RealtimeRecord value, $Res Function(_RealtimeRecord) _then) = __$RealtimeRecordCopyWithImpl;
@override @useResult
$Res call({
 TerminalSummary terminal, PerformanceStats stats
});


@override $TerminalSummaryCopyWith<$Res> get terminal;@override $PerformanceStatsCopyWith<$Res> get stats;

}
/// @nodoc
class __$RealtimeRecordCopyWithImpl<$Res>
    implements _$RealtimeRecordCopyWith<$Res> {
  __$RealtimeRecordCopyWithImpl(this._self, this._then);

  final _RealtimeRecord _self;
  final $Res Function(_RealtimeRecord) _then;

/// Create a copy of RealtimeRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? terminal = null,Object? stats = null,}) {
  return _then(_RealtimeRecord(
terminal: null == terminal ? _self.terminal : terminal // ignore: cast_nullable_to_non_nullable
as TerminalSummary,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as PerformanceStats,
  ));
}

/// Create a copy of RealtimeRecord
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TerminalSummaryCopyWith<$Res> get terminal {
  
  return $TerminalSummaryCopyWith<$Res>(_self.terminal, (value) {
    return _then(_self.copyWith(terminal: value));
  });
}/// Create a copy of RealtimeRecord
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PerformanceStatsCopyWith<$Res> get stats {
  
  return $PerformanceStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// @nodoc
mixin _$RealtimeSummary {

 DateTime get date; double? get averageUptime; int get belowThreshold; int get threshold;
/// Create a copy of RealtimeSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RealtimeSummaryCopyWith<RealtimeSummary> get copyWith => _$RealtimeSummaryCopyWithImpl<RealtimeSummary>(this as RealtimeSummary, _$identity);

  /// Serializes this RealtimeSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RealtimeSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RealtimeSummary&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.averageUptime, _this.averageUptime) || other.averageUptime == _this.averageUptime)&&(identical(other.belowThreshold, _this.belowThreshold) || other.belowThreshold == _this.belowThreshold)&&(identical(other.threshold, _this.threshold) || other.threshold == _this.threshold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RealtimeSummary;
  return Object.hash(runtimeType,_this.date,_this.averageUptime,_this.belowThreshold,_this.threshold);
}

@override
String toString() {
  final _this = this as RealtimeSummary;
  return 'RealtimeSummary(date: ${_this.date}, averageUptime: ${_this.averageUptime}, belowThreshold: ${_this.belowThreshold}, threshold: ${_this.threshold})';
}


}

/// @nodoc
abstract mixin class $RealtimeSummaryCopyWith<$Res>  {
  factory $RealtimeSummaryCopyWith(RealtimeSummary value, $Res Function(RealtimeSummary) _then) = _$RealtimeSummaryCopyWithImpl;
@useResult
$Res call({
 DateTime date, double? averageUptime, int belowThreshold, int threshold
});




}
/// @nodoc
class _$RealtimeSummaryCopyWithImpl<$Res>
    implements $RealtimeSummaryCopyWith<$Res> {
  _$RealtimeSummaryCopyWithImpl(this._self, this._then);

  final RealtimeSummary _self;
  final $Res Function(RealtimeSummary) _then;

/// Create a copy of RealtimeSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? averageUptime = freezed,Object? belowThreshold = null,Object? threshold = null,}) {
  return _then(RealtimeSummary(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,averageUptime: freezed == averageUptime ? _self.averageUptime : averageUptime // ignore: cast_nullable_to_non_nullable
as double?,belowThreshold: null == belowThreshold ? _self.belowThreshold : belowThreshold // ignore: cast_nullable_to_non_nullable
as int,threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RealtimeSummary].
extension RealtimeSummaryPatterns on RealtimeSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RealtimeSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RealtimeSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RealtimeSummary value)  $default,){
final _that = this;
switch (_that) {
case _RealtimeSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RealtimeSummary value)?  $default,){
final _that = this;
switch (_that) {
case _RealtimeSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  double? averageUptime,  int belowThreshold,  int threshold)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RealtimeSummary() when $default != null:
return $default(_that.date,_that.averageUptime,_that.belowThreshold,_that.threshold);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  double? averageUptime,  int belowThreshold,  int threshold)  $default,) {final _that = this;
switch (_that) {
case _RealtimeSummary():
return $default(_that.date,_that.averageUptime,_that.belowThreshold,_that.threshold);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  double? averageUptime,  int belowThreshold,  int threshold)?  $default,) {final _that = this;
switch (_that) {
case _RealtimeSummary() when $default != null:
return $default(_that.date,_that.averageUptime,_that.belowThreshold,_that.threshold);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RealtimeSummary implements RealtimeSummary {
  const _RealtimeSummary({required this.date, this.averageUptime, required this.belowThreshold, required this.threshold});
  factory _RealtimeSummary.fromJson(Map<String, dynamic> json) => _$RealtimeSummaryFromJson(json);

@override final  DateTime date;
@override final  double? averageUptime;
@override final  int belowThreshold;
@override final  int threshold;

/// Create a copy of RealtimeSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RealtimeSummaryCopyWith<_RealtimeSummary> get copyWith => __$RealtimeSummaryCopyWithImpl<_RealtimeSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RealtimeSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RealtimeSummary&&(identical(other.date, date) || other.date == date)&&(identical(other.averageUptime, averageUptime) || other.averageUptime == averageUptime)&&(identical(other.belowThreshold, belowThreshold) || other.belowThreshold == belowThreshold)&&(identical(other.threshold, threshold) || other.threshold == threshold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,date,averageUptime,belowThreshold,threshold);
}

@override
String toString() {
    return 'RealtimeSummary(date: $date, averageUptime: $averageUptime, belowThreshold: $belowThreshold, threshold: $threshold)';
}


}

/// @nodoc
abstract mixin class _$RealtimeSummaryCopyWith<$Res> implements $RealtimeSummaryCopyWith<$Res> {
  factory _$RealtimeSummaryCopyWith(_RealtimeSummary value, $Res Function(_RealtimeSummary) _then) = __$RealtimeSummaryCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, double? averageUptime, int belowThreshold, int threshold
});




}
/// @nodoc
class __$RealtimeSummaryCopyWithImpl<$Res>
    implements _$RealtimeSummaryCopyWith<$Res> {
  __$RealtimeSummaryCopyWithImpl(this._self, this._then);

  final _RealtimeSummary _self;
  final $Res Function(_RealtimeSummary) _then;

/// Create a copy of RealtimeSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? averageUptime = freezed,Object? belowThreshold = null,Object? threshold = null,}) {
  return _then(_RealtimeSummary(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,averageUptime: freezed == averageUptime ? _self.averageUptime : averageUptime // ignore: cast_nullable_to_non_nullable
as double?,belowThreshold: null == belowThreshold ? _self.belowThreshold : belowThreshold // ignore: cast_nullable_to_non_nullable
as int,threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$RealtimeQuery {

 DateTime? get date; String? get region; String? get search; RealtimeSort get sort; bool get ascending; int get perPage;
/// Create a copy of RealtimeQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RealtimeQueryCopyWith<RealtimeQuery> get copyWith => _$RealtimeQueryCopyWithImpl<RealtimeQuery>(this as RealtimeQuery, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RealtimeQuery;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RealtimeQuery&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.region, _this.region) || other.region == _this.region)&&(identical(other.search, _this.search) || other.search == _this.search)&&(identical(other.sort, _this.sort) || other.sort == _this.sort)&&(identical(other.ascending, _this.ascending) || other.ascending == _this.ascending)&&(identical(other.perPage, _this.perPage) || other.perPage == _this.perPage));
}


@override
int get hashCode {
  final _this = this as RealtimeQuery;
  return Object.hash(runtimeType,_this.date,_this.region,_this.search,_this.sort,_this.ascending,_this.perPage);
}

@override
String toString() {
  final _this = this as RealtimeQuery;
  return 'RealtimeQuery(date: ${_this.date}, region: ${_this.region}, search: ${_this.search}, sort: ${_this.sort}, ascending: ${_this.ascending}, perPage: ${_this.perPage})';
}


}

/// @nodoc
abstract mixin class $RealtimeQueryCopyWith<$Res>  {
  factory $RealtimeQueryCopyWith(RealtimeQuery value, $Res Function(RealtimeQuery) _then) = _$RealtimeQueryCopyWithImpl;
@useResult
$Res call({
 DateTime? date, String? region, String? search, RealtimeSort sort, bool ascending, int perPage
});




}
/// @nodoc
class _$RealtimeQueryCopyWithImpl<$Res>
    implements $RealtimeQueryCopyWith<$Res> {
  _$RealtimeQueryCopyWithImpl(this._self, this._then);

  final RealtimeQuery _self;
  final $Res Function(RealtimeQuery) _then;

/// Create a copy of RealtimeQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = freezed,Object? region = freezed,Object? search = freezed,Object? sort = null,Object? ascending = null,Object? perPage = null,}) {
  return _then(RealtimeQuery(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as RealtimeSort,ascending: null == ascending ? _self.ascending : ascending // ignore: cast_nullable_to_non_nullable
as bool,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RealtimeQuery].
extension RealtimeQueryPatterns on RealtimeQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RealtimeQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RealtimeQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RealtimeQuery value)  $default,){
final _that = this;
switch (_that) {
case _RealtimeQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RealtimeQuery value)?  $default,){
final _that = this;
switch (_that) {
case _RealtimeQuery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? date,  String? region,  String? search,  RealtimeSort sort,  bool ascending,  int perPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RealtimeQuery() when $default != null:
return $default(_that.date,_that.region,_that.search,_that.sort,_that.ascending,_that.perPage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? date,  String? region,  String? search,  RealtimeSort sort,  bool ascending,  int perPage)  $default,) {final _that = this;
switch (_that) {
case _RealtimeQuery():
return $default(_that.date,_that.region,_that.search,_that.sort,_that.ascending,_that.perPage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? date,  String? region,  String? search,  RealtimeSort sort,  bool ascending,  int perPage)?  $default,) {final _that = this;
switch (_that) {
case _RealtimeQuery() when $default != null:
return $default(_that.date,_that.region,_that.search,_that.sort,_that.ascending,_that.perPage);case _:
  return null;

}
}

}

/// @nodoc


class _RealtimeQuery extends RealtimeQuery {
  const _RealtimeQuery({this.date, this.region, this.search, this.sort = RealtimeSort.uptime, this.ascending = true, this.perPage = 20}): super._();
  

@override final  DateTime? date;
@override final  String? region;
@override final  String? search;
@override@JsonKey() final  RealtimeSort sort;
@override@JsonKey() final  bool ascending;
@override@JsonKey() final  int perPage;

/// Create a copy of RealtimeQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RealtimeQueryCopyWith<_RealtimeQuery> get copyWith => __$RealtimeQueryCopyWithImpl<_RealtimeQuery>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RealtimeQuery&&(identical(other.date, date) || other.date == date)&&(identical(other.region, region) || other.region == region)&&(identical(other.search, search) || other.search == search)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.ascending, ascending) || other.ascending == ascending)&&(identical(other.perPage, perPage) || other.perPage == perPage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,date,region,search,sort,ascending,perPage);
}

@override
String toString() {
    return 'RealtimeQuery(date: $date, region: $region, search: $search, sort: $sort, ascending: $ascending, perPage: $perPage)';
}


}

/// @nodoc
abstract mixin class _$RealtimeQueryCopyWith<$Res> implements $RealtimeQueryCopyWith<$Res> {
  factory _$RealtimeQueryCopyWith(_RealtimeQuery value, $Res Function(_RealtimeQuery) _then) = __$RealtimeQueryCopyWithImpl;
@override @useResult
$Res call({
 DateTime? date, String? region, String? search, RealtimeSort sort, bool ascending, int perPage
});




}
/// @nodoc
class __$RealtimeQueryCopyWithImpl<$Res>
    implements _$RealtimeQueryCopyWith<$Res> {
  __$RealtimeQueryCopyWithImpl(this._self, this._then);

  final _RealtimeQuery _self;
  final $Res Function(_RealtimeQuery) _then;

/// Create a copy of RealtimeQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = freezed,Object? region = freezed,Object? search = freezed,Object? sort = null,Object? ascending = null,Object? perPage = null,}) {
  return _then(_RealtimeQuery(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as RealtimeSort,ascending: null == ascending ? _self.ascending : ascending // ignore: cast_nullable_to_non_nullable
as bool,perPage: null == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
