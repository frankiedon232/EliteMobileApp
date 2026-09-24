// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardSummary {

 String get region; int get total; DateTime get generatedAt; StatusCounts get status; CashCounts get cash; PerformanceSplit get performance;
/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardSummaryCopyWith<DashboardSummary> get copyWith => _$DashboardSummaryCopyWithImpl<DashboardSummary>(this as DashboardSummary, _$identity);

  /// Serializes this DashboardSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DashboardSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardSummary&&(identical(other.region, _this.region) || other.region == _this.region)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.generatedAt, _this.generatedAt) || other.generatedAt == _this.generatedAt)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.cash, _this.cash) || other.cash == _this.cash)&&(identical(other.performance, _this.performance) || other.performance == _this.performance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DashboardSummary;
  return Object.hash(runtimeType,_this.region,_this.total,_this.generatedAt,_this.status,_this.cash,_this.performance);
}

@override
String toString() {
  final _this = this as DashboardSummary;
  return 'DashboardSummary(region: ${_this.region}, total: ${_this.total}, generatedAt: ${_this.generatedAt}, status: ${_this.status}, cash: ${_this.cash}, performance: ${_this.performance})';
}


}

/// @nodoc
abstract mixin class $DashboardSummaryCopyWith<$Res>  {
  factory $DashboardSummaryCopyWith(DashboardSummary value, $Res Function(DashboardSummary) _then) = _$DashboardSummaryCopyWithImpl;
@useResult
$Res call({
 String region, int total, DateTime generatedAt, StatusCounts status, CashCounts cash, PerformanceSplit performance
});


$StatusCountsCopyWith<$Res> get status;$CashCountsCopyWith<$Res> get cash;$PerformanceSplitCopyWith<$Res> get performance;

}
/// @nodoc
class _$DashboardSummaryCopyWithImpl<$Res>
    implements $DashboardSummaryCopyWith<$Res> {
  _$DashboardSummaryCopyWithImpl(this._self, this._then);

  final DashboardSummary _self;
  final $Res Function(DashboardSummary) _then;

/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? region = null,Object? total = null,Object? generatedAt = null,Object? status = null,Object? cash = null,Object? performance = null,}) {
  return _then(DashboardSummary(
region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusCounts,cash: null == cash ? _self.cash : cash // ignore: cast_nullable_to_non_nullable
as CashCounts,performance: null == performance ? _self.performance : performance // ignore: cast_nullable_to_non_nullable
as PerformanceSplit,
  ));
}
/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatusCountsCopyWith<$Res> get status {
  
  return $StatusCountsCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CashCountsCopyWith<$Res> get cash {
  
  return $CashCountsCopyWith<$Res>(_self.cash, (value) {
    return _then(_self.copyWith(cash: value));
  });
}/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PerformanceSplitCopyWith<$Res> get performance {
  
  return $PerformanceSplitCopyWith<$Res>(_self.performance, (value) {
    return _then(_self.copyWith(performance: value));
  });
}
}


/// Adds pattern-matching-related methods to [DashboardSummary].
extension DashboardSummaryPatterns on DashboardSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardSummary value)  $default,){
final _that = this;
switch (_that) {
case _DashboardSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardSummary value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String region,  int total,  DateTime generatedAt,  StatusCounts status,  CashCounts cash,  PerformanceSplit performance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardSummary() when $default != null:
return $default(_that.region,_that.total,_that.generatedAt,_that.status,_that.cash,_that.performance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String region,  int total,  DateTime generatedAt,  StatusCounts status,  CashCounts cash,  PerformanceSplit performance)  $default,) {final _that = this;
switch (_that) {
case _DashboardSummary():
return $default(_that.region,_that.total,_that.generatedAt,_that.status,_that.cash,_that.performance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String region,  int total,  DateTime generatedAt,  StatusCounts status,  CashCounts cash,  PerformanceSplit performance)?  $default,) {final _that = this;
switch (_that) {
case _DashboardSummary() when $default != null:
return $default(_that.region,_that.total,_that.generatedAt,_that.status,_that.cash,_that.performance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardSummary implements DashboardSummary {
  const _DashboardSummary({required this.region, required this.total, required this.generatedAt, required this.status, required this.cash, required this.performance});
  factory _DashboardSummary.fromJson(Map<String, dynamic> json) => _$DashboardSummaryFromJson(json);

@override final  String region;
@override final  int total;
@override final  DateTime generatedAt;
@override final  StatusCounts status;
@override final  CashCounts cash;
@override final  PerformanceSplit performance;

/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardSummaryCopyWith<_DashboardSummary> get copyWith => __$DashboardSummaryCopyWithImpl<_DashboardSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardSummary&&(identical(other.region, region) || other.region == region)&&(identical(other.total, total) || other.total == total)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.cash, cash) || other.cash == cash)&&(identical(other.performance, performance) || other.performance == performance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,region,total,generatedAt,status,cash,performance);
}

@override
String toString() {
    return 'DashboardSummary(region: $region, total: $total, generatedAt: $generatedAt, status: $status, cash: $cash, performance: $performance)';
}


}

/// @nodoc
abstract mixin class _$DashboardSummaryCopyWith<$Res> implements $DashboardSummaryCopyWith<$Res> {
  factory _$DashboardSummaryCopyWith(_DashboardSummary value, $Res Function(_DashboardSummary) _then) = __$DashboardSummaryCopyWithImpl;
@override @useResult
$Res call({
 String region, int total, DateTime generatedAt, StatusCounts status, CashCounts cash, PerformanceSplit performance
});


@override $StatusCountsCopyWith<$Res> get status;@override $CashCountsCopyWith<$Res> get cash;@override $PerformanceSplitCopyWith<$Res> get performance;

}
/// @nodoc
class __$DashboardSummaryCopyWithImpl<$Res>
    implements _$DashboardSummaryCopyWith<$Res> {
  __$DashboardSummaryCopyWithImpl(this._self, this._then);

  final _DashboardSummary _self;
  final $Res Function(_DashboardSummary) _then;

/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? region = null,Object? total = null,Object? generatedAt = null,Object? status = null,Object? cash = null,Object? performance = null,}) {
  return _then(_DashboardSummary(
region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusCounts,cash: null == cash ? _self.cash : cash // ignore: cast_nullable_to_non_nullable
as CashCounts,performance: null == performance ? _self.performance : performance // ignore: cast_nullable_to_non_nullable
as PerformanceSplit,
  ));
}

/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatusCountsCopyWith<$Res> get status {
  
  return $StatusCountsCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CashCountsCopyWith<$Res> get cash {
  
  return $CashCountsCopyWith<$Res>(_self.cash, (value) {
    return _then(_self.copyWith(cash: value));
  });
}/// Create a copy of DashboardSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PerformanceSplitCopyWith<$Res> get performance {
  
  return $PerformanceSplitCopyWith<$Res>(_self.performance, (value) {
    return _then(_self.copyWith(performance: value));
  });
}
}


/// @nodoc
mixin _$CountPercentage {

 int get count; double get percentage;
/// Create a copy of CountPercentage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountPercentageCopyWith<CountPercentage> get copyWith => _$CountPercentageCopyWithImpl<CountPercentage>(this as CountPercentage, _$identity);

  /// Serializes this CountPercentage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CountPercentage;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountPercentage&&(identical(other.count, _this.count) || other.count == _this.count)&&(identical(other.percentage, _this.percentage) || other.percentage == _this.percentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CountPercentage;
  return Object.hash(runtimeType,_this.count,_this.percentage);
}

@override
String toString() {
  final _this = this as CountPercentage;
  return 'CountPercentage(count: ${_this.count}, percentage: ${_this.percentage})';
}


}

/// @nodoc
abstract mixin class $CountPercentageCopyWith<$Res>  {
  factory $CountPercentageCopyWith(CountPercentage value, $Res Function(CountPercentage) _then) = _$CountPercentageCopyWithImpl;
@useResult
$Res call({
 int count, double percentage
});




}
/// @nodoc
class _$CountPercentageCopyWithImpl<$Res>
    implements $CountPercentageCopyWith<$Res> {
  _$CountPercentageCopyWithImpl(this._self, this._then);

  final CountPercentage _self;
  final $Res Function(CountPercentage) _then;

/// Create a copy of CountPercentage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? percentage = null,}) {
  return _then(CountPercentage(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CountPercentage].
extension CountPercentagePatterns on CountPercentage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CountPercentage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CountPercentage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CountPercentage value)  $default,){
final _that = this;
switch (_that) {
case _CountPercentage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CountPercentage value)?  $default,){
final _that = this;
switch (_that) {
case _CountPercentage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  double percentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CountPercentage() when $default != null:
return $default(_that.count,_that.percentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  double percentage)  $default,) {final _that = this;
switch (_that) {
case _CountPercentage():
return $default(_that.count,_that.percentage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  double percentage)?  $default,) {final _that = this;
switch (_that) {
case _CountPercentage() when $default != null:
return $default(_that.count,_that.percentage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CountPercentage implements CountPercentage {
  const _CountPercentage({required this.count, required this.percentage});
  factory _CountPercentage.fromJson(Map<String, dynamic> json) => _$CountPercentageFromJson(json);

@override final  int count;
@override final  double percentage;

/// Create a copy of CountPercentage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountPercentageCopyWith<_CountPercentage> get copyWith => __$CountPercentageCopyWithImpl<_CountPercentage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CountPercentageToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CountPercentage&&(identical(other.count, count) || other.count == count)&&(identical(other.percentage, percentage) || other.percentage == percentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,count,percentage);
}

@override
String toString() {
    return 'CountPercentage(count: $count, percentage: $percentage)';
}


}

/// @nodoc
abstract mixin class _$CountPercentageCopyWith<$Res> implements $CountPercentageCopyWith<$Res> {
  factory _$CountPercentageCopyWith(_CountPercentage value, $Res Function(_CountPercentage) _then) = __$CountPercentageCopyWithImpl;
@override @useResult
$Res call({
 int count, double percentage
});




}
/// @nodoc
class __$CountPercentageCopyWithImpl<$Res>
    implements _$CountPercentageCopyWith<$Res> {
  __$CountPercentageCopyWithImpl(this._self, this._then);

  final _CountPercentage _self;
  final $Res Function(_CountPercentage) _then;

/// Create a copy of CountPercentage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? percentage = null,}) {
  return _then(_CountPercentage(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$StatusCounts {

 CountPercentage get inService; CountPercentage get offline; CountPercentage get closed; CountPercentage get supervisor;
/// Create a copy of StatusCounts
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatusCountsCopyWith<StatusCounts> get copyWith => _$StatusCountsCopyWithImpl<StatusCounts>(this as StatusCounts, _$identity);

  /// Serializes this StatusCounts to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StatusCounts;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatusCounts&&(identical(other.inService, _this.inService) || other.inService == _this.inService)&&(identical(other.offline, _this.offline) || other.offline == _this.offline)&&(identical(other.closed, _this.closed) || other.closed == _this.closed)&&(identical(other.supervisor, _this.supervisor) || other.supervisor == _this.supervisor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StatusCounts;
  return Object.hash(runtimeType,_this.inService,_this.offline,_this.closed,_this.supervisor);
}

@override
String toString() {
  final _this = this as StatusCounts;
  return 'StatusCounts(inService: ${_this.inService}, offline: ${_this.offline}, closed: ${_this.closed}, supervisor: ${_this.supervisor})';
}


}

/// @nodoc
abstract mixin class $StatusCountsCopyWith<$Res>  {
  factory $StatusCountsCopyWith(StatusCounts value, $Res Function(StatusCounts) _then) = _$StatusCountsCopyWithImpl;
@useResult
$Res call({
 CountPercentage inService, CountPercentage offline, CountPercentage closed, CountPercentage supervisor
});


$CountPercentageCopyWith<$Res> get inService;$CountPercentageCopyWith<$Res> get offline;$CountPercentageCopyWith<$Res> get closed;$CountPercentageCopyWith<$Res> get supervisor;

}
/// @nodoc
class _$StatusCountsCopyWithImpl<$Res>
    implements $StatusCountsCopyWith<$Res> {
  _$StatusCountsCopyWithImpl(this._self, this._then);

  final StatusCounts _self;
  final $Res Function(StatusCounts) _then;

/// Create a copy of StatusCounts
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inService = null,Object? offline = null,Object? closed = null,Object? supervisor = null,}) {
  return _then(StatusCounts(
inService: null == inService ? _self.inService : inService // ignore: cast_nullable_to_non_nullable
as CountPercentage,offline: null == offline ? _self.offline : offline // ignore: cast_nullable_to_non_nullable
as CountPercentage,closed: null == closed ? _self.closed : closed // ignore: cast_nullable_to_non_nullable
as CountPercentage,supervisor: null == supervisor ? _self.supervisor : supervisor // ignore: cast_nullable_to_non_nullable
as CountPercentage,
  ));
}
/// Create a copy of StatusCounts
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountPercentageCopyWith<$Res> get inService {
  
  return $CountPercentageCopyWith<$Res>(_self.inService, (value) {
    return _then(_self.copyWith(inService: value));
  });
}/// Create a copy of StatusCounts
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountPercentageCopyWith<$Res> get offline {
  
  return $CountPercentageCopyWith<$Res>(_self.offline, (value) {
    return _then(_self.copyWith(offline: value));
  });
}/// Create a copy of StatusCounts
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountPercentageCopyWith<$Res> get closed {
  
  return $CountPercentageCopyWith<$Res>(_self.closed, (value) {
    return _then(_self.copyWith(closed: value));
  });
}/// Create a copy of StatusCounts
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountPercentageCopyWith<$Res> get supervisor {
  
  return $CountPercentageCopyWith<$Res>(_self.supervisor, (value) {
    return _then(_self.copyWith(supervisor: value));
  });
}
}


/// Adds pattern-matching-related methods to [StatusCounts].
extension StatusCountsPatterns on StatusCounts {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatusCounts value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatusCounts() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatusCounts value)  $default,){
final _that = this;
switch (_that) {
case _StatusCounts():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatusCounts value)?  $default,){
final _that = this;
switch (_that) {
case _StatusCounts() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CountPercentage inService,  CountPercentage offline,  CountPercentage closed,  CountPercentage supervisor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatusCounts() when $default != null:
return $default(_that.inService,_that.offline,_that.closed,_that.supervisor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CountPercentage inService,  CountPercentage offline,  CountPercentage closed,  CountPercentage supervisor)  $default,) {final _that = this;
switch (_that) {
case _StatusCounts():
return $default(_that.inService,_that.offline,_that.closed,_that.supervisor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CountPercentage inService,  CountPercentage offline,  CountPercentage closed,  CountPercentage supervisor)?  $default,) {final _that = this;
switch (_that) {
case _StatusCounts() when $default != null:
return $default(_that.inService,_that.offline,_that.closed,_that.supervisor);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StatusCounts implements StatusCounts {
  const _StatusCounts({required this.inService, required this.offline, required this.closed, required this.supervisor});
  factory _StatusCounts.fromJson(Map<String, dynamic> json) => _$StatusCountsFromJson(json);

@override final  CountPercentage inService;
@override final  CountPercentage offline;
@override final  CountPercentage closed;
@override final  CountPercentage supervisor;

/// Create a copy of StatusCounts
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatusCountsCopyWith<_StatusCounts> get copyWith => __$StatusCountsCopyWithImpl<_StatusCounts>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatusCountsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusCounts&&(identical(other.inService, inService) || other.inService == inService)&&(identical(other.offline, offline) || other.offline == offline)&&(identical(other.closed, closed) || other.closed == closed)&&(identical(other.supervisor, supervisor) || other.supervisor == supervisor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,inService,offline,closed,supervisor);
}

@override
String toString() {
    return 'StatusCounts(inService: $inService, offline: $offline, closed: $closed, supervisor: $supervisor)';
}


}

/// @nodoc
abstract mixin class _$StatusCountsCopyWith<$Res> implements $StatusCountsCopyWith<$Res> {
  factory _$StatusCountsCopyWith(_StatusCounts value, $Res Function(_StatusCounts) _then) = __$StatusCountsCopyWithImpl;
@override @useResult
$Res call({
 CountPercentage inService, CountPercentage offline, CountPercentage closed, CountPercentage supervisor
});


@override $CountPercentageCopyWith<$Res> get inService;@override $CountPercentageCopyWith<$Res> get offline;@override $CountPercentageCopyWith<$Res> get closed;@override $CountPercentageCopyWith<$Res> get supervisor;

}
/// @nodoc
class __$StatusCountsCopyWithImpl<$Res>
    implements _$StatusCountsCopyWith<$Res> {
  __$StatusCountsCopyWithImpl(this._self, this._then);

  final _StatusCounts _self;
  final $Res Function(_StatusCounts) _then;

/// Create a copy of StatusCounts
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inService = null,Object? offline = null,Object? closed = null,Object? supervisor = null,}) {
  return _then(_StatusCounts(
inService: null == inService ? _self.inService : inService // ignore: cast_nullable_to_non_nullable
as CountPercentage,offline: null == offline ? _self.offline : offline // ignore: cast_nullable_to_non_nullable
as CountPercentage,closed: null == closed ? _self.closed : closed // ignore: cast_nullable_to_non_nullable
as CountPercentage,supervisor: null == supervisor ? _self.supervisor : supervisor // ignore: cast_nullable_to_non_nullable
as CountPercentage,
  ));
}

/// Create a copy of StatusCounts
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountPercentageCopyWith<$Res> get inService {
  
  return $CountPercentageCopyWith<$Res>(_self.inService, (value) {
    return _then(_self.copyWith(inService: value));
  });
}/// Create a copy of StatusCounts
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountPercentageCopyWith<$Res> get offline {
  
  return $CountPercentageCopyWith<$Res>(_self.offline, (value) {
    return _then(_self.copyWith(offline: value));
  });
}/// Create a copy of StatusCounts
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountPercentageCopyWith<$Res> get closed {
  
  return $CountPercentageCopyWith<$Res>(_self.closed, (value) {
    return _then(_self.copyWith(closed: value));
  });
}/// Create a copy of StatusCounts
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountPercentageCopyWith<$Res> get supervisor {
  
  return $CountPercentageCopyWith<$Res>(_self.supervisor, (value) {
    return _then(_self.copyWith(supervisor: value));
  });
}
}


/// @nodoc
mixin _$CashCounts {

 CountPercentage get noCash; CountPercentage get lowCash; CountPercentage get moderateCash; CountPercentage get highCash; CountPercentage get cashJam;
/// Create a copy of CashCounts
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashCountsCopyWith<CashCounts> get copyWith => _$CashCountsCopyWithImpl<CashCounts>(this as CashCounts, _$identity);

  /// Serializes this CashCounts to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CashCounts;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashCounts&&(identical(other.noCash, _this.noCash) || other.noCash == _this.noCash)&&(identical(other.lowCash, _this.lowCash) || other.lowCash == _this.lowCash)&&(identical(other.moderateCash, _this.moderateCash) || other.moderateCash == _this.moderateCash)&&(identical(other.highCash, _this.highCash) || other.highCash == _this.highCash)&&(identical(other.cashJam, _this.cashJam) || other.cashJam == _this.cashJam));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CashCounts;
  return Object.hash(runtimeType,_this.noCash,_this.lowCash,_this.moderateCash,_this.highCash,_this.cashJam);
}

@override
String toString() {
  final _this = this as CashCounts;
  return 'CashCounts(noCash: ${_this.noCash}, lowCash: ${_this.lowCash}, moderateCash: ${_this.moderateCash}, highCash: ${_this.highCash}, cashJam: ${_this.cashJam})';
}


}

/// @nodoc
abstract mixin class $CashCountsCopyWith<$Res>  {
  factory $CashCountsCopyWith(CashCounts value, $Res Function(CashCounts) _then) = _$CashCountsCopyWithImpl;
@useResult
$Res call({
 CountPercentage noCash, CountPercentage lowCash, CountPercentage moderateCash, CountPercentage highCash, CountPercentage cashJam
});


$CountPercentageCopyWith<$Res> get noCash;$CountPercentageCopyWith<$Res> get lowCash;$CountPercentageCopyWith<$Res> get moderateCash;$CountPercentageCopyWith<$Res> get highCash;$CountPercentageCopyWith<$Res> get cashJam;

}
/// @nodoc
class _$CashCountsCopyWithImpl<$Res>
    implements $CashCountsCopyWith<$Res> {
  _$CashCountsCopyWithImpl(this._self, this._then);

  final CashCounts _self;
  final $Res Function(CashCounts) _then;

/// Create a copy of CashCounts
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? noCash = null,Object? lowCash = null,Object? moderateCash = null,Object? highCash = null,Object? cashJam = null,}) {
  return _then(CashCounts(
noCash: null == noCash ? _self.noCash : noCash // ignore: cast_nullable_to_non_nullable
as CountPercentage,lowCash: null == lowCash ? _self.lowCash : lowCash // ignore: cast_nullable_to_non_nullable
as CountPercentage,moderateCash: null == moderateCash ? _self.moderateCash : moderateCash // ignore: cast_nullable_to_non_nullable
as CountPercentage,highCash: null == highCash ? _self.highCash : highCash // ignore: cast_nullable_to_non_nullable
as CountPercentage,cashJam: null == cashJam ? _self.cashJam : cashJam // ignore: cast_nullable_to_non_nullable
as CountPercentage,
  ));
}
/// Create a copy of CashCounts
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountPercentageCopyWith<$Res> get noCash {
  
  return $CountPercentageCopyWith<$Res>(_self.noCash, (value) {
    return _then(_self.copyWith(noCash: value));
  });
}/// Create a copy of CashCounts
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountPercentageCopyWith<$Res> get lowCash {
  
  return $CountPercentageCopyWith<$Res>(_self.lowCash, (value) {
    return _then(_self.copyWith(lowCash: value));
  });
}/// Create a copy of CashCounts
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountPercentageCopyWith<$Res> get moderateCash {
  
  return $CountPercentageCopyWith<$Res>(_self.moderateCash, (value) {
    return _then(_self.copyWith(moderateCash: value));
  });
}/// Create a copy of CashCounts
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountPercentageCopyWith<$Res> get highCash {
  
  return $CountPercentageCopyWith<$Res>(_self.highCash, (value) {
    return _then(_self.copyWith(highCash: value));
  });
}/// Create a copy of CashCounts
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountPercentageCopyWith<$Res> get cashJam {
  
  return $CountPercentageCopyWith<$Res>(_self.cashJam, (value) {
    return _then(_self.copyWith(cashJam: value));
  });
}
}


/// Adds pattern-matching-related methods to [CashCounts].
extension CashCountsPatterns on CashCounts {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashCounts value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashCounts() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashCounts value)  $default,){
final _that = this;
switch (_that) {
case _CashCounts():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashCounts value)?  $default,){
final _that = this;
switch (_that) {
case _CashCounts() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CountPercentage noCash,  CountPercentage lowCash,  CountPercentage moderateCash,  CountPercentage highCash,  CountPercentage cashJam)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashCounts() when $default != null:
return $default(_that.noCash,_that.lowCash,_that.moderateCash,_that.highCash,_that.cashJam);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CountPercentage noCash,  CountPercentage lowCash,  CountPercentage moderateCash,  CountPercentage highCash,  CountPercentage cashJam)  $default,) {final _that = this;
switch (_that) {
case _CashCounts():
return $default(_that.noCash,_that.lowCash,_that.moderateCash,_that.highCash,_that.cashJam);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CountPercentage noCash,  CountPercentage lowCash,  CountPercentage moderateCash,  CountPercentage highCash,  CountPercentage cashJam)?  $default,) {final _that = this;
switch (_that) {
case _CashCounts() when $default != null:
return $default(_that.noCash,_that.lowCash,_that.moderateCash,_that.highCash,_that.cashJam);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CashCounts implements CashCounts {
  const _CashCounts({required this.noCash, required this.lowCash, required this.moderateCash, required this.highCash, required this.cashJam});
  factory _CashCounts.fromJson(Map<String, dynamic> json) => _$CashCountsFromJson(json);

@override final  CountPercentage noCash;
@override final  CountPercentage lowCash;
@override final  CountPercentage moderateCash;
@override final  CountPercentage highCash;
@override final  CountPercentage cashJam;

/// Create a copy of CashCounts
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashCountsCopyWith<_CashCounts> get copyWith => __$CashCountsCopyWithImpl<_CashCounts>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CashCountsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashCounts&&(identical(other.noCash, noCash) || other.noCash == noCash)&&(identical(other.lowCash, lowCash) || other.lowCash == lowCash)&&(identical(other.moderateCash, moderateCash) || other.moderateCash == moderateCash)&&(identical(other.highCash, highCash) || other.highCash == highCash)&&(identical(other.cashJam, cashJam) || other.cashJam == cashJam));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,noCash,lowCash,moderateCash,highCash,cashJam);
}

@override
String toString() {
    return 'CashCounts(noCash: $noCash, lowCash: $lowCash, moderateCash: $moderateCash, highCash: $highCash, cashJam: $cashJam)';
}


}

/// @nodoc
abstract mixin class _$CashCountsCopyWith<$Res> implements $CashCountsCopyWith<$Res> {
  factory _$CashCountsCopyWith(_CashCounts value, $Res Function(_CashCounts) _then) = __$CashCountsCopyWithImpl;
@override @useResult
$Res call({
 CountPercentage noCash, CountPercentage lowCash, CountPercentage moderateCash, CountPercentage highCash, CountPercentage cashJam
});


@override $CountPercentageCopyWith<$Res> get noCash;@override $CountPercentageCopyWith<$Res> get lowCash;@override $CountPercentageCopyWith<$Res> get moderateCash;@override $CountPercentageCopyWith<$Res> get highCash;@override $CountPercentageCopyWith<$Res> get cashJam;

}
/// @nodoc
class __$CashCountsCopyWithImpl<$Res>
    implements _$CashCountsCopyWith<$Res> {
  __$CashCountsCopyWithImpl(this._self, this._then);

  final _CashCounts _self;
  final $Res Function(_CashCounts) _then;

/// Create a copy of CashCounts
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? noCash = null,Object? lowCash = null,Object? moderateCash = null,Object? highCash = null,Object? cashJam = null,}) {
  return _then(_CashCounts(
noCash: null == noCash ? _self.noCash : noCash // ignore: cast_nullable_to_non_nullable
as CountPercentage,lowCash: null == lowCash ? _self.lowCash : lowCash // ignore: cast_nullable_to_non_nullable
as CountPercentage,moderateCash: null == moderateCash ? _self.moderateCash : moderateCash // ignore: cast_nullable_to_non_nullable
as CountPercentage,highCash: null == highCash ? _self.highCash : highCash // ignore: cast_nullable_to_non_nullable
as CountPercentage,cashJam: null == cashJam ? _self.cashJam : cashJam // ignore: cast_nullable_to_non_nullable
as CountPercentage,
  ));
}

/// Create a copy of CashCounts
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountPercentageCopyWith<$Res> get noCash {
  
  return $CountPercentageCopyWith<$Res>(_self.noCash, (value) {
    return _then(_self.copyWith(noCash: value));
  });
}/// Create a copy of CashCounts
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountPercentageCopyWith<$Res> get lowCash {
  
  return $CountPercentageCopyWith<$Res>(_self.lowCash, (value) {
    return _then(_self.copyWith(lowCash: value));
  });
}/// Create a copy of CashCounts
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountPercentageCopyWith<$Res> get moderateCash {
  
  return $CountPercentageCopyWith<$Res>(_self.moderateCash, (value) {
    return _then(_self.copyWith(moderateCash: value));
  });
}/// Create a copy of CashCounts
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountPercentageCopyWith<$Res> get highCash {
  
  return $CountPercentageCopyWith<$Res>(_self.highCash, (value) {
    return _then(_self.copyWith(highCash: value));
  });
}/// Create a copy of CashCounts
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountPercentageCopyWith<$Res> get cashJam {
  
  return $CountPercentageCopyWith<$Res>(_self.cashJam, (value) {
    return _then(_self.copyWith(cashJam: value));
  });
}
}


/// @nodoc
mixin _$PerformanceSplit {

 double get uptime; double get inProgress; double get downtime;
/// Create a copy of PerformanceSplit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PerformanceSplitCopyWith<PerformanceSplit> get copyWith => _$PerformanceSplitCopyWithImpl<PerformanceSplit>(this as PerformanceSplit, _$identity);

  /// Serializes this PerformanceSplit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PerformanceSplit;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PerformanceSplit&&(identical(other.uptime, _this.uptime) || other.uptime == _this.uptime)&&(identical(other.inProgress, _this.inProgress) || other.inProgress == _this.inProgress)&&(identical(other.downtime, _this.downtime) || other.downtime == _this.downtime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PerformanceSplit;
  return Object.hash(runtimeType,_this.uptime,_this.inProgress,_this.downtime);
}

@override
String toString() {
  final _this = this as PerformanceSplit;
  return 'PerformanceSplit(uptime: ${_this.uptime}, inProgress: ${_this.inProgress}, downtime: ${_this.downtime})';
}


}

/// @nodoc
abstract mixin class $PerformanceSplitCopyWith<$Res>  {
  factory $PerformanceSplitCopyWith(PerformanceSplit value, $Res Function(PerformanceSplit) _then) = _$PerformanceSplitCopyWithImpl;
@useResult
$Res call({
 double uptime, double inProgress, double downtime
});




}
/// @nodoc
class _$PerformanceSplitCopyWithImpl<$Res>
    implements $PerformanceSplitCopyWith<$Res> {
  _$PerformanceSplitCopyWithImpl(this._self, this._then);

  final PerformanceSplit _self;
  final $Res Function(PerformanceSplit) _then;

/// Create a copy of PerformanceSplit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uptime = null,Object? inProgress = null,Object? downtime = null,}) {
  return _then(PerformanceSplit(
uptime: null == uptime ? _self.uptime : uptime // ignore: cast_nullable_to_non_nullable
as double,inProgress: null == inProgress ? _self.inProgress : inProgress // ignore: cast_nullable_to_non_nullable
as double,downtime: null == downtime ? _self.downtime : downtime // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PerformanceSplit].
extension PerformanceSplitPatterns on PerformanceSplit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PerformanceSplit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PerformanceSplit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PerformanceSplit value)  $default,){
final _that = this;
switch (_that) {
case _PerformanceSplit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PerformanceSplit value)?  $default,){
final _that = this;
switch (_that) {
case _PerformanceSplit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double uptime,  double inProgress,  double downtime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PerformanceSplit() when $default != null:
return $default(_that.uptime,_that.inProgress,_that.downtime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double uptime,  double inProgress,  double downtime)  $default,) {final _that = this;
switch (_that) {
case _PerformanceSplit():
return $default(_that.uptime,_that.inProgress,_that.downtime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double uptime,  double inProgress,  double downtime)?  $default,) {final _that = this;
switch (_that) {
case _PerformanceSplit() when $default != null:
return $default(_that.uptime,_that.inProgress,_that.downtime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PerformanceSplit implements PerformanceSplit {
  const _PerformanceSplit({required this.uptime, required this.inProgress, required this.downtime});
  factory _PerformanceSplit.fromJson(Map<String, dynamic> json) => _$PerformanceSplitFromJson(json);

@override final  double uptime;
@override final  double inProgress;
@override final  double downtime;

/// Create a copy of PerformanceSplit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PerformanceSplitCopyWith<_PerformanceSplit> get copyWith => __$PerformanceSplitCopyWithImpl<_PerformanceSplit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PerformanceSplitToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PerformanceSplit&&(identical(other.uptime, uptime) || other.uptime == uptime)&&(identical(other.inProgress, inProgress) || other.inProgress == inProgress)&&(identical(other.downtime, downtime) || other.downtime == downtime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,uptime,inProgress,downtime);
}

@override
String toString() {
    return 'PerformanceSplit(uptime: $uptime, inProgress: $inProgress, downtime: $downtime)';
}


}

/// @nodoc
abstract mixin class _$PerformanceSplitCopyWith<$Res> implements $PerformanceSplitCopyWith<$Res> {
  factory _$PerformanceSplitCopyWith(_PerformanceSplit value, $Res Function(_PerformanceSplit) _then) = __$PerformanceSplitCopyWithImpl;
@override @useResult
$Res call({
 double uptime, double inProgress, double downtime
});




}
/// @nodoc
class __$PerformanceSplitCopyWithImpl<$Res>
    implements _$PerformanceSplitCopyWith<$Res> {
  __$PerformanceSplitCopyWithImpl(this._self, this._then);

  final _PerformanceSplit _self;
  final $Res Function(_PerformanceSplit) _then;

/// Create a copy of PerformanceSplit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uptime = null,Object? inProgress = null,Object? downtime = null,}) {
  return _then(_PerformanceSplit(
uptime: null == uptime ? _self.uptime : uptime // ignore: cast_nullable_to_non_nullable
as double,inProgress: null == inProgress ? _self.inProgress : inProgress // ignore: cast_nullable_to_non_nullable
as double,downtime: null == downtime ? _self.downtime : downtime // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
