// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_product_discount_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedProductDiscountListImpl _$$PaginatedProductDiscountListImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedProductDiscountListImpl(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => ProductDiscount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaginatedProductDiscountListImplToJson(
        _$PaginatedProductDiscountListImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
