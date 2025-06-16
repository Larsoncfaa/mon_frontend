import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_movement.freezed.dart';
part 'stock_movement.g.dart';

enum MovementTypeEnum {
  in_,
  out,
  adj,
}

String movementTypeEnumToString(MovementTypeEnum type) {
  switch (type) {
    case MovementTypeEnum.in_:
      return 'IN';
    case MovementTypeEnum.out:
      return 'OUT';
    case MovementTypeEnum.adj:
      return 'ADJ';
  }
}

MovementTypeEnum stringToMovementTypeEnum(String str) {
  switch (str) {
    case 'IN':
      return MovementTypeEnum.in_;
    case 'OUT':
      return MovementTypeEnum.out;
    case 'ADJ':
      return MovementTypeEnum.adj;
    default:
      throw Exception('Type de mouvement inconnu : $str');
  }
}
@freezed
class StockMovement with _$StockMovement {
  const factory StockMovement({
    required int id,
    required int product,
    required int warehouse,
    @JsonKey(name: 'stock_applied')
    @Default(false)
    bool stockApplied,
    int? batch,
    @JsonKey(name: 'is_archived') // ✅ Ajout crucial ici
    @Default(false) bool isArchived,
    // ✅ Ajouté ici
    @JsonKey(
      name: 'movement_type',
      fromJson: stringToMovementTypeEnum,
      toJson: movementTypeEnumToString,
    )
    required MovementTypeEnum movementType,
    required int quantity,
    required DateTime timestamp,
    int? user,
    // ✅ Ajouter ce champ
    @JsonKey(name: 'product_name')
    String? productName,
  }) = _StockMovement;

  factory StockMovement.fromJson(Map<String, dynamic> json) =>
      _$StockMovementFromJson(json);
}
