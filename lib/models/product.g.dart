// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: (json['id'] as num).toInt(),
  category: json['category'] as String,
  image: json['image'] as String?,
  name: json['name'] as String,
  description: json['description'] as String?,
  quantityInStock: (json['quantityInStock'] as num?)?.toInt(),
  unit: unitFromJson(json['unit'] as String),
  purchasePrice: const StringToDoubleConverter().fromJson(
    json['purchasePrice'],
  ),
  sellingPrice: const StringToDoubleConverter().fromJson(json['sellingPrice']),
  expirationDate: json['expirationDate'] == null
      ? null
      : DateTime.parse(json['expirationDate'] as String),
  qrCodeImage: json['qrCodeImage'] as String?,
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'category': instance.category,
  'image': instance.image,
  'name': instance.name,
  'description': instance.description,
  'quantityInStock': instance.quantityInStock,
  'unit': unitToJson(instance.unit),
  'purchasePrice': _$JsonConverterToJson<dynamic, double>(
    instance.purchasePrice,
    const StringToDoubleConverter().toJson,
  ),
  'sellingPrice': _$JsonConverterToJson<dynamic, double>(
    instance.sellingPrice,
    const StringToDoubleConverter().toJson,
  ),
  'expirationDate': instance.expirationDate?.toIso8601String(),
  'qrCodeImage': instance.qrCodeImage,
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
