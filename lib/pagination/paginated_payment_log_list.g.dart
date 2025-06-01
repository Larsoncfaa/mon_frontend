// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_payment_log_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedPaymentLogListImpl _$$PaginatedPaymentLogListImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedPaymentLogListImpl(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => PaymentLog.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaginatedPaymentLogListImplToJson(
        _$PaginatedPaymentLogListImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
