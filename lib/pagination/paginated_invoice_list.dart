import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/invoice.dart';


part 'paginated_invoice_list.freezed.dart';
part 'paginated_invoice_list.g.dart';


@freezed
class PaginatedInvoiceList with _$PaginatedInvoiceList {
  const factory PaginatedInvoiceList({
    required int count,
    String? next,
    String? previous,
    required List<Invoice> results,
  }) = _PaginatedInvoiceList;

  factory PaginatedInvoiceList.fromJson(Map<String, dynamic> json) => _$PaginatedInvoiceListFromJson(json);
}
