// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InventoryInputImpl _$$InventoryInputImplFromJson(Map<String, dynamic> json) =>
    _$InventoryInputImpl(
      productId: (json['product_id'] as num).toInt(),
      windowDays: (json['window_days'] as num?)?.toInt() ?? 30,
    );

Map<String, dynamic> _$$InventoryInputImplToJson(
        _$InventoryInputImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'window_days': instance.windowDays,
    };
