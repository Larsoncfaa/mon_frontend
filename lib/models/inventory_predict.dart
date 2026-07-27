import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_predict.freezed.dart';
part 'inventory_predict.g.dart';

@freezed
abstract class InventoryPredict with _$InventoryPredict {
  const factory InventoryPredict({
    @JsonKey(name: 'product_id') required int productId,
    required int days,
    @JsonKey(name: 'predicted_inventory') required double predictedInventory,
  }) = _InventoryPredict;

  factory InventoryPredict.fromJson(Map<String, dynamic> json) =>
      _$InventoryPredictFromJson(json);
}
