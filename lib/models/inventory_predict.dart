import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_predict.freezed.dart';
part 'inventory_predict.g.dart';

/// Résultat de la prédiction de stock pour un produit donné.
@freezed
class InventoryPredict with _$InventoryPredict {
  const factory InventoryPredict({
    /// ID du produit concerné par la prédiction
    @JsonKey(name: 'product_id') required int productId,

    /// Nombre de jours projetés dans la prédiction
    @JsonKey(name: 'days') required int days,

    /// Stock prédit à la fin de la période
    @JsonKey(name: 'predicted_inventory') required int predictedInventory,
  }) = _InventoryPredict;

  factory InventoryPredict.fromJson(Map<String, dynamic> json) =>
      _$InventoryPredictFromJson(json);
}
