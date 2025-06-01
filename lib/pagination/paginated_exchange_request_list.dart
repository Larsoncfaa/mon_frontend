import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/exchange_request.dart';


part 'paginated_exchange_request_list.freezed.dart';
part 'paginated_exchange_request_list.g.dart';


@freezed
class PaginatedExchangeRequestList with _$PaginatedExchangeRequestList {
  const factory PaginatedExchangeRequestList({
    required int count,
    String? next,
    String? previous,
    required List<ExchangeRequest> results,
  }) = _PaginatedExchangeRequestList;

  factory PaginatedExchangeRequestList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedExchangeRequestListFromJson(json);
}
