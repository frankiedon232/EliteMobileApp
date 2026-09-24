import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_models.freezed.dart';
part 'dashboard_models.g.dart';

/// `GET /dashboard/summary` → data. Computed server-side in one query.
@freezed
abstract class DashboardSummary with _$DashboardSummary {
  const factory DashboardSummary({
    required String region,
    required int total,
    required DateTime generatedAt,
    required StatusCounts status,
    required CashCounts cash,
    required PerformanceSplit performance,
  }) = _DashboardSummary;

  factory DashboardSummary.fromJson(Map<String, dynamic> json) => _$DashboardSummaryFromJson(json);
}

@freezed
abstract class CountPercentage with _$CountPercentage {
  const factory CountPercentage({required int count, required double percentage}) = _CountPercentage;

  factory CountPercentage.fromJson(Map<String, dynamic> json) => _$CountPercentageFromJson(json);
}

@freezed
abstract class StatusCounts with _$StatusCounts {
  const factory StatusCounts({
    required CountPercentage inService,
    required CountPercentage offline,
    required CountPercentage closed,
    required CountPercentage supervisor,
  }) = _StatusCounts;

  factory StatusCounts.fromJson(Map<String, dynamic> json) => _$StatusCountsFromJson(json);
}

@freezed
abstract class CashCounts with _$CashCounts {
  const factory CashCounts({
    required CountPercentage noCash,
    required CountPercentage lowCash,
    required CountPercentage moderateCash,
    required CountPercentage highCash,
    required CountPercentage cashJam,
  }) = _CashCounts;

  factory CashCounts.fromJson(Map<String, dynamic> json) => _$CashCountsFromJson(json);
}

/// Legacy definitions: uptime = ACTIVE, in_progress = SUPERVISOR + CLOSE, downtime = OFFLINE.
@freezed
abstract class PerformanceSplit with _$PerformanceSplit {
  const factory PerformanceSplit({
    required double uptime,
    required double inProgress,
    required double downtime,
  }) = _PerformanceSplit;

  factory PerformanceSplit.fromJson(Map<String, dynamic> json) => _$PerformanceSplitFromJson(json);
}
