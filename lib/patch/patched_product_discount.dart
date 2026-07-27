import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_product_discount.freezed.dart';
part 'patched_product_discount.g.dart';

@freezed
abstract class PatchedProductDiscount with _$PatchedProductDiscount {
  const factory PatchedProductDiscount({
    int? id,
    int? product,
    @JsonKey(name: 'discount_percent') double? discountPercent,
    @JsonKey(name: 'start_date') DateTime? startDate,
    @JsonKey(name: 'end_date') DateTime? endDate,
  }) = _PatchedProductDiscount;

  factory PatchedProductDiscount.fromJson(Map<String, dynamic> json) =>
      _$PatchedProductDiscountFromJson(json);
}
