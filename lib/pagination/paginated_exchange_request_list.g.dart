// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_exchange_request_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedExchangeRequestListImpl _$$PaginatedExchangeRequestListImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedExchangeRequestListImpl(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => ExchangeRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaginatedExchangeRequestListImplToJson(
        _$PaginatedExchangeRequestListImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
