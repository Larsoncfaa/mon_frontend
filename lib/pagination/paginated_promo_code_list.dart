import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/promo_code.dart';

part 'paginated_promo_code_list.freezed.dart';
part 'paginated_promo_code_list.g.dart';

@freezed
abstract class PaginatedPromoCodeList with _$PaginatedPromoCodeList {
  const factory PaginatedPromoCodeList({
    required int count,
    String? next,
    String? previous,
    required List<PromoCode> results,
  }) = _PaginatedPromoCodeList;

  factory PaginatedPromoCodeList.fromJson(Map<String, dynamic> json) =>
      _$PaginatedPromoCodeListFromJson(json);
}
