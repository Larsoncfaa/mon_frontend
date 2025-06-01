// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_stock_movement_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedStockMovementListImpl _$$PaginatedStockMovementListImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedStockMovementListImpl(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => StockMovement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaginatedStockMovementListImplToJson(
        _$PaginatedStockMovementListImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
