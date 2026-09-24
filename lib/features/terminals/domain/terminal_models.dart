import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/network/envelope.dart';
import '../../../core/network/paged.dart';
import '../../performance/domain/performance_models.dart';
import '../../reference/domain/reference_models.dart';

part 'terminal_models.freezed.dart';
part 'terminal_models.g.dart';

enum TerminalStatus {
  @JsonValue('ACTIVE')
  active,
  @JsonValue('OFFLINE')
  offline,
  @JsonValue('CLOSE')
  close,
  @JsonValue('SUPERVISOR')
  supervisor,
  @JsonValue('UNKNOWN')
  unknown;

  /// The wire value (`ACTIVE`, `CLOSE`, …) used by `status[]`.
  String get key => name.toUpperCase();
}

enum CashBand {
  @JsonValue('no_cash')
  noCash,
  low,
  moderate,
  high,
  abnormal,
  unknown,
}

/// API_CONTRACT §2 Terminal.
@freezed
abstract class Terminal with _$Terminal {
  const factory Terminal({
    required String terminalId,
    String? location,
    @JsonKey(unknownEnumValue: TerminalStatus.unknown) required TerminalStatus status,

    /// Naira; null if unknown.
    double? amount,
    @JsonKey(unknownEnumValue: CashBand.unknown) required CashBand cashBand,
    String? locationType,
    String? brand,
    String? state,
    String? region,
    String? solId,
    DateTime? lastTxnAt,
    String? cardReader,

    /// Raw monitoring text, e.g. "No Cash Jams" or "Cash Jam: Please clear cash ASAP".
    String? cashJam,
    required bool hasCashJam,
    required bool isIdle,
    required bool isOfInterest,
  }) = _Terminal;

  factory Terminal.fromJson(Map<String, dynamic> json) => _$TerminalFromJson(json);
}

/// `GET /terminals/backed-out` item: Terminal fields plus `backed_out_duration_seconds` (flat on the wire).
@freezed
abstract class BackedOutTerminal with _$BackedOutTerminal {
  const factory BackedOutTerminal({required Terminal terminal, int? backedOutDurationSeconds}) =
      _BackedOutTerminal;

  const BackedOutTerminal._();

  factory BackedOutTerminal.fromJson(Json json) => BackedOutTerminal(
    terminal: Terminal.fromJson(json),
    backedOutDurationSeconds: (json['backed_out_duration_seconds'] as num?)?.toInt(),
  );

  Duration? get backedOutFor =>
      backedOutDurationSeconds == null ? null : Duration(seconds: backedOutDurationSeconds!);
}

/// `GET /terminals/{id}` → data.terminal: Terminal fields plus address/branch/country (flat on the wire).
@freezed
abstract class TerminalInfo with _$TerminalInfo {
  const factory TerminalInfo({
    required Terminal terminal,
    String? address,
    String? branchCode,
    String? branchName,
    String? country,
  }) = _TerminalInfo;

  factory TerminalInfo.fromJson(Json json) => TerminalInfo(
    terminal: Terminal.fromJson(json),
    address: json['address'] as String?,
    branchCode: json['branch_code'] as String?,
    branchName: json['branch_name'] as String?,
    country: json['country'] as String?,
  );
}

/// `GET /terminals/{id}` → data.
@freezed
abstract class TerminalDetail with _$TerminalDetail {
  const factory TerminalDetail({
    required TerminalInfo info,
    required PerformanceStats performanceToday,
    required DateTime asAt,
  }) = _TerminalDetail;

  factory TerminalDetail.fromJson(Json json) => TerminalDetail(
    info: TerminalInfo.fromJson(json['terminal'] as Json),
    performanceToday: PerformanceStats.fromJson(json['performance_today'] as Json),
    asAt: DateTime.parse(json['as_at'] as String),
  );
}

@freezed
abstract class FacetValue with _$FacetValue {
  const factory FacetValue({required String value, required int count}) = _FacetValue;

  factory FacetValue.fromJson(Map<String, dynamic> json) => _$FacetValueFromJson(json);
}

/// `meta.facets` (with `include=facets`): counts for the current filter + search.
@freezed
abstract class TerminalFacets with _$TerminalFacets {
  const factory TerminalFacets({
    @Default(<FacetValue>[]) List<FacetValue> state,
    @Default(<FacetValue>[]) List<FacetValue> brand,
    @Default(<FacetValue>[]) List<FacetValue> locationType,
    @Default(<FacetValue>[]) List<FacetValue> region,
    @Default(<FacetValue>[]) List<FacetValue> status,
  }) = _TerminalFacets;

  factory TerminalFacets.fromJson(Map<String, dynamic> json) => _$TerminalFacetsFromJson(json);
}

/// A page of terminals (or backed-out terminals) with optional facets.
class TerminalPage<T> extends Paged<T> {
  const TerminalPage({required super.items, required super.meta, this.facets});

  factory TerminalPage.fromEnvelope(Envelope envelope, T Function(Json json) fromJson) {
    final page = Paged.fromEnvelope(envelope, fromJson);
    final facets = envelope.requireMeta['facets'];
    return TerminalPage(
      items: page.items,
      meta: page.meta,
      facets: facets is Json ? TerminalFacets.fromJson(facets) : null,
    );
  }

  final TerminalFacets? facets;
}

enum TerminalSort {
  @JsonValue('terminal_id')
  terminalId,
  location,
  amount,
  @JsonValue('last_txn_at')
  lastTxnAt,
  status;

  String get key => switch (this) {
    terminalId => 'terminal_id',
    lastTxnAt => 'last_txn_at',
    _ => name,
  };
}

/// Everything that defines a terminal list request except the page number. Used as the provider
/// family key: changing any field resets paging.
@freezed
abstract class TerminalQuery with _$TerminalQuery {
  const factory TerminalQuery({
    @Default(TerminalFilter.all) TerminalFilter filter,
    String? region,
    @Default(<String>[]) List<String> states,
    @Default(<String>[]) List<String> brands,
    @Default(<String>[]) List<String> locationTypes,
    @Default(<TerminalStatus>[]) List<TerminalStatus> statuses,
    String? search,
    int? minAmount,
    int? maxAmount,
    int? idleHours,
    @Default(TerminalSort.terminalId) TerminalSort sort,
    @Default(true) bool ascending,
    @Default(20) int perPage,
    @Default(false) bool includeFacets,
  }) = _TerminalQuery;

  const TerminalQuery._();

  /// Number of facet selections (for the "Filters (n)" badge). Filter, region and search excluded.
  int get activeFacetCount =>
      states.length +
      brands.length +
      locationTypes.length +
      statuses.length +
      (minAmount != null || maxAmount != null ? 1 : 0) +
      (idleHours != null ? 1 : 0);

  /// Query parameters for `/terminals`, `/terminals/export`, `/of-interest`, `/backed-out`.
  /// Pass [page] = null for the export (no paging).
  Map<String, Object?> toQueryParameters({int? page = 1}) => {
    'filter': filter.key,
    'region': region == null || region == 'All' ? null : region,
    'state[]': states,
    'brand[]': brands,
    'location_type[]': locationTypes,
    'status[]': statuses.map((s) => s.key).toList(),
    'search': search?.trim(),
    'min_amount': minAmount,
    'max_amount': maxAmount,
    'idle_hours': idleHours,
    'sort': sort.key,
    'order': ascending ? 'asc' : 'desc',
    if (page != null) ...{'page': page, 'per_page': perPage},
    if (page != null && includeFacets) 'include': 'facets',
  };
}

/// Result of `GET /terminals/export` saved to disk.
class CsvExport {
  const CsvExport({required this.filePath, required this.totalCount, required this.truncated});

  final String filePath;

  /// `X-Total-Count`: matching rows (may exceed the rows in the file when [truncated]).
  final int? totalCount;

  /// `X-Export-Truncated`: more than 10,000 rows matched.
  final bool truncated;
}
