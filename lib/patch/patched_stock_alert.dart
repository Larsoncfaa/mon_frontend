import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_stock_alert.freezed.dart';
part 'patched_stock_alert.g.dart';

@freezed
abstract class PatchedStockAlert with _$PatchedStockAlert {
  const factory PatchedStockAlert({
    int? id,
    int? product,
    int? threshold,
    @JsonKey(name: 'is_active') bool? isActive,
    int? warehouse,
    String? message,
  }) = _PatchedStockAlert;

  factory PatchedStockAlert.fromJson(Map<String, dynamic> json) =>
      _$PatchedStockAlertFromJson(json);
}
