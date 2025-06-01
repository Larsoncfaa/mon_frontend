// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StockLevelImpl _$$StockLevelImplFromJson(Map<String, dynamic> json) =>
    _$StockLevelImpl(
      id: (json['id'] as num).toInt(),
      product: (json['product'] as num).toInt(),
      warehouse: (json['warehouse'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$$StockLevelImplToJson(_$StockLevelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'warehouse': instance.warehouse,
      'quantity': instance.quantity,
    };
