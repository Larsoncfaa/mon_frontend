// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SetPasswordImpl _$$SetPasswordImplFromJson(Map<String, dynamic> json) =>
    _$SetPasswordImpl(
      newPassword: json['new_password'] as String,
      currentPassword: json['current_password'] as String,
    );

Map<String, dynamic> _$$SetPasswordImplToJson(_$SetPasswordImpl instance) =>
    <String, dynamic>{
      'new_password': instance.newPassword,
      'current_password': instance.currentPassword,
    };
