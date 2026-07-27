import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_input.freezed.dart';
part 'sales_input.g.dart';

@freezed
abstract class SalesInput with _$SalesInput {
  const factory SalesInput({
    @JsonKey(name: 'product_id') required int productId,
    @JsonKey(name: 'history_days') required int historyDays,
    @JsonKey(name: 'forecast_days') required int forecastDays,
  }) = _SalesInput;

  factory SalesInput.fromJson(Map<String, dynamic> json) =>
      _$SalesInputFromJson(json);
}
