// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatchedUserImpl _$$PatchedUserImplFromJson(Map<String, dynamic> json) =>
    _$PatchedUserImpl(
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PatchedUserImplToJson(_$PatchedUserImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'id': instance.id,
    };
