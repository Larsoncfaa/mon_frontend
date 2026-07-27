// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockAlert _$StockAlertFromJson(Map<String, dynamic> json) => _StockAlert(
  id: (json['id'] as num).toInt(),
  product: Product.fromJson(json['product'] as Map<String, dynamic>),
  threshold: (json['threshold'] as num).toInt(),
  isActive: json['is_active'] as bool?,
  warehouse: json['warehouse'] == null
      ? null
      : Warehouse.fromJson(json['warehouse'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StockAlertToJson(_StockAlert instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'threshold': instance.threshold,
      'is_active': instance.isActive,
      'warehouse': instance.warehouse,
    };
