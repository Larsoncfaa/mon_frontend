import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'refund_status_enum.dart';

part 'refund_request.freezed.dart';
part 'refund_request.g.dart';

@freezed
abstract class RefundRequest with _$RefundRequest {
  const factory RefundRequest({
    required int id,
    required int order,
    required String reason,
    @JsonKey(includeFromJson: false, includeToJson: false) File? evidence,
    @JsonKey(name: 'requested_at') DateTime? requestedAt,
    @JsonKey(name: 'refund_status') RefundStatusEnum? refundStatus,
    @JsonKey(name: 'processed_at') DateTime? processedAt,
    @JsonKey(name: 'days_remaining') required int daysRemaining,
  }) = _RefundRequest;

  factory RefundRequest.fromJson(Map<String, dynamic> json) =>
      _$RefundRequestFromJson(json);
}
