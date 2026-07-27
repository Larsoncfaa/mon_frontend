import 'package:freezed_annotation/freezed_annotation.dart';

part 'promo_code.freezed.dart';
part 'promo_code.g.dart';

@freezed
abstract class PromoCode with _$PromoCode {
  const factory PromoCode({
    required int id,
    required String code,
    @JsonKey(name: 'discount_percent') required double discountPercent,
    @JsonKey(name: 'valid_from') required DateTime validFrom,
    @JsonKey(name: 'valid_until') required DateTime validUntil,
    @JsonKey(name: 'is_active') required bool isActive,
  }) = _PromoCode;

  factory PromoCode.fromJson(Map<String, dynamic> json) =>
      _$PromoCodeFromJson(json);
}
