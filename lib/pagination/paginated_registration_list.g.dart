// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_registration_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedRegistrationListImpl _$$PaginatedRegistrationListImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedRegistrationListImpl(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Registration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaginatedRegistrationListImplToJson(
        _$PaginatedRegistrationListImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
