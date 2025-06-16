import 'package:freezed_annotation/freezed_annotation.dart';
import 'double_converter.dart';
import 'method_enum.dart';
import 'payment_status_enum.dart';

part 'payment.freezed.dart';
part 'payment.g.dart';

@freezed
class Payment with _$Payment {
  const factory Payment({
    required int? id,
    required int order,
    required MethodEnum method,

    @StringToDoubleConverter()
    required double amount,

    @JsonKey(name: 'payment_status')
    PaymentStatusEnum? paymentStatus,

    @JsonKey(name: 'paid_at')
    DateTime? paidAt,
  }) = _Payment;

  factory Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);
}
