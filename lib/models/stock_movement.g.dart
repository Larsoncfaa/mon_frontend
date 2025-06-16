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
      stockApplied: json['stock_applied'] as bool? ?? false,
      batch: (json['batch'] as num?)?.toInt(),
      isArchived: json['is_archived'] as bool? ?? false,
      movementType: stringToMovementTypeEnum(json['movement_type'] as String),
      quantity: (json['quantity'] as num).toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      user: (json['user'] as num?)?.toInt(),
      productName: json['product_name'] as String?,
    );

Map<String, dynamic> _$$StockMovementImplToJson(_$StockMovementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'warehouse': instance.warehouse,
      'stock_applied': instance.stockApplied,
      'batch': instance.batch,
      'is_archived': instance.isArchived,
      'movement_type': movementTypeEnumToString(instance.movementType),
      'quantity': instance.quantity,
      'timestamp': instance.timestamp.toIso8601String(),
      'user': instance.user,
      'product_name': instance.productName,
    };
