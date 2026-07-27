// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedCategory _$PaginatedCategoryFromJson(Map<String, dynamic> json) =>
    _PaginatedCategory(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaginatedCategoryToJson(_PaginatedCategory instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
