// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeliveryInput _$DeliveryInputFromJson(Map<String, dynamic> json) =>
    _DeliveryInput(
      deliveryId: (json['delivery_id'] as num).toInt(),
      livreurId: (json['livreur_id'] as num).toInt(),
    );

Map<String, dynamic> _$DeliveryInputToJson(_DeliveryInput instance) =>
    <String, dynamic>{
      'delivery_id': instance.deliveryId,
      'livreur_id': instance.livreurId,
    };
