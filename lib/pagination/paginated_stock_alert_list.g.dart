// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_stock_alert_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedStockAlertList _$PaginatedStockAlertListFromJson(
  Map<String, dynamic> json,
) => _PaginatedStockAlertList(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => StockAlert.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaginatedStockAlertListToJson(
  _PaginatedStockAlertList instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
