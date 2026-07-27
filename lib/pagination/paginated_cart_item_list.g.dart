// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_cart_item_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedCartItemList _$PaginatedCartItemListFromJson(
  Map<String, dynamic> json,
) => _PaginatedCartItemList(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaginatedCartItemListToJson(
  _PaginatedCartItemList instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
