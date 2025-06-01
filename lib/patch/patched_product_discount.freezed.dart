// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_product_discount.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatchedProductDiscount _$PatchedProductDiscountFromJson(
    Map<String, dynamic> json) {
  return _PatchedProductDiscount.fromJson(json);
}

/// @nodoc
mixin _$PatchedProductDiscount {
  /// Identifiant du rabais (facultatif pour le PATCH).
  int? get id => throw _privateConstructorUsedError;

  /// Identifiant du produit concerné.
  int? get product => throw _privateConstructorUsedError;

  /// Pourcentage de réduction.
  @JsonKey(name: 'discount_percent')
  double? get discountPercent => throw _privateConstructorUsedError;

  /// Serializes this PatchedProductDiscount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatchedProductDiscount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatchedProductDiscountCopyWith<PatchedProductDiscount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatchedProductDiscountCopyWith<$Res> {
  factory $PatchedProductDiscountCopyWith(PatchedProductDiscount value,
          $Res Function(PatchedProductDiscount) then) =
      _$PatchedProductDiscountCopyWithImpl<$Res, PatchedProductDiscount>;
  @useResult
  $Res call(
      {int? id,
      int? product,
      @JsonKey(name: 'discount_percent') double? discountPercent});
}

/// @nodoc
class _$PatchedProductDiscountCopyWithImpl<$Res,
        $Val extends PatchedProductDiscount>
    implements $PatchedProductDiscountCopyWith<$Res> {
  _$PatchedProductDiscountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatchedProductDiscount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? product = freezed,
    Object? discountPercent = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as int?,
      discountPercent: freezed == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatchedProductDiscountImplCopyWith<$Res>
    implements $PatchedProductDiscountCopyWith<$Res> {
  factory _$$PatchedProductDiscountImplCopyWith(
          _$PatchedProductDiscountImpl value,
          $Res Function(_$PatchedProductDiscountImpl) then) =
      __$$PatchedProductDiscountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? product,
      @JsonKey(name: 'discount_percent') double? discountPercent});
}

/// @nodoc
class __$$PatchedProductDiscountImplCopyWithImpl<$Res>
    extends _$PatchedProductDiscountCopyWithImpl<$Res,
        _$PatchedProductDiscountImpl>
    implements _$$PatchedProductDiscountImplCopyWith<$Res> {
  __$$PatchedProductDiscountImplCopyWithImpl(
      _$PatchedProductDiscountImpl _value,
      $Res Function(_$PatchedProductDiscountImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatchedProductDiscount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? product = freezed,
    Object? discountPercent = freezed,
  }) {
    return _then(_$PatchedProductDiscountImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as int?,
      discountPercent: freezed == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatchedProductDiscountImpl implements _PatchedProductDiscount {
  const _$PatchedProductDiscountImpl(
      {this.id,
      this.product,
      @JsonKey(name: 'discount_percent') this.discountPercent});

  factory _$PatchedProductDiscountImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatchedProductDiscountImplFromJson(json);

  /// Identifiant du rabais (facultatif pour le PATCH).
  @override
  final int? id;

  /// Identifiant du produit concerné.
  @override
  final int? product;

  /// Pourcentage de réduction.
  @override
  @JsonKey(name: 'discount_percent')
  final double? discountPercent;

  @override
  String toString() {
    return 'PatchedProductDiscount(id: $id, product: $product, discountPercent: $discountPercent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatchedProductDiscountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, product, discountPercent);

  /// Create a copy of PatchedProductDiscount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchedProductDiscountImplCopyWith<_$PatchedProductDiscountImpl>
      get copyWith => __$$PatchedProductDiscountImplCopyWithImpl<
          _$PatchedProductDiscountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatchedProductDiscountImplToJson(
      this,
    );
  }
}

abstract class _PatchedProductDiscount implements PatchedProductDiscount {
  const factory _PatchedProductDiscount(
          {final int? id,
          final int? product,
          @JsonKey(name: 'discount_percent') final double? discountPercent}) =
      _$PatchedProductDiscountImpl;

  factory _PatchedProductDiscount.fromJson(Map<String, dynamic> json) =
      _$PatchedProductDiscountImpl.fromJson;

  /// Identifiant du rabais (facultatif pour le PATCH).
  @override
  int? get id;

  /// Identifiant du produit concerné.
  @override
  int? get product;

  /// Pourcentage de réduction.
  @override
  @JsonKey(name: 'discount_percent')
  double? get discountPercent;

  /// Create a copy of PatchedProductDiscount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchedProductDiscountImplCopyWith<_$PatchedProductDiscountImpl>
      get copyWith => throw _privateConstructorUsedError;
}
