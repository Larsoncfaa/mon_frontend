import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_predict.freezed.dart';
part 'delivery_predict.g.dart';

/// Représente le résultat d'une prédiction de livraison basée sur
/// un produit, une quantité, et une chaîne de prédiction.
@freezed
class DeliveryPredict with _$DeliveryPredict {
  const factory DeliveryPredict({
    /// ID du produit concerné
    @JsonKey(name: 'product_id') required int productId,

    /// Quantité demandée pour la prédiction
    required int quantity,

    /// Résultat de la prédiction (ex : durée estimée, etc.)
    required String prediction,
  }) = _DeliveryPredict;

  factory DeliveryPredict.fromJson(Map<String, dynamic> json) =>
      _$DeliveryPredictFromJson(json);
}
