import 'package:freezed_annotation/freezed_annotation.dart';
import 'product.dart';
import 'double_converter.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
abstract class CartItem with _$CartItem {
  const factory CartItem({
    int? id,
    @JsonKey(name: 'product_id') int? productId,
    required Product product,
    int? quantity,
    @StringToDoubleConverter() double? totalPrice,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}
