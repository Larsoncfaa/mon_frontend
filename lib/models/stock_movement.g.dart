// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_movement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StockMovementImpl _$$StockMovementImplFromJson(Map<String, dynamic> json) =>
    _$StockMovementImpl(
      id: (json['id'] as num).toInt(),
      product: (json['product'] as num).toInt(),
      warehouse: (json['warehouse'] as num).toInt(),
      batch: (json['batch'] as num?)?.toInt(),
      movementType:
          $enumDecode(_$MovementTypeEnumEnumMap, json['movement_type']),
      quantity: (json['quantity'] as num).toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      user: (json['user'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$StockMovementImplToJson(_$StockMovementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'warehouse': instance.warehouse,
      'batch': instance.batch,
      'movement_type': _$MovementTypeEnumEnumMap[instance.movementType]!,
      'quantity': instance.quantity,
      'timestamp': instance.timestamp.toIso8601String(),
      'user': instance.user,
    };

const _$MovementTypeEnumEnumMap = {
  MovementTypeEnum.in_: 'IN',
  MovementTypeEnum.out: 'OUT',
};
