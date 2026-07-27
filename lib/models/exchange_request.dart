import 'package:freezed_annotation/freezed_annotation.dart';
import 'exchange_status_enum.dart';

part 'exchange_request.freezed.dart';
part 'exchange_request.g.dart';

@freezed
abstract class ExchangeRequest with _$ExchangeRequest {
  const factory ExchangeRequest({
    required int id,
    @JsonKey(name: 'order_id') required int orderId,
    required String reason,
    @JsonKey(name: 'requested_at') required DateTime requestedAt,
    @JsonKey(name: 'exchange_status') required ExchangeStatusEnum exchangeStatus,
    String? replacement,
  }) = _ExchangeRequest;

  factory ExchangeRequest.fromJson(Map<String, dynamic> json) =>
      _$ExchangeRequestFromJson(json);
}
