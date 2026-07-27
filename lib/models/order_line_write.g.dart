// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_line_write.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderLineWrite _$OrderLineWriteFromJson(Map<String, dynamic> json) =>
    _OrderLineWrite(
      product: (json['product'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: (json['unit_price'] as num).toDouble(),
    );

Map<String, dynamic> _$OrderLineWriteToJson(_OrderLineWrite instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      'unit_price': instance.unitPrice,
    };
