// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_promo_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PatchedPromoCode _$PatchedPromoCodeFromJson(Map<String, dynamic> json) =>
    _PatchedPromoCode(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
      discountPercent: (json['discount_percent'] as num?)?.toDouble(),
      validFrom: json['valid_from'] == null
          ? null
          : DateTime.parse(json['valid_from'] as String),
      validUntil: json['valid_until'] == null
          ? null
          : DateTime.parse(json['valid_until'] as String),
      isActive: json['is_active'] as bool?,
    );

Map<String, dynamic> _$PatchedPromoCodeToJson(_PatchedPromoCode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'discount_percent': instance.discountPercent,
      'valid_from': instance.validFrom?.toIso8601String(),
      'valid_until': instance.validUntil?.toIso8601String(),
      'is_active': instance.isActive,
    };
