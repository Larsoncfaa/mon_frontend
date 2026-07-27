import 'package:freezed_annotation/freezed_annotation.dart';
import 'product.dart';

part 'stock_level.freezed.dart';
part 'stock_level.g.dart';

@freezed
abstract class StockLevel with _$StockLevel {
  const factory StockLevel({
    required int id,
    @JsonKey(name: 'product_id') required int productId,
    required Product product,
    required int quantity,
  }) = _StockLevel;

  factory StockLevel.fromJson(Map<String, dynamic> json) =>
      _$StockLevelFromJson(json);
}
