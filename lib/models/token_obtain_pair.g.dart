// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_obtain_pair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TokenObtainPair _$TokenObtainPairFromJson(Map<String, dynamic> json) =>
    _TokenObtainPair(
      email: json['email'] as String,
      password: json['password'] as String,
      access: json['access'] as String?,
      refresh: json['refresh'] as String?,
    );

Map<String, dynamic> _$TokenObtainPairToJson(_TokenObtainPair instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'access': instance.access,
      'refresh': instance.refresh,
    };
