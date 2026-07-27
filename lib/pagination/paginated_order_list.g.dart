// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_order_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedOrderList _$PaginatedOrderListFromJson(Map<String, dynamic> json) =>
    _PaginatedOrderList(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaginatedOrderListToJson(_PaginatedOrderList instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
