import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_stock_level.freezed.dart';
part 'patched_stock_level.g.dart';

@freezed
class PatchedStockLevel with _$PatchedStockLevel {
  const factory PatchedStockLevel({
    int? productId,
    int? warehouseId,
    double? quantity,
    double? threshold,
    DateTime? updatedAt,
  }) = _PatchedStockLevel;

  factory PatchedStockLevel.fromJson(Map<String, dynamic> json) =>
      _$PatchedStockLevelFromJson(json);
}
