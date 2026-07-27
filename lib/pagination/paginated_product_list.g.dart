// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_product_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedProductList _$PaginatedProductListFromJson(
  Map<String, dynamic> json,
) => _PaginatedProductList(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => Product.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaginatedProductListToJson(
  _PaginatedProductList instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
