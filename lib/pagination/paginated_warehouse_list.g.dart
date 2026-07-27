// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_warehouse_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedWarehouseList _$PaginatedWarehouseListFromJson(
  Map<String, dynamic> json,
) => _PaginatedWarehouseList(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => Warehouse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaginatedWarehouseListToJson(
  _PaginatedWarehouseList instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
