// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryPersonImpl _$$DeliveryPersonImplFromJson(Map<String, dynamic> json) =>
    _$DeliveryPersonImpl(
      id: (json['id'] as num).toInt(),
      user: (json['user'] as num).toInt(),
      userName: json['user_name'] as String,
      agriculteur: (json['agriculteur'] as num).toInt(),
      agriculteurName: json['agriculteur_name'] as String?,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$$DeliveryPersonImplToJson(
        _$DeliveryPersonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'user_name': instance.userName,
      'agriculteur': instance.agriculteur,
      'agriculteur_name': instance.agriculteurName,
      'phone': instance.phone,
    };
