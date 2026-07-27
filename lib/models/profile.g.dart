// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Profile _$ProfileFromJson(Map<String, dynamic> json) => _Profile(
  id: (json['id'] as num).toInt(),
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  email: json['email'] as String,
  role: json['role'] as String,
);

Map<String, dynamic> _$ProfileToJson(_Profile instance) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'email': instance.email,
  'role': instance.role,
};
