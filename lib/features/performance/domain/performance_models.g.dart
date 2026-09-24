// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PerformanceStats _$PerformanceStatsFromJson(Map<String, dynamic> json) => _PerformanceStats(
  samples: (json['samples'] as num).toInt(),
  uptime: (json['uptime'] as num?)?.toDouble(),
  downtime: (json['downtime'] as num?)?.toDouble(),
  offline: (json['offline'] as num?)?.toDouble(),
  closed: (json['closed'] as num?)?.toDouble(),
  cashJam: (json['cash_jam'] as num?)?.toDouble(),
  noData: json['no_data'] as bool,
);

Map<String, dynamic> _$PerformanceStatsToJson(_PerformanceStats instance) => <String, dynamic>{
  'samples': instance.samples,
  'uptime': instance.uptime,
  'downtime': instance.downtime,
  'offline': instance.offline,
  'closed': instance.closed,
  'cash_jam': instance.cashJam,
  'no_data': instance.noData,
};

_TerminalSummary _$TerminalSummaryFromJson(Map<String, dynamic> json) => _TerminalSummary(
  terminalId: json['terminal_id'] as String,
  location: json['location'] as String?,
  solId: json['sol_id'] as String?,
  region: json['region'] as String?,
  state: json['state'] as String?,
  brand: json['brand'] as String?,
);

Map<String, dynamic> _$TerminalSummaryToJson(_TerminalSummary instance) => <String, dynamic>{
  'terminal_id': instance.terminalId,
  'location': instance.location,
  'sol_id': instance.solId,
  'region': instance.region,
  'state': instance.state,
  'brand': instance.brand,
};

_DailyPerformance _$DailyPerformanceFromJson(Map<String, dynamic> json) => _DailyPerformance(
  date: DateTime.parse(json['date'] as String),
  stats: PerformanceStats.fromJson(json['stats'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DailyPerformanceToJson(_DailyPerformance instance) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'stats': instance.stats.toJson(),
};

_PerformanceReport _$PerformanceReportFromJson(Map<String, dynamic> json) => _PerformanceReport(
  terminal: TerminalSummary.fromJson(json['terminal'] as Map<String, dynamic>),
  from: DateTime.parse(json['from'] as String),
  to: DateTime.parse(json['to'] as String),
  days: (json['days'] as List<dynamic>)
      .map((e) => DailyPerformance.fromJson(e as Map<String, dynamic>))
      .toList(),
  totals: PerformanceStats.fromJson(json['totals'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PerformanceReportToJson(_PerformanceReport instance) => <String, dynamic>{
  'terminal': instance.terminal.toJson(),
  'from': instance.from.toIso8601String(),
  'to': instance.to.toIso8601String(),
  'days': instance.days.map((e) => e.toJson()).toList(),
  'totals': instance.totals.toJson(),
};

_RealtimeRecord _$RealtimeRecordFromJson(Map<String, dynamic> json) => _RealtimeRecord(
  terminal: TerminalSummary.fromJson(json['terminal'] as Map<String, dynamic>),
  stats: PerformanceStats.fromJson(json['stats'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RealtimeRecordToJson(_RealtimeRecord instance) => <String, dynamic>{
  'terminal': instance.terminal.toJson(),
  'stats': instance.stats.toJson(),
};

_RealtimeSummary _$RealtimeSummaryFromJson(Map<String, dynamic> json) => _RealtimeSummary(
  date: DateTime.parse(json['date'] as String),
  averageUptime: (json['average_uptime'] as num?)?.toDouble(),
  belowThreshold: (json['below_threshold'] as num).toInt(),
  threshold: (json['threshold'] as num).toInt(),
);

Map<String, dynamic> _$RealtimeSummaryToJson(_RealtimeSummary instance) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'average_uptime': instance.averageUptime,
  'below_threshold': instance.belowThreshold,
  'threshold': instance.threshold,
};
