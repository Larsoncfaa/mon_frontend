// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_stock_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PatchedStockLevel _$PatchedStockLevelFromJson(Map<String, dynamic> json) =>
    _PatchedStockLevel(
      id: (json['id'] as num?)?.toInt(),
      productId: (json['product_id'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      threshold: (json['threshold'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PatchedStockLevelToJson(_PatchedStockLevel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'quantity': instance.quantity,
      'threshold': instance.threshold,
    };
