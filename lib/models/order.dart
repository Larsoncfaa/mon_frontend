import 'package:freezed_annotation/freezed_annotation.dart';

import 'client_profile.dart';
import 'order_line.dart';
import 'order_status_enum.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required int id,
    required ClientProfile client,
    required DateTime dateOrdered,
    OrderStatusEnum? orderStatus,
    required double total,
    @Default([]) List<OrderLine> lines,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
