// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_promo_code_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedPromoCodeList _$PaginatedPromoCodeListFromJson(
  Map<String, dynamic> json,
) => _PaginatedPromoCodeList(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => PromoCode.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaginatedPromoCodeListToJson(
  _PaginatedPromoCodeList instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
