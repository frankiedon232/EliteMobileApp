// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationItem {

 String get id;@JsonKey(unknownEnumValue: AlertType.unknown) AlertType get type; String get title; String get body;/// Null for grouped alerts and daily summaries.
 String? get terminalId;@JsonKey(unknownEnumValue: AlertSeverity.info) AlertSeverity get severity;/// Deep link, e.g. `/terminal/90000001`, `/terminals?filter=offline`, `/dashboard`.
 String get route; DateTime get sentAt;
/// Create a copy of NotificationItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationItemCopyWith<NotificationItem> get copyWith => _$NotificationItemCopyWithImpl<NotificationItem>(this as NotificationItem, _$identity);

  /// Serializes this NotificationItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NotificationItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationItem&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.body, _this.body) || other.body == _this.body)&&(identical(other.terminalId, _this.terminalId) || other.terminalId == _this.terminalId)&&(identical(other.severity, _this.severity) || other.severity == _this.severity)&&(identical(other.route, _this.route) || other.route == _this.route)&&(identical(other.sentAt, _this.sentAt) || other.sentAt == _this.sentAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NotificationItem;
  return Object.hash(runtimeType,_this.id,_this.type,_this.title,_this.body,_this.terminalId,_this.severity,_this.route,_this.sentAt);
}

@override
String toString() {
  final _this = this as NotificationItem;
  return 'NotificationItem(id: ${_this.id}, type: ${_this.type}, title: ${_this.title}, body: ${_this.body}, terminalId: ${_this.terminalId}, severity: ${_this.severity}, route: ${_this.route}, sentAt: ${_this.sentAt})';
}


}

/// @nodoc
abstract mixin class $NotificationItemCopyWith<$Res>  {
  factory $NotificationItemCopyWith(NotificationItem value, $Res Function(NotificationItem) _then) = _$NotificationItemCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(unknownEnumValue: AlertType.unknown) AlertType type, String title, String body, String? terminalId,@JsonKey(unknownEnumValue: AlertSeverity.info) AlertSeverity severity, String route, DateTime sentAt
});




}
/// @nodoc
class _$NotificationItemCopyWithImpl<$Res>
    implements $NotificationItemCopyWith<$Res> {
  _$NotificationItemCopyWithImpl(this._self, this._then);

  final NotificationItem _self;
  final $Res Function(NotificationItem) _then;

/// Create a copy of NotificationItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? title = null,Object? body = null,Object? terminalId = freezed,Object? severity = null,Object? route = null,Object? sentAt = null,}) {
  return _then(NotificationItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AlertType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,terminalId: freezed == terminalId ? _self.terminalId : terminalId // ignore: cast_nullable_to_non_nullable
as String?,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as AlertSeverity,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationItem].
extension NotificationItemPatterns on NotificationItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationItem value)  $default,){
final _that = this;
switch (_that) {
case _NotificationItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationItem value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(unknownEnumValue: AlertType.unknown)  AlertType type,  String title,  String body,  String? terminalId, @JsonKey(unknownEnumValue: AlertSeverity.info)  AlertSeverity severity,  String route,  DateTime sentAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationItem() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.body,_that.terminalId,_that.severity,_that.route,_that.sentAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(unknownEnumValue: AlertType.unknown)  AlertType type,  String title,  String body,  String? terminalId, @JsonKey(unknownEnumValue: AlertSeverity.info)  AlertSeverity severity,  String route,  DateTime sentAt)  $default,) {final _that = this;
switch (_that) {
case _NotificationItem():
return $default(_that.id,_that.type,_that.title,_that.body,_that.terminalId,_that.severity,_that.route,_that.sentAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(unknownEnumValue: AlertType.unknown)  AlertType type,  String title,  String body,  String? terminalId, @JsonKey(unknownEnumValue: AlertSeverity.info)  AlertSeverity severity,  String route,  DateTime sentAt)?  $default,) {final _that = this;
switch (_that) {
case _NotificationItem() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.body,_that.terminalId,_that.severity,_that.route,_that.sentAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationItem implements NotificationItem {
  const _NotificationItem({required this.id, @JsonKey(unknownEnumValue: AlertType.unknown) required this.type, required this.title, required this.body, this.terminalId, @JsonKey(unknownEnumValue: AlertSeverity.info) required this.severity, required this.route, required this.sentAt});
  factory _NotificationItem.fromJson(Map<String, dynamic> json) => _$NotificationItemFromJson(json);

@override final  String id;
@override@JsonKey(unknownEnumValue: AlertType.unknown) final  AlertType type;
@override final  String title;
@override final  String body;
/// Null for grouped alerts and daily summaries.
@override final  String? terminalId;
@override@JsonKey(unknownEnumValue: AlertSeverity.info) final  AlertSeverity severity;
/// Deep link, e.g. `/terminal/90000001`, `/terminals?filter=offline`, `/dashboard`.
@override final  String route;
@override final  DateTime sentAt;

/// Create a copy of NotificationItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationItemCopyWith<_NotificationItem> get copyWith => __$NotificationItemCopyWithImpl<_NotificationItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationItem&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.terminalId, terminalId) || other.terminalId == terminalId)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.route, route) || other.route == route)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,type,title,body,terminalId,severity,route,sentAt);
}

@override
String toString() {
    return 'NotificationItem(id: $id, type: $type, title: $title, body: $body, terminalId: $terminalId, severity: $severity, route: $route, sentAt: $sentAt)';
}


}

/// @nodoc
abstract mixin class _$NotificationItemCopyWith<$Res> implements $NotificationItemCopyWith<$Res> {
  factory _$NotificationItemCopyWith(_NotificationItem value, $Res Function(_NotificationItem) _then) = __$NotificationItemCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(unknownEnumValue: AlertType.unknown) AlertType type, String title, String body, String? terminalId,@JsonKey(unknownEnumValue: AlertSeverity.info) AlertSeverity severity, String route, DateTime sentAt
});




}
/// @nodoc
class __$NotificationItemCopyWithImpl<$Res>
    implements _$NotificationItemCopyWith<$Res> {
  __$NotificationItemCopyWithImpl(this._self, this._then);

  final _NotificationItem _self;
  final $Res Function(_NotificationItem) _then;

/// Create a copy of NotificationItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? title = null,Object? body = null,Object? terminalId = freezed,Object? severity = null,Object? route = null,Object? sentAt = null,}) {
  return _then(_NotificationItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AlertType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,terminalId: freezed == terminalId ? _self.terminalId : terminalId // ignore: cast_nullable_to_non_nullable
as String?,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as AlertSeverity,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$AlertCategories {

 bool get offline; bool get backInService; bool get cashJam; bool get noCash; bool get lowCash; bool get supervisor; bool get closed; bool get dailySummary;
/// Create a copy of AlertCategories
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertCategoriesCopyWith<AlertCategories> get copyWith => _$AlertCategoriesCopyWithImpl<AlertCategories>(this as AlertCategories, _$identity);

  /// Serializes this AlertCategories to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AlertCategories;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertCategories&&(identical(other.offline, _this.offline) || other.offline == _this.offline)&&(identical(other.backInService, _this.backInService) || other.backInService == _this.backInService)&&(identical(other.cashJam, _this.cashJam) || other.cashJam == _this.cashJam)&&(identical(other.noCash, _this.noCash) || other.noCash == _this.noCash)&&(identical(other.lowCash, _this.lowCash) || other.lowCash == _this.lowCash)&&(identical(other.supervisor, _this.supervisor) || other.supervisor == _this.supervisor)&&(identical(other.closed, _this.closed) || other.closed == _this.closed)&&(identical(other.dailySummary, _this.dailySummary) || other.dailySummary == _this.dailySummary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AlertCategories;
  return Object.hash(runtimeType,_this.offline,_this.backInService,_this.cashJam,_this.noCash,_this.lowCash,_this.supervisor,_this.closed,_this.dailySummary);
}

@override
String toString() {
  final _this = this as AlertCategories;
  return 'AlertCategories(offline: ${_this.offline}, backInService: ${_this.backInService}, cashJam: ${_this.cashJam}, noCash: ${_this.noCash}, lowCash: ${_this.lowCash}, supervisor: ${_this.supervisor}, closed: ${_this.closed}, dailySummary: ${_this.dailySummary})';
}


}

/// @nodoc
abstract mixin class $AlertCategoriesCopyWith<$Res>  {
  factory $AlertCategoriesCopyWith(AlertCategories value, $Res Function(AlertCategories) _then) = _$AlertCategoriesCopyWithImpl;
@useResult
$Res call({
 bool offline, bool backInService, bool cashJam, bool noCash, bool lowCash, bool supervisor, bool closed, bool dailySummary
});




}
/// @nodoc
class _$AlertCategoriesCopyWithImpl<$Res>
    implements $AlertCategoriesCopyWith<$Res> {
  _$AlertCategoriesCopyWithImpl(this._self, this._then);

  final AlertCategories _self;
  final $Res Function(AlertCategories) _then;

/// Create a copy of AlertCategories
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? offline = null,Object? backInService = null,Object? cashJam = null,Object? noCash = null,Object? lowCash = null,Object? supervisor = null,Object? closed = null,Object? dailySummary = null,}) {
  return _then(AlertCategories(
offline: null == offline ? _self.offline : offline // ignore: cast_nullable_to_non_nullable
as bool,backInService: null == backInService ? _self.backInService : backInService // ignore: cast_nullable_to_non_nullable
as bool,cashJam: null == cashJam ? _self.cashJam : cashJam // ignore: cast_nullable_to_non_nullable
as bool,noCash: null == noCash ? _self.noCash : noCash // ignore: cast_nullable_to_non_nullable
as bool,lowCash: null == lowCash ? _self.lowCash : lowCash // ignore: cast_nullable_to_non_nullable
as bool,supervisor: null == supervisor ? _self.supervisor : supervisor // ignore: cast_nullable_to_non_nullable
as bool,closed: null == closed ? _self.closed : closed // ignore: cast_nullable_to_non_nullable
as bool,dailySummary: null == dailySummary ? _self.dailySummary : dailySummary // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AlertCategories].
extension AlertCategoriesPatterns on AlertCategories {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlertCategories value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlertCategories() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlertCategories value)  $default,){
final _that = this;
switch (_that) {
case _AlertCategories():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlertCategories value)?  $default,){
final _that = this;
switch (_that) {
case _AlertCategories() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool offline,  bool backInService,  bool cashJam,  bool noCash,  bool lowCash,  bool supervisor,  bool closed,  bool dailySummary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlertCategories() when $default != null:
return $default(_that.offline,_that.backInService,_that.cashJam,_that.noCash,_that.lowCash,_that.supervisor,_that.closed,_that.dailySummary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool offline,  bool backInService,  bool cashJam,  bool noCash,  bool lowCash,  bool supervisor,  bool closed,  bool dailySummary)  $default,) {final _that = this;
switch (_that) {
case _AlertCategories():
return $default(_that.offline,_that.backInService,_that.cashJam,_that.noCash,_that.lowCash,_that.supervisor,_that.closed,_that.dailySummary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool offline,  bool backInService,  bool cashJam,  bool noCash,  bool lowCash,  bool supervisor,  bool closed,  bool dailySummary)?  $default,) {final _that = this;
switch (_that) {
case _AlertCategories() when $default != null:
return $default(_that.offline,_that.backInService,_that.cashJam,_that.noCash,_that.lowCash,_that.supervisor,_that.closed,_that.dailySummary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlertCategories implements AlertCategories {
  const _AlertCategories({this.offline = true, this.backInService = true, this.cashJam = true, this.noCash = true, this.lowCash = false, this.supervisor = false, this.closed = false, this.dailySummary = true});
  factory _AlertCategories.fromJson(Map<String, dynamic> json) => _$AlertCategoriesFromJson(json);

@override@JsonKey() final  bool offline;
@override@JsonKey() final  bool backInService;
@override@JsonKey() final  bool cashJam;
@override@JsonKey() final  bool noCash;
@override@JsonKey() final  bool lowCash;
@override@JsonKey() final  bool supervisor;
@override@JsonKey() final  bool closed;
@override@JsonKey() final  bool dailySummary;

/// Create a copy of AlertCategories
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlertCategoriesCopyWith<_AlertCategories> get copyWith => __$AlertCategoriesCopyWithImpl<_AlertCategories>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlertCategoriesToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlertCategories&&(identical(other.offline, offline) || other.offline == offline)&&(identical(other.backInService, backInService) || other.backInService == backInService)&&(identical(other.cashJam, cashJam) || other.cashJam == cashJam)&&(identical(other.noCash, noCash) || other.noCash == noCash)&&(identical(other.lowCash, lowCash) || other.lowCash == lowCash)&&(identical(other.supervisor, supervisor) || other.supervisor == supervisor)&&(identical(other.closed, closed) || other.closed == closed)&&(identical(other.dailySummary, dailySummary) || other.dailySummary == dailySummary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,offline,backInService,cashJam,noCash,lowCash,supervisor,closed,dailySummary);
}

@override
String toString() {
    return 'AlertCategories(offline: $offline, backInService: $backInService, cashJam: $cashJam, noCash: $noCash, lowCash: $lowCash, supervisor: $supervisor, closed: $closed, dailySummary: $dailySummary)';
}


}

/// @nodoc
abstract mixin class _$AlertCategoriesCopyWith<$Res> implements $AlertCategoriesCopyWith<$Res> {
  factory _$AlertCategoriesCopyWith(_AlertCategories value, $Res Function(_AlertCategories) _then) = __$AlertCategoriesCopyWithImpl;
@override @useResult
$Res call({
 bool offline, bool backInService, bool cashJam, bool noCash, bool lowCash, bool supervisor, bool closed, bool dailySummary
});




}
/// @nodoc
class __$AlertCategoriesCopyWithImpl<$Res>
    implements _$AlertCategoriesCopyWith<$Res> {
  __$AlertCategoriesCopyWithImpl(this._self, this._then);

  final _AlertCategories _self;
  final $Res Function(_AlertCategories) _then;

/// Create a copy of AlertCategories
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? offline = null,Object? backInService = null,Object? cashJam = null,Object? noCash = null,Object? lowCash = null,Object? supervisor = null,Object? closed = null,Object? dailySummary = null,}) {
  return _then(_AlertCategories(
offline: null == offline ? _self.offline : offline // ignore: cast_nullable_to_non_nullable
as bool,backInService: null == backInService ? _self.backInService : backInService // ignore: cast_nullable_to_non_nullable
as bool,cashJam: null == cashJam ? _self.cashJam : cashJam // ignore: cast_nullable_to_non_nullable
as bool,noCash: null == noCash ? _self.noCash : noCash // ignore: cast_nullable_to_non_nullable
as bool,lowCash: null == lowCash ? _self.lowCash : lowCash // ignore: cast_nullable_to_non_nullable
as bool,supervisor: null == supervisor ? _self.supervisor : supervisor // ignore: cast_nullable_to_non_nullable
as bool,closed: null == closed ? _self.closed : closed // ignore: cast_nullable_to_non_nullable
as bool,dailySummary: null == dailySummary ? _self.dailySummary : dailySummary // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$QuietHours {

 String get start; String get end;
/// Create a copy of QuietHours
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuietHoursCopyWith<QuietHours> get copyWith => _$QuietHoursCopyWithImpl<QuietHours>(this as QuietHours, _$identity);

  /// Serializes this QuietHours to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as QuietHours;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuietHours&&(identical(other.start, _this.start) || other.start == _this.start)&&(identical(other.end, _this.end) || other.end == _this.end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as QuietHours;
  return Object.hash(runtimeType,_this.start,_this.end);
}

@override
String toString() {
  final _this = this as QuietHours;
  return 'QuietHours(start: ${_this.start}, end: ${_this.end})';
}


}

/// @nodoc
abstract mixin class $QuietHoursCopyWith<$Res>  {
  factory $QuietHoursCopyWith(QuietHours value, $Res Function(QuietHours) _then) = _$QuietHoursCopyWithImpl;
@useResult
$Res call({
 String start, String end
});




}
/// @nodoc
class _$QuietHoursCopyWithImpl<$Res>
    implements $QuietHoursCopyWith<$Res> {
  _$QuietHoursCopyWithImpl(this._self, this._then);

  final QuietHours _self;
  final $Res Function(QuietHours) _then;

/// Create a copy of QuietHours
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = null,Object? end = null,}) {
  return _then(QuietHours(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [QuietHours].
extension QuietHoursPatterns on QuietHours {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuietHours value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuietHours() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuietHours value)  $default,){
final _that = this;
switch (_that) {
case _QuietHours():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuietHours value)?  $default,){
final _that = this;
switch (_that) {
case _QuietHours() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String start,  String end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuietHours() when $default != null:
return $default(_that.start,_that.end);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String start,  String end)  $default,) {final _that = this;
switch (_that) {
case _QuietHours():
return $default(_that.start,_that.end);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String start,  String end)?  $default,) {final _that = this;
switch (_that) {
case _QuietHours() when $default != null:
return $default(_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuietHours implements QuietHours {
  const _QuietHours({required this.start, required this.end});
  factory _QuietHours.fromJson(Map<String, dynamic> json) => _$QuietHoursFromJson(json);

@override final  String start;
@override final  String end;

/// Create a copy of QuietHours
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuietHoursCopyWith<_QuietHours> get copyWith => __$QuietHoursCopyWithImpl<_QuietHours>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuietHoursToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuietHours&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,start,end);
}

@override
String toString() {
    return 'QuietHours(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$QuietHoursCopyWith<$Res> implements $QuietHoursCopyWith<$Res> {
  factory _$QuietHoursCopyWith(_QuietHours value, $Res Function(_QuietHours) _then) = __$QuietHoursCopyWithImpl;
@override @useResult
$Res call({
 String start, String end
});




}
/// @nodoc
class __$QuietHoursCopyWithImpl<$Res>
    implements _$QuietHoursCopyWith<$Res> {
  __$QuietHoursCopyWithImpl(this._self, this._then);

  final _QuietHours _self;
  final $Res Function(_QuietHours) _then;

/// Create a copy of QuietHours
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = null,Object? end = null,}) {
  return _then(_QuietHours(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$NotificationPreferences {

 AlertCategories get categories; List<String> get regions; QuietHours? get quietHours; bool get criticalBypassQuietHours;
/// Create a copy of NotificationPreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationPreferencesCopyWith<NotificationPreferences> get copyWith => _$NotificationPreferencesCopyWithImpl<NotificationPreferences>(this as NotificationPreferences, _$identity);

  /// Serializes this NotificationPreferences to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NotificationPreferences;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationPreferences&&(identical(other.categories, _this.categories) || other.categories == _this.categories)&&const DeepCollectionEquality().equals(other.regions, _this.regions)&&(identical(other.quietHours, _this.quietHours) || other.quietHours == _this.quietHours)&&(identical(other.criticalBypassQuietHours, _this.criticalBypassQuietHours) || other.criticalBypassQuietHours == _this.criticalBypassQuietHours));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NotificationPreferences;
  return Object.hash(runtimeType,_this.categories,const DeepCollectionEquality().hash(_this.regions),_this.quietHours,_this.criticalBypassQuietHours);
}

@override
String toString() {
  final _this = this as NotificationPreferences;
  return 'NotificationPreferences(categories: ${_this.categories}, regions: ${_this.regions}, quietHours: ${_this.quietHours}, criticalBypassQuietHours: ${_this.criticalBypassQuietHours})';
}


}

/// @nodoc
abstract mixin class $NotificationPreferencesCopyWith<$Res>  {
  factory $NotificationPreferencesCopyWith(NotificationPreferences value, $Res Function(NotificationPreferences) _then) = _$NotificationPreferencesCopyWithImpl;
@useResult
$Res call({
 AlertCategories categories, List<String> regions, QuietHours? quietHours, bool criticalBypassQuietHours
});


$AlertCategoriesCopyWith<$Res> get categories;$QuietHoursCopyWith<$Res>? get quietHours;

}
/// @nodoc
class _$NotificationPreferencesCopyWithImpl<$Res>
    implements $NotificationPreferencesCopyWith<$Res> {
  _$NotificationPreferencesCopyWithImpl(this._self, this._then);

  final NotificationPreferences _self;
  final $Res Function(NotificationPreferences) _then;

/// Create a copy of NotificationPreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? regions = null,Object? quietHours = freezed,Object? criticalBypassQuietHours = null,}) {
  return _then(NotificationPreferences(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as AlertCategories,regions: null == regions ? _self.regions : regions // ignore: cast_nullable_to_non_nullable
as List<String>,quietHours: freezed == quietHours ? _self.quietHours : quietHours // ignore: cast_nullable_to_non_nullable
as QuietHours?,criticalBypassQuietHours: null == criticalBypassQuietHours ? _self.criticalBypassQuietHours : criticalBypassQuietHours // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of NotificationPreferences
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlertCategoriesCopyWith<$Res> get categories {
  
  return $AlertCategoriesCopyWith<$Res>(_self.categories, (value) {
    return _then(_self.copyWith(categories: value));
  });
}/// Create a copy of NotificationPreferences
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuietHoursCopyWith<$Res>? get quietHours {
    if (_self.quietHours == null) {
    return null;
  }

  return $QuietHoursCopyWith<$Res>(_self.quietHours!, (value) {
    return _then(_self.copyWith(quietHours: value));
  });
}
}


/// Adds pattern-matching-related methods to [NotificationPreferences].
extension NotificationPreferencesPatterns on NotificationPreferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationPreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationPreferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationPreferences value)  $default,){
final _that = this;
switch (_that) {
case _NotificationPreferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationPreferences value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationPreferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AlertCategories categories,  List<String> regions,  QuietHours? quietHours,  bool criticalBypassQuietHours)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationPreferences() when $default != null:
return $default(_that.categories,_that.regions,_that.quietHours,_that.criticalBypassQuietHours);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AlertCategories categories,  List<String> regions,  QuietHours? quietHours,  bool criticalBypassQuietHours)  $default,) {final _that = this;
switch (_that) {
case _NotificationPreferences():
return $default(_that.categories,_that.regions,_that.quietHours,_that.criticalBypassQuietHours);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AlertCategories categories,  List<String> regions,  QuietHours? quietHours,  bool criticalBypassQuietHours)?  $default,) {final _that = this;
switch (_that) {
case _NotificationPreferences() when $default != null:
return $default(_that.categories,_that.regions,_that.quietHours,_that.criticalBypassQuietHours);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationPreferences implements NotificationPreferences {
  const _NotificationPreferences({required this.categories,  List<String> regions = const <String>['All'], this.quietHours, this.criticalBypassQuietHours = false}): _regions = regions;
  factory _NotificationPreferences.fromJson(Map<String, dynamic> json) => _$NotificationPreferencesFromJson(json);

@override final  AlertCategories categories;
 final  List<String> _regions;
@override@JsonKey() List<String> get regions {
  if (_regions is EqualUnmodifiableListView) return _regions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_regions);
}

@override final  QuietHours? quietHours;
@override@JsonKey() final  bool criticalBypassQuietHours;

/// Create a copy of NotificationPreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationPreferencesCopyWith<_NotificationPreferences> get copyWith => __$NotificationPreferencesCopyWithImpl<_NotificationPreferences>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationPreferencesToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationPreferences&&(identical(other.categories, categories) || other.categories == categories)&&const DeepCollectionEquality().equals(other.regions, _regions)&&(identical(other.quietHours, quietHours) || other.quietHours == quietHours)&&(identical(other.criticalBypassQuietHours, criticalBypassQuietHours) || other.criticalBypassQuietHours == criticalBypassQuietHours));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,categories,const DeepCollectionEquality().hash(_regions),quietHours,criticalBypassQuietHours);
}

@override
String toString() {
    return 'NotificationPreferences(categories: $categories, regions: $regions, quietHours: $quietHours, criticalBypassQuietHours: $criticalBypassQuietHours)';
}


}

/// @nodoc
abstract mixin class _$NotificationPreferencesCopyWith<$Res> implements $NotificationPreferencesCopyWith<$Res> {
  factory _$NotificationPreferencesCopyWith(_NotificationPreferences value, $Res Function(_NotificationPreferences) _then) = __$NotificationPreferencesCopyWithImpl;
@override @useResult
$Res call({
 AlertCategories categories, List<String> regions, QuietHours? quietHours, bool criticalBypassQuietHours
});


@override $AlertCategoriesCopyWith<$Res> get categories;@override $QuietHoursCopyWith<$Res>? get quietHours;

}
/// @nodoc
class __$NotificationPreferencesCopyWithImpl<$Res>
    implements _$NotificationPreferencesCopyWith<$Res> {
  __$NotificationPreferencesCopyWithImpl(this._self, this._then);

  final _NotificationPreferences _self;
  final $Res Function(_NotificationPreferences) _then;

/// Create a copy of NotificationPreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? regions = null,Object? quietHours = freezed,Object? criticalBypassQuietHours = null,}) {
  return _then(_NotificationPreferences(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as AlertCategories,regions: null == regions ? _self._regions : regions // ignore: cast_nullable_to_non_nullable
as List<String>,quietHours: freezed == quietHours ? _self.quietHours : quietHours // ignore: cast_nullable_to_non_nullable
as QuietHours?,criticalBypassQuietHours: null == criticalBypassQuietHours ? _self.criticalBypassQuietHours : criticalBypassQuietHours // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of NotificationPreferences
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlertCategoriesCopyWith<$Res> get categories {
  
  return $AlertCategoriesCopyWith<$Res>(_self.categories, (value) {
    return _then(_self.copyWith(categories: value));
  });
}/// Create a copy of NotificationPreferences
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuietHoursCopyWith<$Res>? get quietHours {
    if (_self.quietHours == null) {
    return null;
  }

  return $QuietHoursCopyWith<$Res>(_self.quietHours!, (value) {
    return _then(_self.copyWith(quietHours: value));
  });
}
}


/// @nodoc
mixin _$DeviceRegistration {

 String get platform; String? get appVersion; NotificationPreferences get preferences; DateTime get registeredAt; DateTime get updatedAt;
/// Create a copy of DeviceRegistration
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceRegistrationCopyWith<DeviceRegistration> get copyWith => _$DeviceRegistrationCopyWithImpl<DeviceRegistration>(this as DeviceRegistration, _$identity);

  /// Serializes this DeviceRegistration to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DeviceRegistration;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceRegistration&&(identical(other.platform, _this.platform) || other.platform == _this.platform)&&(identical(other.appVersion, _this.appVersion) || other.appVersion == _this.appVersion)&&(identical(other.preferences, _this.preferences) || other.preferences == _this.preferences)&&(identical(other.registeredAt, _this.registeredAt) || other.registeredAt == _this.registeredAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DeviceRegistration;
  return Object.hash(runtimeType,_this.platform,_this.appVersion,_this.preferences,_this.registeredAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as DeviceRegistration;
  return 'DeviceRegistration(platform: ${_this.platform}, appVersion: ${_this.appVersion}, preferences: ${_this.preferences}, registeredAt: ${_this.registeredAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $DeviceRegistrationCopyWith<$Res>  {
  factory $DeviceRegistrationCopyWith(DeviceRegistration value, $Res Function(DeviceRegistration) _then) = _$DeviceRegistrationCopyWithImpl;
@useResult
$Res call({
 String platform, String? appVersion, NotificationPreferences preferences, DateTime registeredAt, DateTime updatedAt
});


$NotificationPreferencesCopyWith<$Res> get preferences;

}
/// @nodoc
class _$DeviceRegistrationCopyWithImpl<$Res>
    implements $DeviceRegistrationCopyWith<$Res> {
  _$DeviceRegistrationCopyWithImpl(this._self, this._then);

  final DeviceRegistration _self;
  final $Res Function(DeviceRegistration) _then;

/// Create a copy of DeviceRegistration
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? platform = null,Object? appVersion = freezed,Object? preferences = null,Object? registeredAt = null,Object? updatedAt = null,}) {
  return _then(DeviceRegistration(
platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,appVersion: freezed == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String?,preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as NotificationPreferences,registeredAt: null == registeredAt ? _self.registeredAt : registeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of DeviceRegistration
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationPreferencesCopyWith<$Res> get preferences {
  
  return $NotificationPreferencesCopyWith<$Res>(_self.preferences, (value) {
    return _then(_self.copyWith(preferences: value));
  });
}
}


/// Adds pattern-matching-related methods to [DeviceRegistration].
extension DeviceRegistrationPatterns on DeviceRegistration {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceRegistration value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceRegistration() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceRegistration value)  $default,){
final _that = this;
switch (_that) {
case _DeviceRegistration():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceRegistration value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceRegistration() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String platform,  String? appVersion,  NotificationPreferences preferences,  DateTime registeredAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceRegistration() when $default != null:
return $default(_that.platform,_that.appVersion,_that.preferences,_that.registeredAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String platform,  String? appVersion,  NotificationPreferences preferences,  DateTime registeredAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DeviceRegistration():
return $default(_that.platform,_that.appVersion,_that.preferences,_that.registeredAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String platform,  String? appVersion,  NotificationPreferences preferences,  DateTime registeredAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DeviceRegistration() when $default != null:
return $default(_that.platform,_that.appVersion,_that.preferences,_that.registeredAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceRegistration implements DeviceRegistration {
  const _DeviceRegistration({required this.platform, this.appVersion, required this.preferences, required this.registeredAt, required this.updatedAt});
  factory _DeviceRegistration.fromJson(Map<String, dynamic> json) => _$DeviceRegistrationFromJson(json);

@override final  String platform;
@override final  String? appVersion;
@override final  NotificationPreferences preferences;
@override final  DateTime registeredAt;
@override final  DateTime updatedAt;

/// Create a copy of DeviceRegistration
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceRegistrationCopyWith<_DeviceRegistration> get copyWith => __$DeviceRegistrationCopyWithImpl<_DeviceRegistration>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceRegistrationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceRegistration&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.preferences, preferences) || other.preferences == preferences)&&(identical(other.registeredAt, registeredAt) || other.registeredAt == registeredAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,platform,appVersion,preferences,registeredAt,updatedAt);
}

@override
String toString() {
    return 'DeviceRegistration(platform: $platform, appVersion: $appVersion, preferences: $preferences, registeredAt: $registeredAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DeviceRegistrationCopyWith<$Res> implements $DeviceRegistrationCopyWith<$Res> {
  factory _$DeviceRegistrationCopyWith(_DeviceRegistration value, $Res Function(_DeviceRegistration) _then) = __$DeviceRegistrationCopyWithImpl;
@override @useResult
$Res call({
 String platform, String? appVersion, NotificationPreferences preferences, DateTime registeredAt, DateTime updatedAt
});


@override $NotificationPreferencesCopyWith<$Res> get preferences;

}
/// @nodoc
class __$DeviceRegistrationCopyWithImpl<$Res>
    implements _$DeviceRegistrationCopyWith<$Res> {
  __$DeviceRegistrationCopyWithImpl(this._self, this._then);

  final _DeviceRegistration _self;
  final $Res Function(_DeviceRegistration) _then;

/// Create a copy of DeviceRegistration
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? platform = null,Object? appVersion = freezed,Object? preferences = null,Object? registeredAt = null,Object? updatedAt = null,}) {
  return _then(_DeviceRegistration(
platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,appVersion: freezed == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String?,preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as NotificationPreferences,registeredAt: null == registeredAt ? _self.registeredAt : registeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of DeviceRegistration
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationPreferencesCopyWith<$Res> get preferences {
  
  return $NotificationPreferencesCopyWith<$Res>(_self.preferences, (value) {
    return _then(_self.copyWith(preferences: value));
  });
}
}

// dart format on
