// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_predict.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InventoryPredictImpl _$$InventoryPredictImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryPredictImpl(
      productId: (json['product_id'] as num).toInt(),
      days: (json['days'] as num).toInt(),
      predictedInventory: (json['predicted_inventory'] as num).toInt(),
    );

Map<String, dynamic> _$$InventoryPredictImplToJson(
        _$InventoryPredictImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'days': instance.days,
      'predicted_inventory': instance.predictedInventory,
    };
