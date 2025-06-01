import 'package:freezed_annotation/freezed_annotation.dart';

enum TypeEnum {
  @JsonValue('LIVRAISON')
  livraison,

  @JsonValue('STOCK')
  stock,

  @JsonValue('REMBOURSEMENT')
  remboursement,

  @JsonValue('AUTRE')
  autre,
}
