// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Notification _$NotificationFromJson(Map<String, dynamic> json) =>
    _Notification(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      message: json['message'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      isRead: json['is_read'] as bool,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$NotificationToJson(_Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'message': instance.message,
      'created_at': instance.createdAt.toIso8601String(),
      'is_read': instance.isRead,
      'link': instance.link,
    };
