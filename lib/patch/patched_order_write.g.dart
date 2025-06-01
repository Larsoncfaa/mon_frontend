// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_order_write.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatchedOrderWriteImpl _$$PatchedOrderWriteImplFromJson(
        Map<String, dynamic> json) =>
    _$PatchedOrderWriteImpl(
      product: (json['product'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      customer: (json['customer'] as num?)?.toInt(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$PatchedOrderWriteImplToJson(
        _$PatchedOrderWriteImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      'price': instance.price,
      'customer': instance.customer,
      'status': instance.status,
    };
