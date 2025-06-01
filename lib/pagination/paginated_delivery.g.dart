// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_delivery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedDeliveryImpl _$$PaginatedDeliveryImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedDeliveryImpl(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Delivery.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaginatedDeliveryImplToJson(
        _$PaginatedDeliveryImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
