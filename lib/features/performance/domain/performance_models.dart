import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/network/envelope.dart';
import '../../../core/network/paged.dart';

part 'performance_models.freezed.dart';
part 'performance_models.g.dart';

/// API_CONTRACT §2 PerformanceStats. Percentages are null when `samples == 0` (`noData`).
@freezed
abstract class PerformanceStats with _$PerformanceStats {
  const factory PerformanceStats({
    required int samples,
    double? uptime,
    double? downtime,
    double? offline,
    double? closed,
    double? cashJam,
    required bool noData,
  }) = _PerformanceStats;

  factory PerformanceStats.fromJson(Map<String, dynamic> json) => _$PerformanceStatsFromJson(json);
}

/// openapi `TerminalSummary`: the terminal block of performance responses.
@freezed
abstract class TerminalSummary with _$TerminalSummary {
  const factory TerminalSummary({
    required String terminalId,
    String? location,
    String? solId,
    String? region,
    String? state,
    String? brand,
  }) = _TerminalSummary;

  factory TerminalSummary.fromJson(Map<String, dynamic> json) => _$TerminalSummaryFromJson(json);
}

/// One day of `GET /terminals/{id}/performance` (`date` + PerformanceStats fields, flat on the wire).
@freezed
abstract class DailyPerformance with _$DailyPerformance {
  const factory DailyPerformance({required DateTime date, required PerformanceStats stats}) =
      _DailyPerformance;

  factory DailyPerformance.fromJson(Json json) =>
      DailyPerformance(date: DateTime.parse(json['date'] as String), stats: PerformanceStats.fromJson(json));
}

/// `GET /terminals/{id}/performance?from&to` → data. [days] has one entry per date in the range.
@freezed
abstract class PerformanceReport with _$PerformanceReport {
  const factory PerformanceReport({
    required TerminalSummary terminal,
    required DateTime from,
    required DateTime to,
    required List<DailyPerformance> days,
    required PerformanceStats totals,
  }) = _PerformanceReport;

  factory PerformanceReport.fromJson(Json json) => PerformanceReport(
    terminal: TerminalSummary.fromJson(json['terminal'] as Json),
    from: DateTime.parse(json['from'] as String),
    to: DateTime.parse(json['to'] as String),
    days: (json['days'] as List).cast<Json>().map(DailyPerformance.fromJson).toList(),
    totals: PerformanceStats.fromJson(json['totals'] as Json),
  );
}

/// One row of `GET /performance/realtime` (TerminalSummary + PerformanceStats fields, flat on the wire).
@freezed
abstract class RealtimeRecord with _$RealtimeRecord {
  const factory RealtimeRecord({required TerminalSummary terminal, required PerformanceStats stats}) =
      _RealtimeRecord;

  factory RealtimeRecord.fromJson(Json json) =>
      RealtimeRecord(terminal: TerminalSummary.fromJson(json), stats: PerformanceStats.fromJson(json));
}

/// `meta.summary` of the realtime list.
@freezed
abstract class RealtimeSummary with _$RealtimeSummary {
  const factory RealtimeSummary({
    required DateTime date,
    double? averageUptime,
    required int belowThreshold,
    required int threshold,
  }) = _RealtimeSummary;

  factory RealtimeSummary.fromJson(Map<String, dynamic> json) => _$RealtimeSummaryFromJson(json);
}

/// A page of the realtime list with its summary.
class RealtimePage extends Paged<RealtimeRecord> {
  const RealtimePage({required super.items, required super.meta, required this.summary});

  factory RealtimePage.fromEnvelope(Envelope envelope) {
    final page = Paged.fromEnvelope(envelope, RealtimeRecord.fromJson);
    return RealtimePage(
      items: page.items,
      meta: page.meta,
      summary: RealtimeSummary.fromJson(envelope.requireMeta['summary'] as Json),
    );
  }

  final RealtimeSummary summary;
}

enum RealtimeSort {
  uptime,
  downtime,
  @JsonValue('terminal_id')
  terminalId;

  String get key => this == terminalId ? 'terminal_id' : name;
}

/// Query for `GET /performance/realtime`. Default order `asc` = worst first.
@freezed
abstract class RealtimeQuery with _$RealtimeQuery {
  const factory RealtimeQuery({
    DateTime? date,
    String? region,
    String? search,
    @Default(RealtimeSort.uptime) RealtimeSort sort,
    @Default(true) bool ascending,
    @Default(20) int perPage,
  }) = _RealtimeQuery;

  const RealtimeQuery._();

  Map<String, Object?> toQueryParameters({int page = 1}) => {
    'date': date == null ? null : _date(date!),
    'region': region == null || region == 'All' ? null : region,
    'search': search?.trim(),
    'sort': sort.key,
    'order': ascending ? 'asc' : 'desc',
    'page': page,
    'per_page': perPage,
  };
}

/// `YYYY-MM-DD` for query parameters.
String _date(DateTime d) =>
    '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

/// Formats a calendar date for the API (`YYYY-MM-DD`).
String apiDate(DateTime d) => _date(d);
