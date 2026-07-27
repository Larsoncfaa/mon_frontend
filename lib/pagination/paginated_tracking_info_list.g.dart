// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_tracking_info_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedTrackingInfoList _$PaginatedTrackingInfoListFromJson(
  Map<String, dynamic> json,
) => _PaginatedTrackingInfoList(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => TrackingInfo.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaginatedTrackingInfoListToJson(
  _PaginatedTrackingInfoList instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
