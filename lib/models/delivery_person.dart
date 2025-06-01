// 📦 FICHIER : lib/models/delivery_person.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_person.freezed.dart';
part 'delivery_person.g.dart';

@freezed
class DeliveryPerson with _$DeliveryPerson {
  const factory DeliveryPerson({
    /// Identifiant unique de la livraison
    required int id,

    /// ID du compte livreur
    required int user,

    /// ID de l'agriculteur émetteur
    required int agriculteur,

    /// Téléphone du destinataire
    required String phone,
  }) = _DeliveryPerson;

  factory DeliveryPerson.fromJson(Map<String, dynamic> json) => _$DeliveryPersonFromJson(json);
}

@freezed
class PaginatedDeliveryPersonList with _$PaginatedDeliveryPersonList {
  const factory PaginatedDeliveryPersonList({
    /// Nombre total d'éléments
    required int count,

    /// URL de la page suivante (ou null si dernière page)
    String? next,

    /// URL de la page précédente (ou null si première page)
    String? previous,

    /// Liste des livraisons pour cette page
    required List<DeliveryPerson> results,
  }) = _PaginatedDeliveryPersonList;

  factory PaginatedDeliveryPersonList.fromJson(Map<String, dynamic> json) => _$PaginatedDeliveryPersonListFromJson(json);
}
