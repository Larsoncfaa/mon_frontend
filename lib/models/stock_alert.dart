import 'package:freezed_annotation/freezed_annotation.dart';

import 'product.dart';
import 'warehouse.dart';

part 'stock_alert.freezed.dart';
part 'stock_alert.g.dart';

@freezed
abstract class StockAlert with _$StockAlert {
  const factory StockAlert({
    required int id,
    required Product product,
    required int threshold,
    @JsonKey(name: 'is_active') bool? isActive,
    Warehouse? warehouse,
  }) = _StockAlert;

  factory StockAlert.fromJson(Map<String, dynamic> json) =>
      _$StockAlertFromJson(json);
}
