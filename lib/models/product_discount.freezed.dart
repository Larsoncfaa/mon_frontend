// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_discount.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductDiscount _$ProductDiscountFromJson(Map<String, dynamic> json) {
  return _ProductDiscount.fromJson(json);
}

/// @nodoc
mixin _$ProductDiscount {
  int get id => throw _privateConstructorUsedError;
  int get product => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'discount_percent',
      fromJson: _stringToDouble,
      toJson: _doubleToString)
  double get discountPercent => throw _privateConstructorUsedError;

  /// Serializes this ProductDiscount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductDiscount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductDiscountCopyWith<ProductDiscount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDiscountCopyWith<$Res> {
  factory $ProductDiscountCopyWith(
          ProductDiscount value, $Res Function(ProductDiscount) then) =
      _$ProductDiscountCopyWithImpl<$Res, ProductDiscount>;
  @useResult
  $Res call(
      {int id,
      int product,
      @JsonKey(
          name: 'discount_percent',
          fromJson: _stringToDouble,
          toJson: _doubleToString)
      double discountPercent});
}

/// @nodoc
class _$ProductDiscountCopyWithImpl<$Res, $Val extends ProductDiscount>
    implements $ProductDiscountCopyWith<$Res> {
  _$ProductDiscountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductDiscount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? discountPercent = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as int,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductDiscountImplCopyWith<$Res>
    implements $ProductDiscountCopyWith<$Res> {
  factory _$$ProductDiscountImplCopyWith(_$ProductDiscountImpl value,
          $Res Function(_$ProductDiscountImpl) then) =
      __$$ProductDiscountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int product,
      @JsonKey(
          name: 'discount_percent',
          fromJson: _stringToDouble,
          toJson: _doubleToString)
      double discountPercent});
}

/// @nodoc
class __$$ProductDiscountImplCopyWithImpl<$Res>
    extends _$ProductDiscountCopyWithImpl<$Res, _$ProductDiscountImpl>
    implements _$$ProductDiscountImplCopyWith<$Res> {
  __$$ProductDiscountImplCopyWithImpl(
      _$ProductDiscountImpl _value, $Res Function(_$ProductDiscountImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductDiscount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? discountPercent = null,
  }) {
    return _then(_$ProductDiscountImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as int,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductDiscountImpl implements _ProductDiscount {
  const _$ProductDiscountImpl(
      {required this.id,
      required this.product,
      @JsonKey(
          name: 'discount_percent',
          fromJson: _stringToDouble,
          toJson: _doubleToString)
      required this.discountPercent});

  factory _$ProductDiscountImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductDiscountImplFromJson(json);

  @override
  final int id;
  @override
  final int product;
  @override
  @JsonKey(
      name: 'discount_percent',
      fromJson: _stringToDouble,
      toJson: _doubleToString)
  final double discountPercent;

  @override
  String toString() {
    return 'ProductDiscount(id: $id, product: $product, discountPercent: $discountPercent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDiscountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, product, discountPercent);

  /// Create a copy of ProductDiscount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDiscountImplCopyWith<_$ProductDiscountImpl> get copyWith =>
      __$$ProductDiscountImplCopyWithImpl<_$ProductDiscountImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductDiscountImplToJson(
      this,
    );
  }
}

abstract class _ProductDiscount implements ProductDiscount {
  const factory _ProductDiscount(
      {required final int id,
      required final int product,
      @JsonKey(
          name: 'discount_percent',
          fromJson: _stringToDouble,
          toJson: _doubleToString)
      required final double discountPercent}) = _$ProductDiscountImpl;

  factory _ProductDiscount.fromJson(Map<String, dynamic> json) =
      _$ProductDiscountImpl.fromJson;

  @override
  int get id;
  @override
  int get product;
  @override
  @JsonKey(
      name: 'discount_percent',
      fromJson: _stringToDouble,
      toJson: _doubleToString)
  double get discountPercent;

  /// Create a copy of ProductDiscount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductDiscountImplCopyWith<_$ProductDiscountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
