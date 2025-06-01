// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_promo_code_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedPromoCodeListImpl _$$PaginatedPromoCodeListImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedPromoCodeListImpl(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => PromoCode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaginatedPromoCodeListImplToJson(
        _$PaginatedPromoCodeListImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
