// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_obtain_pair.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenObtainPairImpl _$$TokenObtainPairImplFromJson(
        Map<String, dynamic> json) =>
    _$TokenObtainPairImpl(
      username: json['username'] as String,
      password: json['password'] as String,
      access: json['access'] as String,
      refresh: json['refresh'] as String,
    );

Map<String, dynamic> _$$TokenObtainPairImplToJson(
        _$TokenObtainPairImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'access': instance.access,
      'refresh': instance.refresh,
    };
