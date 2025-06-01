// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryInputImpl _$$DeliveryInputImplFromJson(Map<String, dynamic> json) =>
    _$DeliveryInputImpl(
      client: (json['client'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      totalQuantity: (json['total_quantity'] as num).toInt(),
    );

Map<String, dynamic> _$$DeliveryInputImplToJson(_$DeliveryInputImpl instance) =>
    <String, dynamic>{
      'client': instance.client,
      'total_quantity': instance.totalQuantity,
    };
