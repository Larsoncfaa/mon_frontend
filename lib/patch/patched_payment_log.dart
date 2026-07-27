import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_payment_log.freezed.dart';
part 'patched_payment_log.g.dart';

@freezed
abstract class PatchedPaymentLog with _$PatchedPaymentLog {
  const factory PatchedPaymentLog({
    int? id,
    int? order,
    double? amount,
    String? status,
    @JsonKey(name: 'attempt_time') DateTime? attemptTime,
    @JsonKey(name: 'response_message') String? responseMessage,
  }) = _PatchedPaymentLog;

  factory PatchedPaymentLog.fromJson(Map<String, dynamic> json) =>
      _$PatchedPaymentLogFromJson(json);
}
