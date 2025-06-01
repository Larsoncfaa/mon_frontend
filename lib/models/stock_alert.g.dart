// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StockAlertImpl _$$StockAlertImplFromJson(Map<String, dynamic> json) =>
    _$StockAlertImpl(
      id: (json['id'] as num).toInt(),
      product: (json['product'] as num).toInt(),
      threshold: (json['threshold'] as num).toInt(),
      isActive: json['is_active'] as bool?,
    );

Map<String, dynamic> _$$StockAlertImplToJson(_$StockAlertImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'threshold': instance.threshold,
      'is_active': instance.isActive,
    };
