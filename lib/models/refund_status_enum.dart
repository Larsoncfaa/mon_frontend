import 'package:freezed_annotation/freezed_annotation.dart';

/// Représente les différents statuts d'une demande de remboursement.
/// Utilisé dans le modèle [RefundRequest].
enum RefundStatusEnum {
  /// En attente de traitement
  @JsonValue('PENDING')
  pending,

  /// Remboursement approuvé
  @JsonValue('APPROVED')
  approved,

  /// Remboursement rejeté
  @JsonValue('REJECTED')
  rejected, PENDING,
}
