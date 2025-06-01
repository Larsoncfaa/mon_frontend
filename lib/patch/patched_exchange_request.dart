import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/exchange_status_enum.dart';


part 'patched_exchange_request.freezed.dart';
part 'patched_exchange_request.g.dart';


@freezed
class PatchedExchangeRequest with _$PatchedExchangeRequest {
  const factory PatchedExchangeRequest({
    int? id,
    @JsonKey(name: 'return_request') int? returnRequest,
    int? replacement,
    @JsonKey(name: 'exchange_status') ExchangeStatusEnum? exchangeStatus,
  }) = _PatchedExchangeRequest;

  factory PatchedExchangeRequest.fromJson(Map<String, dynamic> json) =>
      _$PatchedExchangeRequestFromJson(json);
}
