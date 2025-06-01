// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_client_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatchedClientProfileImpl _$$PatchedClientProfileImplFromJson(
        Map<String, dynamic> json) =>
    _$PatchedClientProfileImpl(
      id: (json['id'] as num?)?.toInt(),
      user: (json['user'] as num?)?.toInt(),
      location: json['location'] as String?,
      balance: (json['balance'] as num?)?.toDouble(),
      points: (json['points'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PatchedClientProfileImplToJson(
        _$PatchedClientProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'location': instance.location,
      'balance': instance.balance,
      'points': instance.points,
    };
