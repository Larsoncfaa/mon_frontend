// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      id: (json['id'] as num).toInt(),
      user: (json['user'] as num).toInt(),
      message: json['message'] as String,
      link: json['link'] as String?,
      read: json['read'] as bool?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'message': instance.message,
      'link': instance.link,
      'read': instance.read,
      'created_at': instance.createdAt.toIso8601String(),
    };
