import 'package:freezed_annotation/freezed_annotation.dart';
import 'product.dart';

part 'order_line.freezed.dart';
part 'order_line.g.dart';

@freezed
class OrderLine with _$OrderLine {
  const factory OrderLine({
    required int id,
    required Product product,
    required int quantity,
    @JsonKey(name: 'unit_price') required double unitPrice,
  }) = _OrderLine;

  factory OrderLine.fromJson(Map<String, dynamic> json) => _$OrderLineFromJson(json);
}
