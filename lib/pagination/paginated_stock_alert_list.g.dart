// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_stock_alert_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedStockAlertListImpl _$$PaginatedStockAlertListImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedStockAlertListImpl(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => StockAlert.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaginatedStockAlertListImplToJson(
        _$PaginatedStockAlertListImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
