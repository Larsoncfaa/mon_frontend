// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_predict.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SalesPredict _$SalesPredictFromJson(Map<String, dynamic> json) =>
    _SalesPredict(
      productId: (json['product_id'] as num).toInt(),
      period: json['period'] as String,
      predictedSales: (json['predicted_sales'] as num).toDouble(),
    );

Map<String, dynamic> _$SalesPredictToJson(_SalesPredict instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'period': instance.period,
      'predicted_sales': instance.predictedSales,
    };
