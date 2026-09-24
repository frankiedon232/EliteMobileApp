// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terminal_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Terminal _$TerminalFromJson(Map<String, dynamic> json) => _Terminal(
  terminalId: json['terminal_id'] as String,
  location: json['location'] as String?,
  status: $enumDecode(_$TerminalStatusEnumMap, json['status'], unknownValue: TerminalStatus.unknown),
  amount: (json['amount'] as num?)?.toDouble(),
  cashBand: $enumDecode(_$CashBandEnumMap, json['cash_band'], unknownValue: CashBand.unknown),
  locationType: json['location_type'] as String?,
  brand: json['brand'] as String?,
  state: json['state'] as String?,
  region: json['region'] as String?,
  solId: json['sol_id'] as String?,
  lastTxnAt: json['last_txn_at'] == null ? null : DateTime.parse(json['last_txn_at'] as String),
  cardReader: json['card_reader'] as String?,
  cashJam: json['cash_jam'] as String?,
  hasCashJam: json['has_cash_jam'] as bool,
  isIdle: json['is_idle'] as bool,
  isOfInterest: json['is_of_interest'] as bool,
);

Map<String, dynamic> _$TerminalToJson(_Terminal instance) => <String, dynamic>{
  'terminal_id': instance.terminalId,
  'location': instance.location,
  'status': _$TerminalStatusEnumMap[instance.status]!,
  'amount': instance.amount,
  'cash_band': _$CashBandEnumMap[instance.cashBand]!,
  'location_type': instance.locationType,
  'brand': instance.brand,
  'state': instance.state,
  'region': instance.region,
  'sol_id': instance.solId,
  'last_txn_at': instance.lastTxnAt?.toIso8601String(),
  'card_reader': instance.cardReader,
  'cash_jam': instance.cashJam,
  'has_cash_jam': instance.hasCashJam,
  'is_idle': instance.isIdle,
  'is_of_interest': instance.isOfInterest,
};

const _$TerminalStatusEnumMap = {
  TerminalStatus.active: 'ACTIVE',
  TerminalStatus.offline: 'OFFLINE',
  TerminalStatus.close: 'CLOSE',
  TerminalStatus.supervisor: 'SUPERVISOR',
  TerminalStatus.unknown: 'UNKNOWN',
};

const _$CashBandEnumMap = {
  CashBand.noCash: 'no_cash',
  CashBand.low: 'low',
  CashBand.moderate: 'moderate',
  CashBand.high: 'high',
  CashBand.abnormal: 'abnormal',
  CashBand.unknown: 'unknown',
};

_BackedOutTerminal _$BackedOutTerminalFromJson(Map<String, dynamic> json) => _BackedOutTerminal(
  terminal: Terminal.fromJson(json['terminal'] as Map<String, dynamic>),
  backedOutDurationSeconds: (json['backed_out_duration_seconds'] as num?)?.toInt(),
);

Map<String, dynamic> _$BackedOutTerminalToJson(_BackedOutTerminal instance) => <String, dynamic>{
  'terminal': instance.terminal.toJson(),
  'backed_out_duration_seconds': instance.backedOutDurationSeconds,
};

_TerminalInfo _$TerminalInfoFromJson(Map<String, dynamic> json) => _TerminalInfo(
  terminal: Terminal.fromJson(json['terminal'] as Map<String, dynamic>),
  address: json['address'] as String?,
  branchCode: json['branch_code'] as String?,
  branchName: json['branch_name'] as String?,
  country: json['country'] as String?,
);

Map<String, dynamic> _$TerminalInfoToJson(_TerminalInfo instance) => <String, dynamic>{
  'terminal': instance.terminal.toJson(),
  'address': instance.address,
  'branch_code': instance.branchCode,
  'branch_name': instance.branchName,
  'country': instance.country,
};

_TerminalDetail _$TerminalDetailFromJson(Map<String, dynamic> json) => _TerminalDetail(
  info: TerminalInfo.fromJson(json['info'] as Map<String, dynamic>),
  performanceToday: PerformanceStats.fromJson(json['performance_today'] as Map<String, dynamic>),
  asAt: DateTime.parse(json['as_at'] as String),
);

Map<String, dynamic> _$TerminalDetailToJson(_TerminalDetail instance) => <String, dynamic>{
  'info': instance.info.toJson(),
  'performance_today': instance.performanceToday.toJson(),
  'as_at': instance.asAt.toIso8601String(),
};

_FacetValue _$FacetValueFromJson(Map<String, dynamic> json) =>
    _FacetValue(value: json['value'] as String, count: (json['count'] as num).toInt());

Map<String, dynamic> _$FacetValueToJson(_FacetValue instance) => <String, dynamic>{
  'value': instance.value,
  'count': instance.count,
};

_TerminalFacets _$TerminalFacetsFromJson(Map<String, dynamic> json) => _TerminalFacets(
  state:
      (json['state'] as List<dynamic>?)
          ?.map((e) => FacetValue.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <FacetValue>[],
  brand:
      (json['brand'] as List<dynamic>?)
          ?.map((e) => FacetValue.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <FacetValue>[],
  locationType:
      (json['location_type'] as List<dynamic>?)
          ?.map((e) => FacetValue.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <FacetValue>[],
  region:
      (json['region'] as List<dynamic>?)
          ?.map((e) => FacetValue.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <FacetValue>[],
  status:
      (json['status'] as List<dynamic>?)
          ?.map((e) => FacetValue.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <FacetValue>[],
);

Map<String, dynamic> _$TerminalFacetsToJson(_TerminalFacets instance) => <String, dynamic>{
  'state': instance.state.map((e) => e.toJson()).toList(),
  'brand': instance.brand.map((e) => e.toJson()).toList(),
  'location_type': instance.locationType.map((e) => e.toJson()).toList(),
  'region': instance.region.map((e) => e.toJson()).toList(),
  'status': instance.status.map((e) => e.toJson()).toList(),
};
