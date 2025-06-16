import 'package:freezed_annotation/freezed_annotation.dart';

import 'client_profile.dart';
import 'double_converter.dart';
import 'order_line.dart';
import 'order_status_enum.dart';
 // chemin selon ton projet

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required int id,
    required ClientProfile client,
    @JsonKey(name: 'date_ordered') required DateTime dateOrdered,
    @JsonKey(name: 'order_status') OrderStatusEnum? orderStatus,
    @StringToDoubleConverter() required double total,
    @JsonKey(name: 'lignes_commandes') @Default([]) List<OrderLine> lines,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
