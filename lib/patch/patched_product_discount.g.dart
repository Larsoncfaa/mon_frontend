// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_product_discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PatchedProductDiscount _$PatchedProductDiscountFromJson(
  Map<String, dynamic> json,
) => _PatchedProductDiscount(
  id: (json['id'] as num?)?.toInt(),
  product: (json['product'] as num?)?.toInt(),
  discountPercent: (json['discount_percent'] as num?)?.toDouble(),
  startDate: json['start_date'] == null
      ? null
      : DateTime.parse(json['start_date'] as String),
  endDate: json['end_date'] == null
      ? null
      : DateTime.parse(json['end_date'] as String),
);

Map<String, dynamic> _$PatchedProductDiscountToJson(
  _PatchedProductDiscount instance,
) => <String, dynamic>{
  'id': instance.id,
  'product': instance.product,
  'discount_percent': instance.discountPercent,
  'start_date': instance.startDate?.toIso8601String(),
  'end_date': instance.endDate?.toIso8601String(),
};
