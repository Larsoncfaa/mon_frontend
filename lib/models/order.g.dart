// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: (json['id'] as num).toInt(),
      client: ClientProfile.fromJson(json['client'] as Map<String, dynamic>),
      dateOrdered: DateTime.parse(json['dateOrdered'] as String),
      orderStatus:
          $enumDecodeNullable(_$OrderStatusEnumEnumMap, json['orderStatus']),
      total: (json['total'] as num).toDouble(),
      lines: (json['lines'] as List<dynamic>?)
              ?.map((e) => OrderLine.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'client': instance.client,
      'dateOrdered': instance.dateOrdered.toIso8601String(),
      'orderStatus': _$OrderStatusEnumEnumMap[instance.orderStatus],
      'total': instance.total,
      'lines': instance.lines,
    };

const _$OrderStatusEnumEnumMap = {
  OrderStatusEnum.pending: 'PENDING',
  OrderStatusEnum.enCours: 'EN_COURS',
  OrderStatusEnum.delivered: 'DELIVERED',
  OrderStatusEnum.cancelled: 'CANCELLED',
};
