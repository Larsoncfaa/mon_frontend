import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/cart.dart';

part 'paginated_cart_list.freezed.dart';
part 'paginated_cart_list.g.dart';

/// Liste paginée de paniers
@freezed
class PaginatedCartList with _$PaginatedCartList {
  const factory PaginatedCartList({
    @JsonKey(defaultValue: 0) required int count, // ✅ Protection contre null
    String? next,
    String? previous,
    @Default([]) List<Cart> results, // ✅ Évite le crash si 'results' est null
  }) = _PaginatedCartList;

  factory PaginatedCartList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedCartListFromJson(json);
}
