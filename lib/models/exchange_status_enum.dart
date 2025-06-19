// enum représentant l’état d’une demande d’échange
import 'package:freezed_annotation/freezed_annotation.dart';

enum ExchangeStatusEnum {
  @JsonValue('PENDING') pending,
  @JsonValue('COMPLETED') completed, COMPLETED, PENDING, ACCEPTED, REJECTED,
}