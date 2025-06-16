// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SelectionImpl _$$SelectionImplFromJson(Map<String, dynamic> json) =>
    _$SelectionImpl(
      id: (json['id'] as num).toInt(),
      product: (json['product'] as num).toInt(),
      image: json['image'] as String?,
      quantity: (json['quantity'] as num).toInt(),
      name: json['name'] as String,
      sellingPrice: json['selling_price'] as String,
      description: json['description'] as String?,
      expirationDate: json['expiration_date'] == null
          ? null
          : DateTime.parse(json['expiration_date'] as String),
      category: json['category'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$SelectionImplToJson(_$SelectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'image': instance.image,
      'quantity': instance.quantity,
      'name': instance.name,
      'selling_price': instance.sellingPrice,
      'description': instance.description,
      'expiration_date': instance.expirationDate?.toIso8601String(),
      'category': instance.category,
      'created_at': instance.createdAt?.toIso8601String(),
    };
