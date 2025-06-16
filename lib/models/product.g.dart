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
      unit: unitFromJson(json['unit'] as String),
      purchasePrice:
          const StringToDoubleConverter().fromJson(json['purchase_price']),
      sellingPrice:
          const StringToDoubleConverter().fromJson(json['selling_price']),
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
      'unit': unitToJson(instance.unit),
      'purchase_price': _$JsonConverterToJson<dynamic, double>(
          instance.purchasePrice, const StringToDoubleConverter().toJson),
      'selling_price': _$JsonConverterToJson<dynamic, double>(
          instance.sellingPrice, const StringToDoubleConverter().toJson),
      'expiration_date': instance.expirationDate?.toIso8601String(),
      'qr_code_image': instance.qrCodeImage,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
