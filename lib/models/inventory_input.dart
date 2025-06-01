import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_input.freezed.dart';
part 'inventory_input.g.dart';

/// Données d'entrée pour la prédiction du stock
@freezed
class InventoryInput with _$InventoryInput {
  const factory InventoryInput({
    /// ID du produit à prédire
    @JsonKey(name: 'product_id') required int productId,

    /// Fenêtre de jours passés (par défaut : 30 jours)
    @JsonKey(name: 'window_days') @Default(30) int windowDays,
  }) = _InventoryInput;

  factory InventoryInput.fromJson(Map<String, dynamic> json) =>
      _$InventoryInputFromJson(json);
}
