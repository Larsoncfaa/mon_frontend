import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_input.freezed.dart';
part 'delivery_input.g.dart';

/// Modèle utilisé pour assigner une livraison à un livreur.
@freezed
class DeliveryInput with _$DeliveryInput {
  const factory DeliveryInput({
    @JsonKey(name: 'delivery_id') required int deliveryId,
    @JsonKey(name: 'livreur_id') required int livreurId,
  }) = _DeliveryInput;

  factory DeliveryInput.fromJson(Map<String, dynamic> json) =>
      _$DeliveryInputFromJson(json);
}
