// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeliveryPerson _$DeliveryPersonFromJson(Map<String, dynamic> json) =>
    _DeliveryPerson(
      id: (json['id'] as num).toInt(),
      agriculteur: (json['agriculteur'] as num).toInt(),
      agriculteurName: json['agriculteur_name'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$DeliveryPersonToJson(_DeliveryPerson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'agriculteur': instance.agriculteur,
      'agriculteur_name': instance.agriculteurName,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone': instance.phone,
    };
