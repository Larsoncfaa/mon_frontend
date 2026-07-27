// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_stock_movement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PatchedStockMovement _$PatchedStockMovementFromJson(
  Map<String, dynamic> json,
) => _PatchedStockMovement(
  id: (json['id'] as num?)?.toInt(),
  productId: (json['product_id'] as num?)?.toInt(),
  warehouse: (json['warehouse'] as num?)?.toInt(),
  movementType: json['movement_type'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  timestamp: json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String),
  destination: json['destination'] as String?,
);

Map<String, dynamic> _$PatchedStockMovementToJson(
  _PatchedStockMovement instance,
) => <String, dynamic>{
  'id': instance.id,
  'product_id': instance.productId,
  'warehouse': instance.warehouse,
  'movement_type': instance.movementType,
  'quantity': instance.quantity,
  'timestamp': instance.timestamp?.toIso8601String(),
  'destination': instance.destination,
};
