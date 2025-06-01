import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/stock_movement.dart';

part 'paginated_stock_movement_list.freezed.dart';
part 'paginated_stock_movement_list.g.dart';

@freezed
class PaginatedStockMovementList with _$PaginatedStockMovementList {
  const factory PaginatedStockMovementList({
    required int count, // Nombre total d’éléments
    String? next,       // URL de la page suivante
    String? previous,   // URL de la page précédente
    required List<StockMovement> results, // Liste des mouvements
  }) = _PaginatedStockMovementList;

  factory PaginatedStockMovementList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedStockMovementListFromJson(json);
}
