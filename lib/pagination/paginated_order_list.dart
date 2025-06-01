import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/order.dart';


part 'paginated_order_list.freezed.dart';
part 'paginated_order_list.g.dart';

@freezed
class PaginatedOrderList with _$PaginatedOrderList {
  const factory PaginatedOrderList({
    int? count,
    String? next,
    String? previous,
    List<Order>? results,
  }) = _PaginatedOrderList;

  factory PaginatedOrderList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedOrderListFromJson(json);
}
