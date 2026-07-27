// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_create_password_retype.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserCreatePasswordRetype _$UserCreatePasswordRetypeFromJson(
  Map<String, dynamic> json,
) => _UserCreatePasswordRetype(
  id: (json['id'] as num).toInt(),
  email: json['email'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  password: json['password'] as String,
  rePassword: json['re_password'] as String,
);

Map<String, dynamic> _$UserCreatePasswordRetypeToJson(
  _UserCreatePasswordRetype instance,
) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'password': instance.password,
  're_password': instance.rePassword,
};
