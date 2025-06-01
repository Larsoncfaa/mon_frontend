import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/product_discount.dart';


part 'paginated_product_discount_list.freezed.dart';
part 'paginated_product_discount_list.g.dart';

@freezed
class PaginatedProductDiscountList with _$PaginatedProductDiscountList {
  const factory PaginatedProductDiscountList({
    required int count,
    String? next,
    String? previous,
    required List<ProductDiscount> results,
  }) = _PaginatedProductDiscountList;

  factory PaginatedProductDiscountList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedProductDiscountListFromJson(json);
}
