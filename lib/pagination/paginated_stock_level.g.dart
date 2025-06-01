// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_stock_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedStockLevelImpl _$$PaginatedStockLevelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedStockLevelImpl(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => StockLevel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaginatedStockLevelImplToJson(
        _$PaginatedStockLevelImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
