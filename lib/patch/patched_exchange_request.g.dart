// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_exchange_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatchedExchangeRequestImpl _$$PatchedExchangeRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$PatchedExchangeRequestImpl(
      id: (json['id'] as num?)?.toInt(),
      returnRequest: (json['return_request'] as num?)?.toInt(),
      replacement: (json['replacement'] as num?)?.toInt(),
      exchangeStatus: $enumDecodeNullable(
          _$ExchangeStatusEnumEnumMap, json['exchange_status']),
    );

Map<String, dynamic> _$$PatchedExchangeRequestImplToJson(
        _$PatchedExchangeRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'return_request': instance.returnRequest,
      'replacement': instance.replacement,
      'exchange_status': _$ExchangeStatusEnumEnumMap[instance.exchangeStatus],
    };

const _$ExchangeStatusEnumEnumMap = {
  ExchangeStatusEnum.pending: 'PENDING',
  ExchangeStatusEnum.completed: 'COMPLETED',
  ExchangeStatusEnum.COMPLETED: 'COMPLETED',
  ExchangeStatusEnum.PENDING: 'PENDING',
  ExchangeStatusEnum.ACCEPTED: 'ACCEPTED',
  ExchangeStatusEnum.REJECTED: 'REJECTED',
};
