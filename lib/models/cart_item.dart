import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required int id,
    @JsonKey(name: 'product') required Map<String, dynamic> product, // Ou un modèle Product
    @JsonKey(name: 'product_id') required int productId,
    int? quantity,
    @JsonKey(name: 'total_price') required double totalPrice,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
}
