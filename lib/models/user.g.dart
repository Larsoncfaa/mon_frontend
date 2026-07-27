// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: (json['id'] as num).toInt(),
  email: json['email'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  username: json['username'] as String?,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'role': _$UserRoleEnumMap[instance.role]!,
  'username': instance.username,
};

const _$UserRoleEnumMap = {
  UserRole.agriculteur: 'agriculteur',
  UserRole.client: 'client',
  UserRole.livreur: 'livreur',
};
