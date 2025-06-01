import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/cart.dart';

part 'paginated_cart_list.freezed.dart';
part 'paginated_cart_list.g.dart';

/// Liste paginée de paniers
@freezed
class PaginatedCartList with _$PaginatedCartList {
  const factory PaginatedCartList({
    required int count,
    String? next,
    String? previous,
    required List<Cart> results,
  }) = _PaginatedCartList;

  factory PaginatedCartList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedCartListFromJson(json);
}
