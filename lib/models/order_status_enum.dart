import 'package:json_annotation/json_annotation.dart';

/// Statut de commande
enum OrderStatusEnum {
  /// En attente
  @JsonValue('PENDING')
  pending,

  /// En cours
  @JsonValue('EN_COURS')
  enCours,

  /// Livrée
  @JsonValue('DELIVERED')
  delivered,

  /// Annulée
  @JsonValue('CANCELLED')
  cancelled,
}
