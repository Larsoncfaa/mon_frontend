import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'refund_status_enum.dart';

part 'refund_request.freezed.dart';
part 'refund_request.g.dart';

/// Représente une demande de remboursement faite par un utilisateur.
/// Elle est liée à une commande et contient les informations nécessaires
/// pour décider du remboursement.
@freezed
class RefundRequest with _$RefundRequest {
  /// Constructeur principal utilisé par Freezed.
  /// Les champs sont mappés avec les noms attendus par l’API grâce à @JsonKey.
  const factory RefundRequest({
    /// ID unique de la demande
    required int id,

    /// Nombre de jours restants avant expiration de la demande
    required int daysRemaining,

    /// Raison du remboursement (champ texte libre)
    required String reason,

    /// Preuves à l’appui de la demande (peut être un lien ou description)
    // Champ ignoré pour JSON, rendu optionnel
    @JsonKey(ignore: true)
    File? evidence,  // nullable, car pas présent dans le JSON

    /// Statut actuel de la demande (enum)
    required RefundStatusEnum? refundStatus,

    /// Date à laquelle la demande a été faite
    required DateTime ?requestedAt,

    /// Date de traitement par un administrateur (peut être null si non traité)
    DateTime? processedAt,

    /// ID de la commande associée
    required int order,
  }) = _RefundRequest;

  /// Factory pour la désérialisation depuis JSON
  factory RefundRequest.fromJson(Map<String, dynamic> json) =>
      _$RefundRequestFromJson(json);
}
