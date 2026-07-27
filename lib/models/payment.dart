import 'package:freezed_annotation/freezed_annotation.dart';
import 'payment_status_enum.dart';
import 'method_enum.dart';

part 'payment.freezed.dart';
part 'payment.g.dart';

@freezed
abstract class Payment with _$Payment {
  const factory Payment({
    required int id,
    required int order,
    required double amount,
    required MethodEnum method,
    @JsonKey(name: 'payment_status') required PaymentStatusEnum paymentStatus,
    @JsonKey(name: 'transaction_id') String? transactionId,
    @JsonKey(name: 'paid_at') DateTime? paidAt,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);
}
