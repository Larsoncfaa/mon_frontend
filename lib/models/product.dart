import 'package:freezed_annotation/freezed_annotation.dart';

import 'double_converter.dart'; // ← indispensable ici aussi

part 'product.freezed.dart';
part 'product.g.dart';

enum UnitEnum {
  @JsonValue('t') t,
  @JsonValue('kg') kg,
  @JsonValue('g') g,
  @JsonValue('l') l,
  @JsonValue('unit') unit,
}

extension UnitEnumExtension on UnitEnum {
  String get label {
    switch (this) {
      case UnitEnum.t: return 't';
      case UnitEnum.kg: return 'kg';
      case UnitEnum.g: return 'g';
      case UnitEnum.l: return 'l';
      case UnitEnum.unit: return 'Unité';
    }
  }
}

String unitToJson(UnitEnum unit) => unit.name;

UnitEnum unitFromJson(String unit) {
  switch (unit) {
    case 't': return UnitEnum.t;
    case 'kg': return UnitEnum.kg;
    case 'g': return UnitEnum.g;
    case 'l': return UnitEnum.l;
    case 'unit': return UnitEnum.unit;
    default: throw ArgumentError('Unité invalide : $unit');
  }
}

@freezed
class Product with _$Product {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Product({
    required int id,
    required String category,
    String? image,
    required String name,
    String? description,

    @JsonKey(includeIfNull: true)
    int? quantityInStock,

    @JsonKey(fromJson: unitFromJson, toJson: unitToJson)
    required UnitEnum unit,

    @StringToDoubleConverter() required double? purchasePrice,
    @StringToDoubleConverter() required double? sellingPrice,


    DateTime? expirationDate,
    String? qrCodeImage,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
