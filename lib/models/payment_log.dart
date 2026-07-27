import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_log.freezed.dart';
part 'payment_log.g.dart';

@freezed
abstract class PaymentLog with _$PaymentLog {
  const factory PaymentLog({
    required int id,
    required int order,
    required double amount,
    required String status,
    @JsonKey(name: 'attempt_time') required DateTime attemptTime,
    @JsonKey(name: 'response_message') String? responseMessage,
  }) = _PaymentLog;

  factory PaymentLog.fromJson(Map<String, dynamic> json) =>
      _$PaymentLogFromJson(json);
}
