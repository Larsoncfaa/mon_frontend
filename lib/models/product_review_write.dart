import 'package:freezed_annotation/freezed_annotation.dart';
import 'rating_enum.dart';

part 'product_review_write.freezed.dart';
part 'product_review_write.g.dart';

@freezed
class ProductReviewWrite with _$ProductReviewWrite {
  const factory ProductReviewWrite({
    required int product,
    required RatingEnum rating,
    String? comment,
  }) = _ProductReviewWrite;

  factory ProductReviewWrite.fromJson(Map<String, dynamic> json) =>
      _$ProductReviewWriteFromJson(json);
}
