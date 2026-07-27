import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_stock_level.freezed.dart';
part 'patched_stock_level.g.dart';

@freezed
abstract class PatchedStockLevel with _$PatchedStockLevel {
  const factory PatchedStockLevel({
    int? id,
    @JsonKey(name: 'product_id') int? productId,
    int? quantity,
    int? threshold,
  }) = _PatchedStockLevel;

  factory PatchedStockLevel.fromJson(Map<String, dynamic> json) =>
      _$PatchedStockLevelFromJson(json);
}
