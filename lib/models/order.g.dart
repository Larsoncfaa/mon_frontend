// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: (json['id'] as num).toInt(),
      client: ClientProfile.fromJson(json['client'] as Map<String, dynamic>),
      dateOrdered: DateTime.parse(json['date_ordered'] as String),
      orderStatus:
          $enumDecodeNullable(_$OrderStatusEnumEnumMap, json['order_status']),
      total: const StringToDoubleConverter().fromJson(json['total']),
      lines: (json['lignes_commandes'] as List<dynamic>?)
              ?.map((e) => OrderLine.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'client': instance.client,
      'date_ordered': instance.dateOrdered.toIso8601String(),
      'order_status': _$OrderStatusEnumEnumMap[instance.orderStatus],
      'total': const StringToDoubleConverter().toJson(instance.total),
      'lignes_commandes': instance.lines,
    };

const _$OrderStatusEnumEnumMap = {
  OrderStatusEnum.pending: 'PENDING',
  OrderStatusEnum.enCours: 'EN_COURS',
  OrderStatusEnum.delivered: 'DELIVERED',
  OrderStatusEnum.cancelled: 'CANCELLED',
};
