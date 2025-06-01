// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: (json['id'] as num).toInt(),
      category: json['category'] as String,
      image: json['image'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      quantityInStock: (json['quantity_in_stock'] as num?)?.toInt(),
      unit: $enumDecode(_$UnitEnumEnumMap, json['unit']),
      purchasePrice: (json['purchase_price'] as num).toDouble(),
      sellingPrice: (json['selling_price'] as num).toDouble(),
      expirationDate: json['expiration_date'] == null
          ? null
          : DateTime.parse(json['expiration_date'] as String),
      qrCodeImage: json['qr_code_image'] as String?,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
      'quantity_in_stock': instance.quantityInStock,
      'unit': _$UnitEnumEnumMap[instance.unit]!,
      'purchase_price': instance.purchasePrice,
      'selling_price': instance.sellingPrice,
      'expiration_date': instance.expirationDate?.toIso8601String(),
      'qr_code_image': instance.qrCodeImage,
    };

const _$UnitEnumEnumMap = {
  UnitEnum.kg: 'KG',
  UnitEnum.l: 'L',
  UnitEnum.unit: 'UNIT',
};
