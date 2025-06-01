// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeliveryPersonImpl _$$DeliveryPersonImplFromJson(Map<String, dynamic> json) =>
    _$DeliveryPersonImpl(
      id: (json['id'] as num).toInt(),
      user: (json['user'] as num).toInt(),
      agriculteur: (json['agriculteur'] as num).toInt(),
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$$DeliveryPersonImplToJson(
        _$DeliveryPersonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'agriculteur': instance.agriculteur,
      'phone': instance.phone,
    };

_$PaginatedDeliveryPersonListImpl _$$PaginatedDeliveryPersonListImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedDeliveryPersonListImpl(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => DeliveryPerson.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaginatedDeliveryPersonListImplToJson(
        _$PaginatedDeliveryPersonListImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
