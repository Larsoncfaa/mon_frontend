import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_exchange_request.freezed.dart';
part 'patched_exchange_request.g.dart';

@freezed
abstract class PatchedExchangeRequest with _$PatchedExchangeRequest {
  const factory PatchedExchangeRequest({
    int? id,
    @JsonKey(name: 'order_id') int? orderId,
    String? reason,
    @JsonKey(name: 'requested_at') DateTime? requestedAt,
    @JsonKey(name: 'exchange_status') String? exchangeStatus,
    String? replacement,
  }) = _PatchedExchangeRequest;

  factory PatchedExchangeRequest.fromJson(Map<String, dynamic> json) =>
      _$PatchedExchangeRequestFromJson(json);
}
