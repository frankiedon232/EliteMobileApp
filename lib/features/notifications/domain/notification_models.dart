import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_models.freezed.dart';
part 'notification_models.g.dart';

/// openapi `AlertType`; also `data.type` of push payloads.
enum AlertType {
  offline,
  @JsonValue('back_in_service')
  backInService,
  @JsonValue('cash_jam')
  cashJam,
  @JsonValue('no_cash')
  noCash,
  @JsonValue('low_cash')
  lowCash,
  supervisor,
  closed,
  @JsonValue('daily_summary')
  dailySummary,
  unknown,
}

enum AlertSeverity { critical, warning, info }

/// `GET /notifications` item.
@freezed
abstract class NotificationItem with _$NotificationItem {
  const factory NotificationItem({
    required String id,
    @JsonKey(unknownEnumValue: AlertType.unknown) required AlertType type,
    required String title,
    required String body,

    /// Null for grouped alerts and daily summaries.
    String? terminalId,
    @JsonKey(unknownEnumValue: AlertSeverity.info) required AlertSeverity severity,

    /// Deep link, e.g. `/terminal/90000001`, `/terminals?filter=offline`, `/dashboard`.
    required String route,
    required DateTime sentAt,
  }) = _NotificationItem;

  factory NotificationItem.fromJson(Map<String, dynamic> json) => _$NotificationItemFromJson(json);
}

/// Per-category switches of the preferences object.
@freezed
abstract class AlertCategories with _$AlertCategories {
  const factory AlertCategories({
    @Default(true) bool offline,
    @Default(true) bool backInService,
    @Default(true) bool cashJam,
    @Default(true) bool noCash,
    @Default(false) bool lowCash,
    @Default(false) bool supervisor,
    @Default(false) bool closed,
    @Default(true) bool dailySummary,
  }) = _AlertCategories;

  factory AlertCategories.fromJson(Map<String, dynamic> json) => _$AlertCategoriesFromJson(json);
}

/// `HH:MM` 24 h, WAT; may wrap midnight.
@freezed
abstract class QuietHours with _$QuietHours {
  const factory QuietHours({required String start, required String end}) = _QuietHours;

  factory QuietHours.fromJson(Map<String, dynamic> json) => _$QuietHoursFromJson(json);
}

/// The full preferences object returned by the devices endpoints.
@freezed
abstract class NotificationPreferences with _$NotificationPreferences {
  const factory NotificationPreferences({
    required AlertCategories categories,
    @Default(<String>['All']) List<String> regions,
    QuietHours? quietHours,
    @Default(false) bool criticalBypassQuietHours,
  }) = _NotificationPreferences;

  factory NotificationPreferences.fromJson(Map<String, dynamic> json) =>
      _$NotificationPreferencesFromJson(json);
}

/// Partial update (openapi `PreferencesInput`): only non-null fields are sent. To turn quiet hours off,
/// pass `quietHours: (value: null)`; leave [quietHours] null to keep the current setting.
class PreferencesPatch {
  const PreferencesPatch({this.categories, this.regions, this.quietHours, this.criticalBypassQuietHours});

  final Map<AlertType, bool>? categories;
  final List<String>? regions;
  final ({QuietHours? value})? quietHours;
  final bool? criticalBypassQuietHours;

  bool get isEmpty =>
      categories == null && regions == null && quietHours == null && criticalBypassQuietHours == null;

  Map<String, Object?> toJson() => {
    if (categories != null)
      'categories': {
        for (final e in categories!.entries)
          if (e.key != AlertType.unknown) alertTypeKey(e.key): e.value,
      },
    if (regions != null) 'regions': regions,
    if (quietHours != null) 'quiet_hours': quietHours!.value?.toJson(),
    if (criticalBypassQuietHours != null) 'critical_bypass_quiet_hours': criticalBypassQuietHours,
  };
}

/// Wire key of an [AlertType] (`back_in_service`, …).
String alertTypeKey(AlertType t) => switch (t) {
  AlertType.backInService => 'back_in_service',
  AlertType.cashJam => 'cash_jam',
  AlertType.noCash => 'no_cash',
  AlertType.lowCash => 'low_cash',
  AlertType.dailySummary => 'daily_summary',
  _ => t.name,
};

/// `POST /devices` / `PUT /devices/{token}/preferences` → data. The token is never echoed.
@freezed
abstract class DeviceRegistration with _$DeviceRegistration {
  const factory DeviceRegistration({
    required String platform,
    String? appVersion,
    required NotificationPreferences preferences,
    required DateTime registeredAt,
    required DateTime updatedAt,
  }) = _DeviceRegistration;

  factory DeviceRegistration.fromJson(Map<String, dynamic> json) => _$DeviceRegistrationFromJson(json);
}
