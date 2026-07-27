// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_stock_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PatchedStockAlert _$PatchedStockAlertFromJson(Map<String, dynamic> json) =>
    _PatchedStockAlert(
      id: (json['id'] as num?)?.toInt(),
      product: (json['product'] as num?)?.toInt(),
      threshold: (json['threshold'] as num?)?.toInt(),
      isActive: json['is_active'] as bool?,
      warehouse: (json['warehouse'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$PatchedStockAlertToJson(_PatchedStockAlert instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'threshold': instance.threshold,
      'is_active': instance.isActive,
      'warehouse': instance.warehouse,
      'message': instance.message,
    };
