import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/product.dart';


part 'patched_order_line.freezed.dart';
part 'patched_order_line.g.dart';

@freezed
class PatchedOrderLine with _$PatchedOrderLine {
  const factory PatchedOrderLine({
    int? id,
    Product? product,
    int? quantity,
    @JsonKey(name: 'unit_price') double? unitPrice,
  }) = _PatchedOrderLine;

  factory PatchedOrderLine.fromJson(Map<String, dynamic> json) =>
      _$PatchedOrderLineFromJson(json);
}
