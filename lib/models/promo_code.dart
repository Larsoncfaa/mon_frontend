import 'package:freezed_annotation/freezed_annotation.dart';

part 'promo_code.freezed.dart';
part 'promo_code.g.dart';

/// Représente un code promotionnel valide pour une période.
///
/// Contient le code, le pourcentage de réduction, la période de validité
/// et une éventuelle limite d'utilisation.
@freezed
class PromoCode with _$PromoCode {
  const factory PromoCode({
    required int id,
    required String code,
    @JsonKey(name: 'discount_percent') required double discountPercent,
    @JsonKey(name: 'valid_from') required DateTime validFrom,
    @JsonKey(name: 'valid_to') required DateTime validTo,
    @JsonKey(name: 'usage_limit') int? usageLimit,
  }) = _PromoCode;

  factory PromoCode.fromJson(Map<String, dynamic> json) => _$PromoCodeFromJson(json);
}
