import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_review.freezed.dart';
part 'product_review.g.dart';

@freezed
abstract class ProductReview with _$ProductReview {
  const factory ProductReview({
    required int id,
    required int product,
    required int client,
    required int rating,
    String? comment,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @Default(false) bool verifiedPurchase,
  }) = _ProductReview;

  factory ProductReview.fromJson(Map<String, dynamic> json) =>
      _$ProductReviewFromJson(json);
}
