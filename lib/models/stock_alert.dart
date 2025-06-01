import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_alert.freezed.dart';
part 'stock_alert.g.dart';

@freezed
class StockAlert with _$StockAlert {
  const factory StockAlert({
    required int id,
    required int product,
    required int threshold,
    @JsonKey(name: 'is_active') bool? isActive,
  }) = _StockAlert;

  factory StockAlert.fromJson(Map<String, dynamic> json) =>
      _$StockAlertFromJson(json);
}
