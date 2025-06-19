// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryInputImpl _$$DeliveryInputImplFromJson(Map<String, dynamic> json) =>
    _$DeliveryInputImpl(
      deliveryId: (json['delivery_id'] as num).toInt(),
      livreurId: (json['livreur_id'] as num).toInt(),
    );

Map<String, dynamic> _$$DeliveryInputImplToJson(_$DeliveryInputImpl instance) =>
    <String, dynamic>{
      'delivery_id': instance.deliveryId,
      'livreur_id': instance.livreurId,
    };
