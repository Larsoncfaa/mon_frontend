// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_review_write.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductReviewWrite _$ProductReviewWriteFromJson(Map<String, dynamic> json) =>
    _ProductReviewWrite(
      product: (json['product'] as num).toInt(),
      rating: (json['rating'] as num).toInt(),
      comment: json['comment'] as String?,
      client: (json['client'] as num).toInt(),
      verifiedPurchase: json['verifiedPurchase'] as bool? ?? false,
    );

Map<String, dynamic> _$ProductReviewWriteToJson(_ProductReviewWrite instance) =>
    <String, dynamic>{
      'product': instance.product,
      'rating': instance.rating,
      'comment': instance.comment,
      'client': instance.client,
      'verifiedPurchase': instance.verifiedPurchase,
    };
