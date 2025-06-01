// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_order_line_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedOrderLineListImpl _$$PaginatedOrderLineListImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedOrderLineListImpl(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => OrderLine.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaginatedOrderLineListImplToJson(
        _$PaginatedOrderLineListImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
