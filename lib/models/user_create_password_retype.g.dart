// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_create_password_retype.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserCreatePasswordRetypeImpl _$$UserCreatePasswordRetypeImplFromJson(
        Map<String, dynamic> json) =>
    _$UserCreatePasswordRetypeImpl(
      email: json['email'] as String,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      id: (json['id'] as num).toInt(),
      password: json['password'] as String,
      rePassword: json['rePassword'] as String,
    );

Map<String, dynamic> _$$UserCreatePasswordRetypeImplToJson(
        _$UserCreatePasswordRetypeImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'id': instance.id,
      'password': instance.password,
      'rePassword': instance.rePassword,
    };
