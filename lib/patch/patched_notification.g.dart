// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PatchedNotification _$PatchedNotificationFromJson(Map<String, dynamic> json) =>
    _PatchedNotification(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      message: json['message'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      isRead: json['is_read'] as bool?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$PatchedNotificationToJson(
  _PatchedNotification instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'message': instance.message,
  'created_at': instance.createdAt?.toIso8601String(),
  'is_read': instance.isRead,
  'link': instance.link,
};
