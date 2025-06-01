import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_level.freezed.dart';
part 'stock_level.g.dart';

@freezed
class StockLevel with _$StockLevel {
  const factory StockLevel({
    required int id,
    required int product,
    required int warehouse,

    /// Minimum value: 0, Maximum value: 4294967295
    required int quantity,
  }) = _StockLevel;

  factory StockLevel.fromJson(Map<String, dynamic> json) =>
      _$StockLevelFromJson(json);
}
