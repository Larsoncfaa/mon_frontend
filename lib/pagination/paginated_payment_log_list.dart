import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/payment_log.dart';


part 'paginated_payment_log_list.freezed.dart';
part 'paginated_payment_log_list.g.dart';

@freezed
class PaginatedPaymentLogList with _$PaginatedPaymentLogList {
  const factory PaginatedPaymentLogList({
    required int count,
    String? next,
    String? previous,
    required List<PaymentLog> results,
  }) = _PaginatedPaymentLogList;

  factory PaginatedPaymentLogList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedPaymentLogListFromJson(json);
}
