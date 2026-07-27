// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductDiscount _$ProductDiscountFromJson(Map<String, dynamic> json) =>
    _ProductDiscount(
      id: (json['id'] as num).toInt(),
      product: (json['product'] as num).toInt(),
      discountPercent: (json['discount_percent'] as num).toDouble(),
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
    );

Map<String, dynamic> _$ProductDiscountToJson(_ProductDiscount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'discount_percent': instance.discountPercent,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
    };
