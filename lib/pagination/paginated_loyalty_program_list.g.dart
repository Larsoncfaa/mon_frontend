// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_loyalty_program_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedLoyaltyProgramList _$PaginatedLoyaltyProgramListFromJson(
  Map<String, dynamic> json,
) => _PaginatedLoyaltyProgramList(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => LoyaltyProgram.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaginatedLoyaltyProgramListToJson(
  _PaginatedLoyaltyProgramList instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
