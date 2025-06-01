import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_product_discount.freezed.dart';
part 'patched_product_discount.g.dart';

/// Représente une mise à jour partielle d'un rabais produit.
@freezed
class PatchedProductDiscount with _$PatchedProductDiscount {
  const factory PatchedProductDiscount({
    /// Identifiant du rabais (facultatif pour le PATCH).
    int? id,

    /// Identifiant du produit concerné.
    int? product,

    /// Pourcentage de réduction.
    @JsonKey(name: 'discount_percent') double? discountPercent,
  }) = _PatchedProductDiscount;

  factory PatchedProductDiscount.fromJson(Map<String, dynamic> json) =>
      _$PatchedProductDiscountFromJson(json);
}
