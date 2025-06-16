import 'package:freezed_annotation/freezed_annotation.dart';

import 'product.dart';
import 'warehouse.dart';

part 'stock_alert.freezed.dart';
part 'stock_alert.g.dart';

@freezed
class StockAlert with _$StockAlert {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory StockAlert({
    required int id,
    required Product product,           // ← Maintenant un objet Product complet
    required int threshold,
    @JsonKey(name: 'is_active') bool? isActive,
    Warehouse? warehouse,               // ← Optionnel mais peut être un objet complet aussi si besoin
  }) = _StockAlert;

  factory StockAlert.fromJson(Map<String, dynamic> json) =>
      _$StockAlertFromJson(json);
}
