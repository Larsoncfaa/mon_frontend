// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PatchedUser _$PatchedUserFromJson(Map<String, dynamic> json) => _PatchedUser(
  id: (json['id'] as num?)?.toInt(),
  email: json['email'] as String?,
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  role: json['role'] as String?,
);

Map<String, dynamic> _$PatchedUserToJson(_PatchedUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'role': instance.role,
    };
