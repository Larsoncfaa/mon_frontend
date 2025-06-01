// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_cart_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedCartListImpl _$$PaginatedCartListImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedCartListImpl(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Cart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaginatedCartListImplToJson(
        _$PaginatedCartListImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
