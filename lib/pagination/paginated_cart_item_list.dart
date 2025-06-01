// paginated_cart_item_list.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/cart_item.dart';

part 'paginated_cart_item_list.freezed.dart';
part 'paginated_cart_item_list.g.dart';

@freezed
class PaginatedCartItemList with _$PaginatedCartItemList {
  const factory PaginatedCartItemList({
    required int count,
    String? next,
    String? previous,
    required List<CartItem> results,
  }) = _PaginatedCartItemList;

  factory PaginatedCartItemList.fromJson(Map<String, dynamic> json) => _$PaginatedCartItemListFromJson(json);
}
