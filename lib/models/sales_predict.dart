import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_predict.freezed.dart';
part 'sales_predict.g.dart';

@freezed
abstract class SalesPredict with _$SalesPredict {
  const factory SalesPredict({
    @JsonKey(name: 'product_id') required int productId,
    required String period,
    @JsonKey(name: 'predicted_sales') required double predictedSales,
  }) = _SalesPredict;

  factory SalesPredict.fromJson(Map<String, dynamic> json) =>
      _$SalesPredictFromJson(json);
}
