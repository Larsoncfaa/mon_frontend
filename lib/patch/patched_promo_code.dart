import 'package:freezed_annotation/freezed_annotation.dart';

part 'patched_promo_code.freezed.dart';
part 'patched_promo_code.g.dart';

@freezed
abstract class PatchedPromoCode with _$PatchedPromoCode {
  const factory PatchedPromoCode({
    int? id,
    String? code,
    @JsonKey(name: 'discount_percent') double? discountPercent,
    @JsonKey(name: 'valid_from') DateTime? validFrom,
    @JsonKey(name: 'valid_until') DateTime? validUntil,
    @JsonKey(name: 'is_active') bool? isActive,
  }) = _PatchedPromoCode;

  factory PatchedPromoCode.fromJson(Map<String, dynamic> json) =>
      _$PatchedPromoCodeFromJson(json);
}
