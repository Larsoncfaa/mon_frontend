// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockLevel _$StockLevelFromJson(Map<String, dynamic> json) => _StockLevel(
  id: (json['id'] as num).toInt(),
  productId: (json['product_id'] as num).toInt(),
  product: Product.fromJson(json['product'] as Map<String, dynamic>),
  quantity: (json['quantity'] as num).toInt(),
);

Map<String, dynamic> _$StockLevelToJson(_StockLevel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'product': instance.product,
      'quantity': instance.quantity,
    };
