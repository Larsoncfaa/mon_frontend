import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_review_write.freezed.dart';
part 'product_review_write.g.dart';

@freezed
abstract class ProductReviewWrite with _$ProductReviewWrite {
  const factory ProductReviewWrite({
    required int product,
    required int rating,
    String? comment,
    required int client,
    @Default(false) bool verifiedPurchase,
  }) = _ProductReviewWrite;

  factory ProductReviewWrite.fromJson(Map<String, dynamic> json) =>
      _$ProductReviewWriteFromJson(json);
}
