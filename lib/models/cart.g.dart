// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Cart _$CartFromJson(Map<String, dynamic> json) => _Cart(
  id: (json['id'] as num).toInt(),
  items: (json['items'] as List<dynamic>)
      .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalPrice: (json['total_price'] as num).toDouble(),
  itemCount: (json['item_count'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$CartToJson(_Cart instance) => <String, dynamic>{
  'id': instance.id,
  'items': instance.items,
  'total_price': instance.totalPrice,
  'item_count': instance.itemCount,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
