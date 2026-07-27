// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartItem _$CartItemFromJson(Map<String, dynamic> json) => _CartItem(
  id: (json['id'] as num?)?.toInt(),
  productId: (json['productId'] as num?)?.toInt(),
  product: Product.fromJson(json['product'] as Map<String, dynamic>),
  quantity: (json['quantity'] as num?)?.toInt(),
  totalPrice: (json['totalPrice'] as num?)?.toDouble(),
);

Map<String, dynamic> _$CartItemToJson(_CartItem instance) => <String, dynamic>{
  'id': instance.id,
  'productId': instance.productId,
  'product': instance.product,
  'quantity': instance.quantity,
  'totalPrice': instance.totalPrice,
};
