import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/stock_movement.dart';

part 'paginated_stock_movement_list.freezed.dart';
part 'paginated_stock_movement_list.g.dart';

@freezed
abstract class PaginatedStockMovementList with _$PaginatedStockMovementList {
  const factory PaginatedStockMovementList({
    required int count,
    String? next,
    String? previous,
    required List<StockMovement> results,
  }) = _PaginatedStockMovementList;

  factory PaginatedStockMovementList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedStockMovementListFromJson(json);
}
