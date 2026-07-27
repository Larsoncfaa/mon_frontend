// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExchangeRequest _$ExchangeRequestFromJson(Map<String, dynamic> json) =>
    _ExchangeRequest(
      id: (json['id'] as num).toInt(),
      orderId: (json['order_id'] as num).toInt(),
      reason: json['reason'] as String,
      requestedAt: DateTime.parse(json['requested_at'] as String),
      exchangeStatus: $enumDecode(
        _$ExchangeStatusEnumEnumMap,
        json['exchange_status'],
      ),
      replacement: json['replacement'] as String?,
    );

Map<String, dynamic> _$ExchangeRequestToJson(_ExchangeRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'reason': instance.reason,
      'requested_at': instance.requestedAt.toIso8601String(),
      'exchange_status': _$ExchangeStatusEnumEnumMap[instance.exchangeStatus]!,
      'replacement': instance.replacement,
    };

const _$ExchangeStatusEnumEnumMap = {
  ExchangeStatusEnum.pending: 'PENDING',
  ExchangeStatusEnum.completed: 'COMPLETED',
  ExchangeStatusEnum.COMPLETED: 'COMPLETED',
  ExchangeStatusEnum.PENDING: 'PENDING',
  ExchangeStatusEnum.ACCEPTED: 'ACCEPTED',
  ExchangeStatusEnum.REJECTED: 'REJECTED',
};
