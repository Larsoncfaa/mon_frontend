// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_line_write.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderLineWriteImpl _$$OrderLineWriteImplFromJson(Map<String, dynamic> json) =>
    _$OrderLineWriteImpl(
      product: (json['product'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: (json['unit_price'] as num).toDouble(),
    );

Map<String, dynamic> _$$OrderLineWriteImplToJson(
        _$OrderLineWriteImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      'unit_price': instance.unitPrice,
    };
