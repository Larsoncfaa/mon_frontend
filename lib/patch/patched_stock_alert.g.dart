// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_stock_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatchedStockAlertImpl _$$PatchedStockAlertImplFromJson(
        Map<String, dynamic> json) =>
    _$PatchedStockAlertImpl(
      product: (json['product'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$PatchedStockAlertImplToJson(
        _$PatchedStockAlertImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      'message': instance.message,
    };
