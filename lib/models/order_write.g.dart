// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_write.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderWriteImpl _$$OrderWriteImplFromJson(Map<String, dynamic> json) =>
    _$OrderWriteImpl(
      client: (json['client'] as num).toInt(),
      orderStatus:
          $enumDecodeNullable(_$OrderStatusEnumEnumMap, json['order_status']),
      total: (json['total'] as num).toDouble(),
      lines: (json['lines'] as List<dynamic>)
          .map((e) => OrderLineWrite.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderWriteImplToJson(_$OrderWriteImpl instance) =>
    <String, dynamic>{
      'client': instance.client,
      'order_status': _$OrderStatusEnumEnumMap[instance.orderStatus],
      'total': instance.total,
      'lines': instance.lines,
    };

const _$OrderStatusEnumEnumMap = {
  OrderStatusEnum.pending: 'PENDING',
  OrderStatusEnum.enCours: 'EN_COURS',
  OrderStatusEnum.delivered: 'DELIVERED',
  OrderStatusEnum.cancelled: 'CANCELLED',
};
