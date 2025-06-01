// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_warehouse_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedWarehouseListImpl _$$PaginatedWarehouseListImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedWarehouseListImpl(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Warehouse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaginatedWarehouseListImplToJson(
        _$PaginatedWarehouseListImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
