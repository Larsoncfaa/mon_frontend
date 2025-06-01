import 'package:freezed_annotation/freezed_annotation.dart';
import 'exchange_status_enum.dart';

part 'exchange_request.freezed.dart';
part 'exchange_request.g.dart';

@freezed
class ExchangeRequest with _$ExchangeRequest {
  const factory ExchangeRequest({
    required int id,
    required int returnRequest,
    required int replacement,
    ExchangeStatusEnum? exchangeStatus,
  }) = _ExchangeRequest;

  factory ExchangeRequest.fromJson(Map<String, dynamic> json) =>
      _$ExchangeRequestFromJson(json);
}
