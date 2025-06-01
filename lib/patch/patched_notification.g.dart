// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatchedNotificationImpl _$$PatchedNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$PatchedNotificationImpl(
      id: (json['id'] as num?)?.toInt(),
      user: (json['user'] as num?)?.toInt(),
      message: json['message'] as String?,
      link: json['link'] as String?,
      read: json['read'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$PatchedNotificationImplToJson(
        _$PatchedNotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'message': instance.message,
      'link': instance.link,
      'read': instance.read,
      'created_at': instance.createdAt?.toIso8601String(),
    };
