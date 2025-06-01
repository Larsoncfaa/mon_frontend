import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_promo_code.freezed.dart';
part 'patched_promo_code.g.dart';

/// Représente un patch partiel d’un `PromoCode`
/// utilisé pour les mises à jour (PATCH HTTP).
@freezed
class PatchedPromoCode with _$PatchedPromoCode {
  const factory PatchedPromoCode({
    int? id,
    String? code,
    @JsonKey(name: 'discount_percent') double? discountPercent,
    @JsonKey(name: 'valid_from') DateTime? validFrom,
    @JsonKey(name: 'valid_to') DateTime? validTo,
    @JsonKey(name: 'usage_limit') int? usageLimit,
  }) = _PatchedPromoCode;

  factory PatchedPromoCode.fromJson(Map<String, dynamic> json) =>
      _$PatchedPromoCodeFromJson(json);
}
