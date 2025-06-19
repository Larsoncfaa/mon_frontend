// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_review_write.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductReviewWriteImpl _$$ProductReviewWriteImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductReviewWriteImpl(
      product: (json['product'] as num).toInt(),
      rating: $enumDecode(_$RatingEnumEnumMap, json['rating']),
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$$ProductReviewWriteImplToJson(
        _$ProductReviewWriteImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'rating': _$RatingEnumEnumMap[instance.rating]!,
      'comment': instance.comment,
    };

const _$RatingEnumEnumMap = {
  RatingEnum.one: 1,
  RatingEnum.two: 2,
  RatingEnum.three: 3,
  RatingEnum.four: 4,
  RatingEnum.five: 5,
};
