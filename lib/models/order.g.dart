// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
  id: (json['id'] as num).toInt(),
  client: (json['client'] as num).toInt(),
  dateOrdered: DateTime.parse(json['date_ordered'] as String),
  orderStatus: $enumDecode(_$OrderStatusEnumEnumMap, json['order_status']),
  lines: (json['lines'] as List<dynamic>)
      .map((e) => OrderLine.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: const StringToDoubleConverter().fromJson(json['total']),
);

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
  'id': instance.id,
  'client': instance.client,
  'date_ordered': instance.dateOrdered.toIso8601String(),
  'order_status': _$OrderStatusEnumEnumMap[instance.orderStatus]!,
  'lines': instance.lines,
  'total': const StringToDoubleConverter().toJson(instance.total),
};

const _$OrderStatusEnumEnumMap = {
  OrderStatusEnum.pending: 'PENDING',
  OrderStatusEnum.enCours: 'EN_COURS',
  OrderStatusEnum.delivered: 'DELIVERED',
  OrderStatusEnum.cancelled: 'CANCELLED',
};
