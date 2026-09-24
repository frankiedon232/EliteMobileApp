// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DashboardSummary _$DashboardSummaryFromJson(Map<String, dynamic> json) => _DashboardSummary(
  region: json['region'] as String,
  total: (json['total'] as num).toInt(),
  generatedAt: DateTime.parse(json['generated_at'] as String),
  status: StatusCounts.fromJson(json['status'] as Map<String, dynamic>),
  cash: CashCounts.fromJson(json['cash'] as Map<String, dynamic>),
  performance: PerformanceSplit.fromJson(json['performance'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DashboardSummaryToJson(_DashboardSummary instance) => <String, dynamic>{
  'region': instance.region,
  'total': instance.total,
  'generated_at': instance.generatedAt.toIso8601String(),
  'status': instance.status.toJson(),
  'cash': instance.cash.toJson(),
  'performance': instance.performance.toJson(),
};

_CountPercentage _$CountPercentageFromJson(Map<String, dynamic> json) => _CountPercentage(
  count: (json['count'] as num).toInt(),
  percentage: (json['percentage'] as num).toDouble(),
);

Map<String, dynamic> _$CountPercentageToJson(_CountPercentage instance) => <String, dynamic>{
  'count': instance.count,
  'percentage': instance.percentage,
};

_StatusCounts _$StatusCountsFromJson(Map<String, dynamic> json) => _StatusCounts(
  inService: CountPercentage.fromJson(json['in_service'] as Map<String, dynamic>),
  offline: CountPercentage.fromJson(json['offline'] as Map<String, dynamic>),
  closed: CountPercentage.fromJson(json['closed'] as Map<String, dynamic>),
  supervisor: CountPercentage.fromJson(json['supervisor'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StatusCountsToJson(_StatusCounts instance) => <String, dynamic>{
  'in_service': instance.inService.toJson(),
  'offline': instance.offline.toJson(),
  'closed': instance.closed.toJson(),
  'supervisor': instance.supervisor.toJson(),
};

_CashCounts _$CashCountsFromJson(Map<String, dynamic> json) => _CashCounts(
  noCash: CountPercentage.fromJson(json['no_cash'] as Map<String, dynamic>),
  lowCash: CountPercentage.fromJson(json['low_cash'] as Map<String, dynamic>),
  moderateCash: CountPercentage.fromJson(json['moderate_cash'] as Map<String, dynamic>),
  highCash: CountPercentage.fromJson(json['high_cash'] as Map<String, dynamic>),
  cashJam: CountPercentage.fromJson(json['cash_jam'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CashCountsToJson(_CashCounts instance) => <String, dynamic>{
  'no_cash': instance.noCash.toJson(),
  'low_cash': instance.lowCash.toJson(),
  'moderate_cash': instance.moderateCash.toJson(),
  'high_cash': instance.highCash.toJson(),
  'cash_jam': instance.cashJam.toJson(),
};

_PerformanceSplit _$PerformanceSplitFromJson(Map<String, dynamic> json) => _PerformanceSplit(
  uptime: (json['uptime'] as num).toDouble(),
  inProgress: (json['in_progress'] as num).toDouble(),
  downtime: (json['downtime'] as num).toDouble(),
);

Map<String, dynamic> _$PerformanceSplitToJson(_PerformanceSplit instance) => <String, dynamic>{
  'uptime': instance.uptime,
  'in_progress': instance.inProgress,
  'downtime': instance.downtime,
};
