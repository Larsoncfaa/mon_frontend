import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_movement.freezed.dart';
part 'stock_movement.g.dart';

enum MovementTypeEnum {
  @JsonValue('IN')
  in_,
  @JsonValue('OUT')
  out,
}

@freezed
class StockMovement with _$StockMovement {
  const factory StockMovement({
    required int id,
    required int product,
    required int warehouse,
    int? batch,
    @JsonKey(name: 'movement_type') required MovementTypeEnum movementType,
    required int quantity,
    required DateTime timestamp,
    int? user,
  }) = _StockMovement;

  factory StockMovement.fromJson(Map<String, dynamic> json) =>
      _$StockMovementFromJson(json);
}
