// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDiscountImpl _$$ProductDiscountImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductDiscountImpl(
      id: (json['id'] as num).toInt(),
      product: (json['product'] as num).toInt(),
      discountPercent: (json['discount_percent'] as num).toDouble(),
    );

Map<String, dynamic> _$$ProductDiscountImplToJson(
        _$ProductDiscountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'discount_percent': instance.discountPercent,
    };
