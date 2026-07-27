// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_order_line_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedOrderLineList _$PaginatedOrderLineListFromJson(
  Map<String, dynamic> json,
) => _PaginatedOrderLineList(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => OrderLine.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaginatedOrderLineListToJson(
  _PaginatedOrderLineList instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
