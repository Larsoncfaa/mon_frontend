// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExchangeRequestImpl _$$ExchangeRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ExchangeRequestImpl(
      id: (json['id'] as num).toInt(),
      returnRequest: (json['returnRequest'] as num).toInt(),
      replacement: (json['replacement'] as num).toInt(),
      requestedProduct: json['requestedProduct'] as String,
      reason: json['reason'] as String,
      exchangeStatus: $enumDecodeNullable(
          _$ExchangeStatusEnumEnumMap, json['exchangeStatus']),
    );

Map<String, dynamic> _$$ExchangeRequestImplToJson(
        _$ExchangeRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'returnRequest': instance.returnRequest,
      'replacement': instance.replacement,
      'requestedProduct': instance.requestedProduct,
      'reason': instance.reason,
      'exchangeStatus': _$ExchangeStatusEnumEnumMap[instance.exchangeStatus],
    };

const _$ExchangeStatusEnumEnumMap = {
  ExchangeStatusEnum.pending: 'PENDING',
  ExchangeStatusEnum.completed: 'COMPLETED',
  ExchangeStatusEnum.COMPLETED: 'COMPLETED',
  ExchangeStatusEnum.PENDING: 'PENDING',
  ExchangeStatusEnum.ACCEPTED: 'ACCEPTED',
  ExchangeStatusEnum.REJECTED: 'REJECTED',
};
