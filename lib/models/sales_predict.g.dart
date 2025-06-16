// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_predict.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesPredictImpl _$$SalesPredictImplFromJson(Map<String, dynamic> json) =>
    _$SalesPredictImpl(
      productId: (json['productId'] as num).toInt(),
      period: json['period'] as String,
      predictedSales: (json['predictedSales'] as num).toInt(),
    );

Map<String, dynamic> _$$SalesPredictImplToJson(_$SalesPredictImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'period': instance.period,
      'predictedSales': instance.predictedSales,
    };
