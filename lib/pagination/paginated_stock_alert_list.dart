import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/stock_alert.dart';


part 'paginated_stock_alert_list.freezed.dart';
part 'paginated_stock_alert_list.g.dart';

@freezed
class PaginatedStockAlertList with _$PaginatedStockAlertList {
  const factory PaginatedStockAlertList({
    required int count,
    String? next,
    String? previous,
    required List<StockAlert> results,
  }) = _PaginatedStockAlertList;

  factory PaginatedStockAlertList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedStockAlertListFromJson(json);
}
