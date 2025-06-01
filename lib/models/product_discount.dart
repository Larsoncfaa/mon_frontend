import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_discount.freezed.dart';
part 'product_discount.g.dart';

@freezed
class ProductDiscount with _$ProductDiscount {
  const factory ProductDiscount({
    required int id,
    required int product,
    @JsonKey(name: 'discount_percent') required double discountPercent,
  }) = _ProductDiscount;

  factory ProductDiscount.fromJson(Map<String, dynamic> json) =>
      _$ProductDiscountFromJson(json);
}
