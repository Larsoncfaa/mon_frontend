import 'package:freezed_annotation/freezed_annotation.dart';
import 'cart_item.dart';
import 'double_converter.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
abstract class Cart with _$Cart {
  const factory Cart({
    required int id,
    required List<CartItem> items,
    @JsonKey(name: 'total_price') @StringToDoubleConverter() required double totalPrice,
    @JsonKey(name: 'item_count') required int itemCount,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
