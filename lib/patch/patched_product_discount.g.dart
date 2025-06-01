// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_product_discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatchedProductDiscountImpl _$$PatchedProductDiscountImplFromJson(
        Map<String, dynamic> json) =>
    _$PatchedProductDiscountImpl(
      id: (json['id'] as num?)?.toInt(),
      product: (json['product'] as num?)?.toInt(),
      discountPercent: (json['discount_percent'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$PatchedProductDiscountImplToJson(
        _$PatchedProductDiscountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'discount_percent': instance.discountPercent,
    };
