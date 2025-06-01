// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromoCodeImpl _$$PromoCodeImplFromJson(Map<String, dynamic> json) =>
    _$PromoCodeImpl(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      discountPercent: (json['discount_percent'] as num).toDouble(),
      validFrom: DateTime.parse(json['valid_from'] as String),
      validTo: DateTime.parse(json['valid_to'] as String),
      usageLimit: (json['usage_limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PromoCodeImplToJson(_$PromoCodeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'discount_percent': instance.discountPercent,
      'valid_from': instance.validFrom.toIso8601String(),
      'valid_to': instance.validTo.toIso8601String(),
      'usage_limit': instance.usageLimit,
    };
