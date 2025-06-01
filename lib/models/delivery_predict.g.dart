// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_predict.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryPredictImpl _$$DeliveryPredictImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryPredictImpl(
      productId: (json['product_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      prediction: json['prediction'] as String,
    );

Map<String, dynamic> _$$DeliveryPredictImplToJson(
        _$DeliveryPredictImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'quantity': instance.quantity,
      'prediction': instance.prediction,
    };
