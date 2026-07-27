// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_product_discount_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedProductDiscountList _$PaginatedProductDiscountListFromJson(
  Map<String, dynamic> json,
) => _PaginatedProductDiscountList(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => ProductDiscount.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaginatedProductDiscountListToJson(
  _PaginatedProductDiscountList instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
