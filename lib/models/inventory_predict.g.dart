// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_predict.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InventoryPredict _$InventoryPredictFromJson(Map<String, dynamic> json) =>
    _InventoryPredict(
      productId: (json['product_id'] as num).toInt(),
      days: (json['days'] as num).toInt(),
      predictedInventory: (json['predicted_inventory'] as num).toDouble(),
    );

Map<String, dynamic> _$InventoryPredictToJson(_InventoryPredict instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'days': instance.days,
      'predicted_inventory': instance.predictedInventory,
    };
