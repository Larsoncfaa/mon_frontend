// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SetPassword _$SetPasswordFromJson(Map<String, dynamic> json) => _SetPassword(
  newPassword: json['new_password'] as String,
  currentPassword: json['current_password'] as String,
);

Map<String, dynamic> _$SetPasswordToJson(_SetPassword instance) =>
    <String, dynamic>{
      'new_password': instance.newPassword,
      'current_password': instance.currentPassword,
    };
