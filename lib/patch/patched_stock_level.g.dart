// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_stock_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatchedStockLevelImpl _$$PatchedStockLevelImplFromJson(
        Map<String, dynamic> json) =>
    _$PatchedStockLevelImpl(
      productId: (json['productId'] as num?)?.toInt(),
      warehouseId: (json['warehouseId'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toDouble(),
      threshold: (json['threshold'] as num?)?.toDouble(),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PatchedStockLevelImplToJson(
        _$PatchedStockLevelImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'warehouseId': instance.warehouseId,
      'quantity': instance.quantity,
      'threshold': instance.threshold,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
