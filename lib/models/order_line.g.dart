// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderLineImpl _$$OrderLineImplFromJson(Map<String, dynamic> json) =>
    _$OrderLineImpl(
      id: (json['id'] as num).toInt(),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: const StringToDoubleConverter().fromJson(json['unit_price']),
    );

Map<String, dynamic> _$$OrderLineImplToJson(_$OrderLineImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'quantity': instance.quantity,
      'unit_price': _$JsonConverterToJson<dynamic, double>(
          instance.unitPrice, const StringToDoubleConverter().toJson),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
