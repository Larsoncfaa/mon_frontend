// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_notification_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedNotificationListImpl _$$PaginatedNotificationListImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedNotificationListImpl(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Notification.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaginatedNotificationListImplToJson(
        _$PaginatedNotificationListImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
