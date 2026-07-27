import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_stock_movement.freezed.dart';
part 'patched_stock_movement.g.dart';

@freezed
abstract class PatchedStockMovement with _$PatchedStockMovement {
  const factory PatchedStockMovement({
    int? id,
    @JsonKey(name: 'product_id') int? productId,
    int? warehouse,
    @JsonKey(name: 'movement_type') String? movementType,
    int? quantity,
    DateTime? timestamp,
    String? destination,
  }) = _PatchedStockMovement;

  factory PatchedStockMovement.fromJson(Map<String, dynamic> json) =>
      _$PatchedStockMovementFromJson(json);
}
