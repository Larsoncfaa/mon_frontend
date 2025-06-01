import 'package:freezed_annotation/freezed_annotation.dart';
import 'order_line_write.dart';
import 'order_status_enum.dart';

part 'order_write.freezed.dart';
part 'order_write.g.dart';

@freezed
class OrderWrite with _$OrderWrite {
  const factory OrderWrite({
    required int client,
    @JsonKey(name: 'order_status') OrderStatusEnum? orderStatus,
    required double total,
    required List<OrderLineWrite> lines,
  }) = _OrderWrite;

  factory OrderWrite.fromJson(Map<String, dynamic> json) =>
      _$OrderWriteFromJson(json);
}
