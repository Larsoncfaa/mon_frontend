import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_discount.freezed.dart';
part 'product_discount.g.dart';

@freezed
class ProductDiscount with _$ProductDiscount {
  const factory ProductDiscount({
    required int id,
    required int product,
    @JsonKey(
      name: 'discount_percent',
      fromJson: _stringToDouble,
      toJson: _doubleToString,
    )
    required double discountPercent,
  }) = _ProductDiscount;

  factory ProductDiscount.fromJson(Map<String, dynamic> json) =>
      _$ProductDiscountFromJson(json);
}
// 💡 Conversion personnalisée
double _stringToDouble(dynamic value) {
  if (value is num) return value.toDouble();
  if (value is String) {
    final parsed = double.tryParse(value.replaceAll(',', '.'));
    return parsed ?? 0.0;
  }
  return 0.0;
}

String _doubleToString(double value) => value.toStringAsFixed(2);