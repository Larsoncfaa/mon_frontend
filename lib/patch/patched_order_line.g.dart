// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_order_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatchedOrderLineImpl _$$PatchedOrderLineImplFromJson(
        Map<String, dynamic> json) =>
    _$PatchedOrderLineImpl(
      id: (json['id'] as num?)?.toInt(),
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num?)?.toInt(),
      unitPrice: (json['unit_price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$PatchedOrderLineImplToJson(
        _$PatchedOrderLineImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'quantity': instance.quantity,
      'unit_price': instance.unitPrice,
    };
