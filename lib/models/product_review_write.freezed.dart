// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_review_write.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductReviewWrite _$ProductReviewWriteFromJson(Map<String, dynamic> json) {
  return _ProductReviewWrite.fromJson(json);
}

/// @nodoc
mixin _$ProductReviewWrite {
  int get product => throw _privateConstructorUsedError;
  RatingEnum get rating => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;

  /// Serializes this ProductReviewWrite to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductReviewWrite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductReviewWriteCopyWith<ProductReviewWrite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReviewWriteCopyWith<$Res> {
  factory $ProductReviewWriteCopyWith(
          ProductReviewWrite value, $Res Function(ProductReviewWrite) then) =
      _$ProductReviewWriteCopyWithImpl<$Res, ProductReviewWrite>;
  @useResult
  $Res call({int product, RatingEnum rating, String? comment});
}

/// @nodoc
class _$ProductReviewWriteCopyWithImpl<$Res, $Val extends ProductReviewWrite>
    implements $ProductReviewWriteCopyWith<$Res> {
  _$ProductReviewWriteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductReviewWrite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? rating = null,
    Object? comment = freezed,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as RatingEnum,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductReviewWriteImplCopyWith<$Res>
    implements $ProductReviewWriteCopyWith<$Res> {
  factory _$$ProductReviewWriteImplCopyWith(_$ProductReviewWriteImpl value,
          $Res Function(_$ProductReviewWriteImpl) then) =
      __$$ProductReviewWriteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int product, RatingEnum rating, String? comment});
}

/// @nodoc
class __$$ProductReviewWriteImplCopyWithImpl<$Res>
    extends _$ProductReviewWriteCopyWithImpl<$Res, _$ProductReviewWriteImpl>
    implements _$$ProductReviewWriteImplCopyWith<$Res> {
  __$$ProductReviewWriteImplCopyWithImpl(_$ProductReviewWriteImpl _value,
      $Res Function(_$ProductReviewWriteImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductReviewWrite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? rating = null,
    Object? comment = freezed,
  }) {
    return _then(_$ProductReviewWriteImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as RatingEnum,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductReviewWriteImpl implements _ProductReviewWrite {
  const _$ProductReviewWriteImpl(
      {required this.product, required this.rating, this.comment});

  factory _$ProductReviewWriteImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductReviewWriteImplFromJson(json);

  @override
  final int product;
  @override
  final RatingEnum rating;
  @override
  final String? comment;

  @override
  String toString() {
    return 'ProductReviewWrite(product: $product, rating: $rating, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReviewWriteImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, product, rating, comment);

  /// Create a copy of ProductReviewWrite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReviewWriteImplCopyWith<_$ProductReviewWriteImpl> get copyWith =>
      __$$ProductReviewWriteImplCopyWithImpl<_$ProductReviewWriteImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductReviewWriteImplToJson(
      this,
    );
  }
}

abstract class _ProductReviewWrite implements ProductReviewWrite {
  const factory _ProductReviewWrite(
      {required final int product,
      required final RatingEnum rating,
      final String? comment}) = _$ProductReviewWriteImpl;

  factory _ProductReviewWrite.fromJson(Map<String, dynamic> json) =
      _$ProductReviewWriteImpl.fromJson;

  @override
  int get product;
  @override
  RatingEnum get rating;
  @override
  String? get comment;

  /// Create a copy of ProductReviewWrite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductReviewWriteImplCopyWith<_$ProductReviewWriteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
