import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

/// Enumération à adapter selon ton modèle
enum UnitEnum {
  @JsonValue('KG') kg,
  @JsonValue('L') l,
  @JsonValue('UNIT') unit,
  // Ajoute d'autres valeurs si nécessaire
}

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String category,
    String? image,
    required String name,
    String? description,
    @JsonKey(name: 'quantity_in_stock') int? quantityInStock,
    required UnitEnum unit,
    @JsonKey(name: 'purchase_price') required double purchasePrice,
    @JsonKey(name: 'selling_price') required double sellingPrice,
    @JsonKey(name: 'expiration_date') DateTime? expirationDate,
    @JsonKey(name: 'qr_code_image') String? qrCodeImage,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
