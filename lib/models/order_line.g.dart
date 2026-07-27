// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderLine _$OrderLineFromJson(Map<String, dynamic> json) => _OrderLine(
  id: (json['id'] as num).toInt(),
  product: Product.fromJson(json['product'] as Map<String, dynamic>),
  quantity: (json['quantity'] as num).toInt(),
  unitPrice: (json['unit_price'] as num).toDouble(),
);

Map<String, dynamic> _$OrderLineToJson(_OrderLine instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'quantity': instance.quantity,
      'unit_price': instance.unitPrice,
    };
