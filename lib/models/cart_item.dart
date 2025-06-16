import 'package:freezed_annotation/freezed_annotation.dart';

import 'double_converter.dart'; // ✅ à ajouter

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required int? id,

    /// 🔄 Tu peux aussi remplacer `Map<String, dynamic>` par `Product` si tu veux.
    @JsonKey(name: 'product') required Map<String, dynamic> product,

    @JsonKey(name: 'product_id') required int? productId,
    int? quantity,

    @StringToDoubleConverter() // ✅ convertisseur ajouté
    @JsonKey(name: 'total_price') required double? totalPrice,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
}
