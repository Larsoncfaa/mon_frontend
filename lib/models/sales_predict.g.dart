// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_predict.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesPredictImpl _$$SalesPredictImplFromJson(Map<String, dynamic> json) =>
    _$SalesPredictImpl(
      productId: (json['product_id'] as num).toInt(),
      period: json['period'] as String,
      predictedSales: (json['predicted_sales'] as num).toInt(),
    );

Map<String, dynamic> _$$SalesPredictImplToJson(_$SalesPredictImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'period': instance.period,
      'predicted_sales': instance.predictedSales,
    };
