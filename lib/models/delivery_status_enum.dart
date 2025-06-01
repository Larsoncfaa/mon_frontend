import 'package:freezed_annotation/freezed_annotation.dart';

enum DeliveryStatusEnum {
  @JsonValue('EN_ATTENTE')
  enAttente,

  @JsonValue('EN_COURS')
  enCours,

  @JsonValue('TERMINEE')
  terminee,
}
