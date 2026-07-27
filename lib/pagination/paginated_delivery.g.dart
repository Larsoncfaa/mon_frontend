// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_delivery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedDelivery _$PaginatedDeliveryFromJson(Map<String, dynamic> json) =>
    _PaginatedDelivery(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Delivery.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaginatedDeliveryToJson(_PaginatedDelivery instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
