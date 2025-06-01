import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_input.freezed.dart';
part 'sales_input.g.dart';

/// Représente les paramètres pour générer une prévision de ventes.
/// Contient l’ID du produit, le nombre de jours d’historique à considérer,
/// et le nombre de jours à prédire.
@freezed
class SalesInput with _$SalesInput {
  const factory SalesInput({
    /// ID du produit (obligatoire)
    @JsonKey(name: 'product_id') required int productId,

    /// Nombre de jours d'historique à considérer (par défaut : 30)
    @JsonKey(name: 'history_days') int? historyDays,

    /// Nombre de jours à prédire (par défaut : 30)
    @JsonKey(name: 'forecast_days') int? forecastDays,
  }) = _SalesInput;

  /// Crée une instance à partir d’un JSON
  factory SalesInput.fromJson(Map<String, dynamic> json) => _$SalesInputFromJson(json);
}
