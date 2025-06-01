// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_client_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedClientProfileImpl _$$PaginatedClientProfileImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedClientProfileImpl(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => ClientProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaginatedClientProfileImplToJson(
        _$PaginatedClientProfileImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
