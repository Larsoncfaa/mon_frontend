import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_discount.freezed.dart';
part 'product_discount.g.dart';

@freezed
abstract class ProductDiscount with _$ProductDiscount {
  const factory ProductDiscount({
    required int id,
    required int product,
    @JsonKey(name: 'discount_percent') required double discountPercent,
    @JsonKey(name: 'start_date') required DateTime startDate,
    @JsonKey(name: 'end_date') required DateTime endDate,
  }) = _ProductDiscount;

  factory ProductDiscount.fromJson(Map<String, dynamic> json) =>
      _$ProductDiscountFromJson(json);
}
