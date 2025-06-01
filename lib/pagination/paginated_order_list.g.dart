// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_order_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedOrderListImpl _$$PaginatedOrderListImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedOrderListImpl(
      count: (json['count'] as num?)?.toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaginatedOrderListImplToJson(
        _$PaginatedOrderListImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
