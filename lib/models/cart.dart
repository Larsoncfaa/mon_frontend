import 'package:freezed_annotation/freezed_annotation.dart';

import 'cart_item.dart';
import 'double_converter.dart'; // ✅ N'oublie pas ça

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  const factory Cart({
    required int? id,
    @JsonKey(name: 'user') required int? user,
    required List<CartItem> items,
    @StringToDoubleConverter() required double? total, // ✅ Ajout du convertisseur ici
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
