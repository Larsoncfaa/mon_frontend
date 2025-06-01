import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/order_line.dart';

part 'paginated_order_line_list.freezed.dart';
part 'paginated_order_line_list.g.dart';






@freezed
class PaginatedOrderLineList with _$PaginatedOrderLineList {
  const factory PaginatedOrderLineList({
    required int count,
    String? next,
    String? previous,
    required List<OrderLine> results,
  }) = _PaginatedOrderLineList;

  factory PaginatedOrderLineList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedOrderLineListFromJson(json);
}
