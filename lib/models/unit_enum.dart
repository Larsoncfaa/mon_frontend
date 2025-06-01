import 'package:freezed_annotation/freezed_annotation.dart';




/// Représente les unités de mesure pour les produits.
@JsonEnum(fieldRename: FieldRename.none)
enum UnitEnum {
  @JsonValue('t')
  t, // Tonne

  @JsonValue('kg')
  kg, // Kilogramme

  @JsonValue('g')
  g, // Gramme

  @JsonValue('l')
  l, // Litre
}

/// Fonction d'extension utile pour afficher le nom complet de l’unité.
extension UnitEnumExtension on UnitEnum {
  String get label {
    switch (this) {
      case UnitEnum.t:
        return 'Tonne';
      case UnitEnum.kg:
        return 'Kilogramme';
      case UnitEnum.g:
        return 'Gramme';
      case UnitEnum.l:
        return 'Litre';
    }
  }
}
