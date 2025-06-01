// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_invoice_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedInvoiceListImpl _$$PaginatedInvoiceListImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedInvoiceListImpl(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Invoice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PaginatedInvoiceListImplToJson(
        _$PaginatedInvoiceListImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
