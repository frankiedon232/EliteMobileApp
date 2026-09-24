// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationItem _$NotificationItemFromJson(Map<String, dynamic> json) => _NotificationItem(
  id: json['id'] as String,
  type: $enumDecode(_$AlertTypeEnumMap, json['type'], unknownValue: AlertType.unknown),
  title: json['title'] as String,
  body: json['body'] as String,
  terminalId: json['terminal_id'] as String?,
  severity: $enumDecode(_$AlertSeverityEnumMap, json['severity'], unknownValue: AlertSeverity.info),
  route: json['route'] as String,
  sentAt: DateTime.parse(json['sent_at'] as String),
);

Map<String, dynamic> _$NotificationItemToJson(_NotificationItem instance) => <String, dynamic>{
  'id': instance.id,
  'type': _$AlertTypeEnumMap[instance.type]!,
  'title': instance.title,
  'body': instance.body,
  'terminal_id': instance.terminalId,
  'severity': _$AlertSeverityEnumMap[instance.severity]!,
  'route': instance.route,
  'sent_at': instance.sentAt.toIso8601String(),
};

const _$AlertTypeEnumMap = {
  AlertType.offline: 'offline',
  AlertType.backInService: 'back_in_service',
  AlertType.cashJam: 'cash_jam',
  AlertType.noCash: 'no_cash',
  AlertType.lowCash: 'low_cash',
  AlertType.supervisor: 'supervisor',
  AlertType.closed: 'closed',
  AlertType.dailySummary: 'daily_summary',
  AlertType.unknown: 'unknown',
};

const _$AlertSeverityEnumMap = {
  AlertSeverity.critical: 'critical',
  AlertSeverity.warning: 'warning',
  AlertSeverity.info: 'info',
};

_AlertCategories _$AlertCategoriesFromJson(Map<String, dynamic> json) => _AlertCategories(
  offline: json['offline'] as bool? ?? true,
  backInService: json['back_in_service'] as bool? ?? true,
  cashJam: json['cash_jam'] as bool? ?? true,
  noCash: json['no_cash'] as bool? ?? true,
  lowCash: json['low_cash'] as bool? ?? false,
  supervisor: json['supervisor'] as bool? ?? false,
  closed: json['closed'] as bool? ?? false,
  dailySummary: json['daily_summary'] as bool? ?? true,
);

Map<String, dynamic> _$AlertCategoriesToJson(_AlertCategories instance) => <String, dynamic>{
  'offline': instance.offline,
  'back_in_service': instance.backInService,
  'cash_jam': instance.cashJam,
  'no_cash': instance.noCash,
  'low_cash': instance.lowCash,
  'supervisor': instance.supervisor,
  'closed': instance.closed,
  'daily_summary': instance.dailySummary,
};

_QuietHours _$QuietHoursFromJson(Map<String, dynamic> json) =>
    _QuietHours(start: json['start'] as String, end: json['end'] as String);

Map<String, dynamic> _$QuietHoursToJson(_QuietHours instance) => <String, dynamic>{
  'start': instance.start,
  'end': instance.end,
};

_NotificationPreferences _$NotificationPreferencesFromJson(Map<String, dynamic> json) =>
    _NotificationPreferences(
      categories: AlertCategories.fromJson(json['categories'] as Map<String, dynamic>),
      regions: (json['regions'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const <String>['All'],
      quietHours: json['quiet_hours'] == null
          ? null
          : QuietHours.fromJson(json['quiet_hours'] as Map<String, dynamic>),
      criticalBypassQuietHours: json['critical_bypass_quiet_hours'] as bool? ?? false,
    );

Map<String, dynamic> _$NotificationPreferencesToJson(_NotificationPreferences instance) => <String, dynamic>{
  'categories': instance.categories.toJson(),
  'regions': instance.regions,
  'quiet_hours': instance.quietHours?.toJson(),
  'critical_bypass_quiet_hours': instance.criticalBypassQuietHours,
};

_DeviceRegistration _$DeviceRegistrationFromJson(Map<String, dynamic> json) => _DeviceRegistration(
  platform: json['platform'] as String,
  appVersion: json['app_version'] as String?,
  preferences: NotificationPreferences.fromJson(json['preferences'] as Map<String, dynamic>),
  registeredAt: DateTime.parse(json['registered_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$DeviceRegistrationToJson(_DeviceRegistration instance) => <String, dynamic>{
  'platform': instance.platform,
  'app_version': instance.appVersion,
  'preferences': instance.preferences.toJson(),
  'registered_at': instance.registeredAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
