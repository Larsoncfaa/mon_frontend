// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_delivery_person_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedDeliveryPersonList _$PaginatedDeliveryPersonListFromJson(
  Map<String, dynamic> json,
) => _PaginatedDeliveryPersonList(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => DeliveryPerson.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaginatedDeliveryPersonListToJson(
  _PaginatedDeliveryPersonList instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
