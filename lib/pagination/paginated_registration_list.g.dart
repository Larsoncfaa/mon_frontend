// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_registration_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedRegistrationList _$PaginatedRegistrationListFromJson(
  Map<String, dynamic> json,
) => _PaginatedRegistrationList(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => Registration.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaginatedRegistrationListToJson(
  _PaginatedRegistrationList instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
