// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductReview _$ProductReviewFromJson(Map<String, dynamic> json) =>
    _ProductReview(
      id: (json['id'] as num).toInt(),
      product: (json['product'] as num).toInt(),
      client: (json['client'] as num).toInt(),
      rating: (json['rating'] as num).toInt(),
      comment: json['comment'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      verifiedPurchase: json['verifiedPurchase'] as bool? ?? false,
    );

Map<String, dynamic> _$ProductReviewToJson(_ProductReview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'client': instance.client,
      'rating': instance.rating,
      'comment': instance.comment,
      'created_at': instance.createdAt.toIso8601String(),
      'verifiedPurchase': instance.verifiedPurchase,
    };
