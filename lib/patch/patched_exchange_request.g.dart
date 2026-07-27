// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_exchange_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PatchedExchangeRequest _$PatchedExchangeRequestFromJson(
  Map<String, dynamic> json,
) => _PatchedExchangeRequest(
  id: (json['id'] as num?)?.toInt(),
  orderId: (json['order_id'] as num?)?.toInt(),
  reason: json['reason'] as String?,
  requestedAt: json['requested_at'] == null
      ? null
      : DateTime.parse(json['requested_at'] as String),
  exchangeStatus: json['exchange_status'] as String?,
  replacement: json['replacement'] as String?,
);

Map<String, dynamic> _$PatchedExchangeRequestToJson(
  _PatchedExchangeRequest instance,
) => <String, dynamic>{
  'id': instance.id,
  'order_id': instance.orderId,
  'reason': instance.reason,
  'requested_at': instance.requestedAt?.toIso8601String(),
  'exchange_status': instance.exchangeStatus,
  'replacement': instance.replacement,
};
