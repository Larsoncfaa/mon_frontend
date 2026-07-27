// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SalesInput _$SalesInputFromJson(Map<String, dynamic> json) => _SalesInput(
  productId: (json['product_id'] as num).toInt(),
  historyDays: (json['history_days'] as num).toInt(),
  forecastDays: (json['forecast_days'] as num).toInt(),
);

Map<String, dynamic> _$SalesInputToJson(_SalesInput instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'history_days': instance.historyDays,
      'forecast_days': instance.forecastDays,
    };
