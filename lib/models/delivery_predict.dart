import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_predict.freezed.dart';
part 'delivery_predict.g.dart';

@freezed
abstract class DeliveryPredict with _$DeliveryPredict {
  const factory DeliveryPredict({
    @JsonKey(name: 'product_id') required int productId,
    required int quantity,
    required String prediction,
  }) = _DeliveryPredict;

  factory DeliveryPredict.fromJson(Map<String, dynamic> json) =>
      _$DeliveryPredictFromJson(json);
}
