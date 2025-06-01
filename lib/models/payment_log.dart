import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_log.freezed.dart';
part 'payment_log.g.dart';

@freezed
class PaymentLog with _$PaymentLog {
  const factory PaymentLog({
    required int id,
    required int order,
    @JsonKey(name: 'attempt_time') required DateTime attemptTime,
    @JsonKey(name: 'payment_status') required String paymentStatus,
    required double amount,
    Map<String, dynamic>? info,
  }) = _PaymentLog;

  factory PaymentLog.fromJson(Map<String, dynamic> json) => _$PaymentLogFromJson(json);
}
