// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_delivery_paginated.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PatchedDeliveryPaginated _$PatchedDeliveryPaginatedFromJson(
  Map<String, dynamic> json,
) => _PatchedDeliveryPaginated(
  count: (json['count'] as num?)?.toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>?)
      ?.map((e) => PatchedDelivery.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PatchedDeliveryPaginatedToJson(
  _PatchedDeliveryPaginated instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
