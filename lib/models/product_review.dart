import 'package:freezed_annotation/freezed_annotation.dart';
import 'rating_enum.dart';

part 'product_review.freezed.dart';
part 'product_review.g.dart';

@freezed
class ProductReview with _$ProductReview {
  const factory ProductReview({
    required int id,
    required int product,
    required RatingEnum rating,
    String? comment,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'verified_purchase') bool? verifiedPurchase,
    @JsonKey(ignore: true) dynamic client,
  }) = _ProductReview;

  factory ProductReview.fromJson(Map<String, dynamic> json) =>
      _$ProductReviewFromJson(json);
}
