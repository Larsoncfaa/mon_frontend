import 'package:freezed_annotation/freezed_annotation.dart';

/// Représente les unités de mesure pour les produits.
@JsonEnum(fieldRename: FieldRename.none)
enum UnitEnum {
  @JsonValue('t')
  t,

  @JsonValue('kg')
  kg,

  @JsonValue('g')
  g,

  @JsonValue('l')
  l,

  @JsonValue('unit')
  unit,
}

extension UnitEnumExtension on UnitEnum {
  String get label {
    switch (this) {
      case UnitEnum.t:
        return 't';
      case UnitEnum.kg:
        return 'kg';
      case UnitEnum.g:
        return 'g';
      case UnitEnum.l:
        return 'l';
      case UnitEnum.unit:
        return 'Unité';
    }
  }
}

String unitToJson(UnitEnum unit) => unit.name;

UnitEnum unitFromJson(String unit) {
  switch (unit) {
    case 't':
      return UnitEnum.t;
    case 'kg':
      return UnitEnum.kg;
    case 'g':
      return UnitEnum.g;
    case 'l':
      return UnitEnum.l;
    case 'unit':
      return UnitEnum.unit;
    default:
      throw ArgumentError('Unité invalide : $unit');
  }
}
