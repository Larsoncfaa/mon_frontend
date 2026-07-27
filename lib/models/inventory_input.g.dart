// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InventoryInput _$InventoryInputFromJson(Map<String, dynamic> json) =>
    _InventoryInput(
      productId: (json['product_id'] as num).toInt(),
      windowDays: (json['window_days'] as num).toInt(),
    );

Map<String, dynamic> _$InventoryInputToJson(_InventoryInput instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'window_days': instance.windowDays,
    };
