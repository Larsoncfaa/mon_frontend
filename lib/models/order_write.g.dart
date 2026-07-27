// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_write.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderWrite _$OrderWriteFromJson(Map<String, dynamic> json) => _OrderWrite(
  client: (json['client'] as num).toInt(),
  orderStatus: $enumDecode(_$OrderStatusEnumEnumMap, json['order_status']),
  lines: (json['lines'] as List<dynamic>)
      .map((e) => OrderLineWrite.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toDouble(),
);

Map<String, dynamic> _$OrderWriteToJson(_OrderWrite instance) =>
    <String, dynamic>{
      'client': instance.client,
      'order_status': _$OrderStatusEnumEnumMap[instance.orderStatus]!,
      'lines': instance.lines,
      'total': instance.total,
    };

const _$OrderStatusEnumEnumMap = {
  OrderStatusEnum.pending: 'PENDING',
  OrderStatusEnum.enCours: 'EN_COURS',
  OrderStatusEnum.delivered: 'DELIVERED',
  OrderStatusEnum.cancelled: 'CANCELLED',
};
