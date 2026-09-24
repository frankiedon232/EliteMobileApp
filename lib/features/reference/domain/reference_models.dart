import 'package:freezed_annotation/freezed_annotation.dart';

part 'reference_models.freezed.dart';
part 'reference_models.g.dart';

/// `GET /config` → data (no auth).
@freezed
abstract class RemoteConfig with _$RemoteConfig {
  const factory RemoteConfig({
    required String minAppVersion,
    required String latestAppVersion,
    required SupportContact support,
    required CashThresholds cashThresholds,
    required int idleDays,
    required int performanceReportMaxDays,
    required DateTime serverTime,
  }) = _RemoteConfig;

  factory RemoteConfig.fromJson(Map<String, dynamic> json) => _$RemoteConfigFromJson(json);
}

@freezed
abstract class SupportContact with _$SupportContact {
  const factory SupportContact({String? email, String? phone}) = _SupportContact;

  factory SupportContact.fromJson(Map<String, dynamic> json) => _$SupportContactFromJson(json);
}

@freezed
abstract class CashThresholds with _$CashThresholds {
  const factory CashThresholds({
    required int noCash,
    required AmountRange low,
    required AmountRange moderate,
    required AmountRange high,
  }) = _CashThresholds;

  factory CashThresholds.fromJson(Map<String, dynamic> json) => _$CashThresholdsFromJson(json);
}

@freezed
abstract class AmountRange with _$AmountRange {
  const factory AmountRange({required int min, required int max}) = _AmountRange;

  factory AmountRange.fromJson(Map<String, dynamic> json) => _$AmountRangeFromJson(json);
}

/// `GET /regions` item. `All` = everything inside the user's scope.
@freezed
abstract class RegionOption with _$RegionOption {
  const factory RegionOption({required String value, required String label}) = _RegionOption;

  const RegionOption._();

  factory RegionOption.fromJson(Map<String, dynamic> json) => _$RegionOptionFromJson(json);

  static const all = RegionOption(value: 'All', label: 'All regions');

  bool get isAll => value == 'All';
}

/// v1 filter keys (openapi `FilterKey`). Also used by push deep links: `/terminals?filter=<key>`.
enum TerminalFilter {
  all,
  idle,
  online,
  offline,
  closed,
  supervisor,
  @JsonValue('cash_jam')
  cashJam,
  @JsonValue('no_cash')
  noCash,
  @JsonValue('low_cash')
  lowCash,
  @JsonValue('moderate_cash')
  moderateCash,
  @JsonValue('high_cash')
  highCash;

  /// The wire value (`no_cash`, …).
  String get key => switch (this) {
    cashJam => 'cash_jam',
    noCash => 'no_cash',
    lowCash => 'low_cash',
    moderateCash => 'moderate_cash',
    highCash => 'high_cash',
    _ => name,
  };

  /// Parses a wire key; unknown or missing → [all].
  static TerminalFilter fromKey(String? key) =>
      values.firstWhere((f) => f.key == key?.trim().toLowerCase(), orElse: () => all);
}

/// `GET /filters` item.
@freezed
abstract class FilterOption with _$FilterOption {
  const factory FilterOption({
    @JsonKey(unknownEnumValue: TerminalFilter.all) required TerminalFilter key,
    required String label,
  }) = _FilterOption;

  factory FilterOption.fromJson(Map<String, dynamic> json) => _$FilterOptionFromJson(json);
}
