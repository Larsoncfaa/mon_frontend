// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductReviewImpl _$$ProductReviewImplFromJson(Map<String, dynamic> json) =>
    _$ProductReviewImpl(
      id: (json['id'] as num).toInt(),
      client: (json['client'] as num).toInt(),
      product: (json['product'] as num).toInt(),
      rating: $enumDecode(_$RatingEnumEnumMap, json['rating']),
      comment: json['comment'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      verifiedPurchase: json['verified_purchase'] as bool?,
    );

Map<String, dynamic> _$$ProductReviewImplToJson(_$ProductReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'client': instance.client,
      'product': instance.product,
      'rating': _$RatingEnumEnumMap[instance.rating]!,
      'comment': instance.comment,
      'created_at': instance.createdAt.toIso8601String(),
      'verified_purchase': instance.verifiedPurchase,
    };

const _$RatingEnumEnumMap = {
  RatingEnum.one: 1,
  RatingEnum.two: 2,
  RatingEnum.three: 3,
  RatingEnum.four: 4,
  RatingEnum.five: 5,
};
