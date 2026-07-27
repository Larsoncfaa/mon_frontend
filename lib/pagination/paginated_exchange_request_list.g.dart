// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_exchange_request_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedExchangeRequestList _$PaginatedExchangeRequestListFromJson(
  Map<String, dynamic> json,
) => _PaginatedExchangeRequestList(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => ExchangeRequest.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaginatedExchangeRequestListToJson(
  _PaginatedExchangeRequestList instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results,
};
