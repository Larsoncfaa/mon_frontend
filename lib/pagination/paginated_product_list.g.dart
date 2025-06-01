// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_product_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedProductListImpl _$$PaginatedProductListImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedProductListImpl(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaginatedProductListImplToJson(
        _$PaginatedProductListImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
