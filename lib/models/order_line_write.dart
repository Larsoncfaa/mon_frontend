import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_line_write.freezed.dart';
part 'order_line_write.g.dart';

@freezed
class OrderLineWrite with _$OrderLineWrite {
  const factory OrderLineWrite({
    required int product,
    required int quantity,
    @JsonKey(name: 'unit_price') required double unitPrice,
  }) = _OrderLineWrite;

  factory OrderLineWrite.fromJson(Map<String, dynamic> json) =>
      _$OrderLineWriteFromJson(json);
}
