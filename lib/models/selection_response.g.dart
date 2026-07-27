// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SelectionResponse _$SelectionResponseFromJson(Map<String, dynamic> json) =>
    _SelectionResponse(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Selection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SelectionResponseToJson(_SelectionResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
