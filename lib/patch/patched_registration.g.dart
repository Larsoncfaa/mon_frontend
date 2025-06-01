// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatchedRegistrationImpl _$$PatchedRegistrationImplFromJson(
        Map<String, dynamic> json) =>
    _$PatchedRegistrationImpl(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$PatchedRegistrationImplToJson(
        _$PatchedRegistrationImpl instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'password': instance.password,
    };
