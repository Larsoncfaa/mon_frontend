import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_input.freezed.dart';
part 'delivery_input.g.dart';

/// Modèle utilisé pour estimer une livraison à partir
/// des coordonnées du client et d'une quantité totale.
@freezed
class DeliveryInput with _$DeliveryInput {
  const factory DeliveryInput({
    /// Dictionnaire contenant 'lat' et 'lng' du client
    required Map<String, double> client,

    /// Quantité totale commandée pour l'estimation
    @JsonKey(name: 'total_quantity') required int totalQuantity,
  }) = _DeliveryInput;

  factory DeliveryInput.fromJson(Map<String, dynamic> json) => _$DeliveryInputFromJson(json);
}
