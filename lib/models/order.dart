import 'package:freezed_annotation/freezed_annotation.dart';
import 'order_status_enum.dart';
import 'order_line.dart';
import 'double_converter.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
abstract class Order with _$Order {
  const factory Order({
    required int id,
    required int client,
    @JsonKey(name: 'date_ordered') required DateTime dateOrdered,
    @JsonKey(name: 'order_status') required OrderStatusEnum orderStatus,
    required List<OrderLine> lines,
    @StringToDoubleConverter() required double total,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
