// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RemoteConfig _$RemoteConfigFromJson(Map<String, dynamic> json) => _RemoteConfig(
  minAppVersion: json['min_app_version'] as String,
  latestAppVersion: json['latest_app_version'] as String,
  support: SupportContact.fromJson(json['support'] as Map<String, dynamic>),
  cashThresholds: CashThresholds.fromJson(json['cash_thresholds'] as Map<String, dynamic>),
  idleDays: (json['idle_days'] as num).toInt(),
  performanceReportMaxDays: (json['performance_report_max_days'] as num).toInt(),
  serverTime: DateTime.parse(json['server_time'] as String),
);

Map<String, dynamic> _$RemoteConfigToJson(_RemoteConfig instance) => <String, dynamic>{
  'min_app_version': instance.minAppVersion,
  'latest_app_version': instance.latestAppVersion,
  'support': instance.support.toJson(),
  'cash_thresholds': instance.cashThresholds.toJson(),
  'idle_days': instance.idleDays,
  'performance_report_max_days': instance.performanceReportMaxDays,
  'server_time': instance.serverTime.toIso8601String(),
};

_SupportContact _$SupportContactFromJson(Map<String, dynamic> json) =>
    _SupportContact(email: json['email'] as String?, phone: json['phone'] as String?);

Map<String, dynamic> _$SupportContactToJson(_SupportContact instance) => <String, dynamic>{
  'email': instance.email,
  'phone': instance.phone,
};

_CashThresholds _$CashThresholdsFromJson(Map<String, dynamic> json) => _CashThresholds(
  noCash: (json['no_cash'] as num).toInt(),
  low: AmountRange.fromJson(json['low'] as Map<String, dynamic>),
  moderate: AmountRange.fromJson(json['moderate'] as Map<String, dynamic>),
  high: AmountRange.fromJson(json['high'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CashThresholdsToJson(_CashThresholds instance) => <String, dynamic>{
  'no_cash': instance.noCash,
  'low': instance.low.toJson(),
  'moderate': instance.moderate.toJson(),
  'high': instance.high.toJson(),
};

_AmountRange _$AmountRangeFromJson(Map<String, dynamic> json) =>
    _AmountRange(min: (json['min'] as num).toInt(), max: (json['max'] as num).toInt());

Map<String, dynamic> _$AmountRangeToJson(_AmountRange instance) => <String, dynamic>{
  'min': instance.min,
  'max': instance.max,
};

_RegionOption _$RegionOptionFromJson(Map<String, dynamic> json) =>
    _RegionOption(value: json['value'] as String, label: json['label'] as String);

Map<String, dynamic> _$RegionOptionToJson(_RegionOption instance) => <String, dynamic>{
  'value': instance.value,
  'label': instance.label,
};

_FilterOption _$FilterOptionFromJson(Map<String, dynamic> json) => _FilterOption(
  key: $enumDecode(_$TerminalFilterEnumMap, json['key'], unknownValue: TerminalFilter.all),
  label: json['label'] as String,
);

Map<String, dynamic> _$FilterOptionToJson(_FilterOption instance) => <String, dynamic>{
  'key': _$TerminalFilterEnumMap[instance.key]!,
  'label': instance.label,
};

const _$TerminalFilterEnumMap = {
  TerminalFilter.all: 'all',
  TerminalFilter.idle: 'idle',
  TerminalFilter.online: 'online',
  TerminalFilter.offline: 'offline',
  TerminalFilter.closed: 'closed',
  TerminalFilter.supervisor: 'supervisor',
  TerminalFilter.cashJam: 'cash_jam',
  TerminalFilter.noCash: 'no_cash',
  TerminalFilter.lowCash: 'low_cash',
  TerminalFilter.moderateCash: 'moderate_cash',
  TerminalFilter.highCash: 'high_cash',
};
