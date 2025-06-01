import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_payment_log.freezed.dart';
part 'patched_payment_log.g.dart';

@freezed
class PatchedPaymentLog with _$PatchedPaymentLog {
  const factory PatchedPaymentLog({
    int? id,
    int? order,
    @JsonKey(name: 'attempt_time') DateTime? attemptTime,
    @JsonKey(name: 'payment_status') String? paymentStatus,
    double? amount,
    Map<String, dynamic>? info,
  }) = _PatchedPaymentLog;

  factory PatchedPaymentLog.fromJson(Map<String, dynamic> json) =>
      _$PatchedPaymentLogFromJson(json);
}
