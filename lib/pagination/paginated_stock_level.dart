import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/stock_level.dart';


part 'paginated_stock_level.freezed.dart';
part 'paginated_stock_level.g.dart';

@freezed
class PaginatedStockLevel with _$PaginatedStockLevel {
  const factory PaginatedStockLevel({
    required int count,
    String? next,
    String? previous,
    required List<StockLevel> results,
  }) = _PaginatedStockLevel;

  factory PaginatedStockLevel.fromJson(Map<String, dynamic> json) =>
      _$PaginatedStockLevelFromJson(json);
}
