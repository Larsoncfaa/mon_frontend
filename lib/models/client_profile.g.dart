// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientProfile _$ClientProfileFromJson(Map<String, dynamic> json) =>
    _ClientProfile(
      id: (json['id'] as num).toInt(),
      location: json['location'] as String,
      balance: (json['balance'] as num).toDouble(),
      loyaltyPoints: (json['loyalty_points'] as num).toInt(),
      user: (json['user'] as num).toInt(),
    );

Map<String, dynamic> _$ClientProfileToJson(_ClientProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'balance': instance.balance,
      'loyalty_points': instance.loyaltyPoints,
      'user': instance.user,
    };
