import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_predict.freezed.dart';
part 'sales_predict.g.dart';

/// Représente une prévision de vente pour un produit donné,
/// sur une période spécifique.
@freezed
class SalesPredict with _$SalesPredict {
  const factory SalesPredict({
    /// ID du produit concerné par la prévision
    @JsonKey(name: 'product_id') required int productId,

    /// Période associée à la prévision (ex : "2025-06-01", "Semaine 22", etc.)
    @JsonKey(name: 'period') required String period,

    /// Valeur de vente prédite (exprimée en unités)
    @JsonKey(name: 'predicted_sales') required int predictedSales,
  }) = _SalesPredict;

  /// Création à partir d’un JSON
  factory SalesPredict.fromJson(Map<String, dynamic> json) => _$SalesPredictFromJson(json);
}
