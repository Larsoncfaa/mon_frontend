import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_stock_alert.freezed.dart';
part 'patched_stock_alert.g.dart';

@freezed
class PatchedStockAlert with _$PatchedStockAlert {
  const factory PatchedStockAlert({
    int? product,
    int? quantity,
    String? message,
  }) = _PatchedStockAlert;

  factory PatchedStockAlert.fromJson(Map<String, dynamic> json) =>
      _$PatchedStockAlertFromJson(json);
}
