import 'package:json_annotation/json_annotation.dart';

/// Statut du paiement :
enum PaymentStatusEnum {
  @JsonValue('PENDING')
  pending, // En attente

  @JsonValue('PAID')
  paid, // Payé

  @JsonValue('FAILED')
  failed, // Échoué
}
