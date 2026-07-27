// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_predict.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeliveryPredict _$DeliveryPredictFromJson(Map<String, dynamic> json) =>
    _DeliveryPredict(
      productId: (json['product_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      prediction: json['prediction'] as String,
    );

Map<String, dynamic> _$DeliveryPredictToJson(_DeliveryPredict instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'quantity': instance.quantity,
      'prediction': instance.prediction,
    };
