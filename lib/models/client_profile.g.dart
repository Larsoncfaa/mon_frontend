// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientProfileImpl _$$ClientProfileImplFromJson(Map<String, dynamic> json) =>
    _$ClientProfileImpl(
      id: (json['id'] as num).toInt(),
      user: (json['user'] as num).toInt(),
      location: json['location'] as String?,
      balance: const StringToDoubleConverter().fromJson(json['balance']),
      points: (json['points'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ClientProfileImplToJson(_$ClientProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'location': instance.location,
      'balance': const StringToDoubleConverter().toJson(instance.balance),
      'points': instance.points,
    };
