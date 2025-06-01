import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_stock_movement.freezed.dart';
part 'patched_stock_movement.g.dart';

@freezed
class PatchedStockMovement with _$PatchedStockMovement {
  const factory PatchedStockMovement({
    String? productId,
    String? movementType,
    int? quantity,
    String? source,
    String? destination,
    DateTime? timestamp,
  }) = _PatchedStockMovement;

  factory PatchedStockMovement.fromJson(Map<String, dynamic> json) =>
      _$PatchedStockMovementFromJson(json);
}
