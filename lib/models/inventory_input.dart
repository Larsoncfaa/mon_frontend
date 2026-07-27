import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_input.freezed.dart';
part 'inventory_input.g.dart';

@freezed
abstract class InventoryInput with _$InventoryInput {
  const factory InventoryInput({
    @JsonKey(name: 'product_id') required int productId,
    @JsonKey(name: 'window_days') required int windowDays,
  }) = _InventoryInput;

  factory InventoryInput.fromJson(Map<String, dynamic> json) =>
      _$InventoryInputFromJson(json);
}
