import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/product.dart';

part 'paginated_product_list.freezed.dart';
part 'paginated_product_list.g.dart'; // <-- À ajouter

@freezed
class PaginatedProductList with _$PaginatedProductList {
  const factory PaginatedProductList({
    required int count,
    String? next,
    String? previous,
    required List<Product> results,
  }) = _PaginatedProductList;

  factory PaginatedProductList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedProductListFromJson(json);
}
