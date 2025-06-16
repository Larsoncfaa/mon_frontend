// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return _CartItem.fromJson(json);
}

/// @nodoc
mixin _$CartItem {
  int? get id => throw _privateConstructorUsedError;

  /// 🔄 Tu peux aussi remplacer `Map<String, dynamic>` par `Product` si tu veux.
  @JsonKey(name: 'product')
  Map<String, dynamic> get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  int? get productId => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  @StringToDoubleConverter()
  @JsonKey(name: 'total_price')
  double? get totalPrice => throw _privateConstructorUsedError;

  /// Serializes this CartItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'product') Map<String, dynamic> product,
      @JsonKey(name: 'product_id') int? productId,
      int? quantity,
      @StringToDoubleConverter()
      @JsonKey(name: 'total_price')
      double? totalPrice});
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? product = null,
    Object? productId = freezed,
    Object? quantity = freezed,
    Object? totalPrice = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartItemImplCopyWith<$Res>
    implements $CartItemCopyWith<$Res> {
  factory _$$CartItemImplCopyWith(
          _$CartItemImpl value, $Res Function(_$CartItemImpl) then) =
      __$$CartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'product') Map<String, dynamic> product,
      @JsonKey(name: 'product_id') int? productId,
      int? quantity,
      @StringToDoubleConverter()
      @JsonKey(name: 'total_price')
      double? totalPrice});
}

/// @nodoc
class __$$CartItemImplCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$CartItemImpl>
    implements _$$CartItemImplCopyWith<$Res> {
  __$$CartItemImplCopyWithImpl(
      _$CartItemImpl _value, $Res Function(_$CartItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? product = null,
    Object? productId = freezed,
    Object? quantity = freezed,
    Object? totalPrice = freezed,
  }) {
    return _then(_$CartItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      product: null == product
          ? _value._product
          : product // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemImpl implements _CartItem {
  const _$CartItemImpl(
      {required this.id,
      @JsonKey(name: 'product') required final Map<String, dynamic> product,
      @JsonKey(name: 'product_id') required this.productId,
      this.quantity,
      @StringToDoubleConverter()
      @JsonKey(name: 'total_price')
      required this.totalPrice})
      : _product = product;

  factory _$CartItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemImplFromJson(json);

  @override
  final int? id;

  /// 🔄 Tu peux aussi remplacer `Map<String, dynamic>` par `Product` si tu veux.
  final Map<String, dynamic> _product;

  /// 🔄 Tu peux aussi remplacer `Map<String, dynamic>` par `Product` si tu veux.
  @override
  @JsonKey(name: 'product')
  Map<String, dynamic> get product {
    if (_product is EqualUnmodifiableMapView) return _product;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_product);
  }

  @override
  @JsonKey(name: 'product_id')
  final int? productId;
  @override
  final int? quantity;
  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'total_price')
  final double? totalPrice;

  @override
  String toString() {
    return 'CartItem(id: $id, product: $product, productId: $productId, quantity: $quantity, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._product, _product) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_product),
      productId,
      quantity,
      totalPrice);

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      __$$CartItemImplCopyWithImpl<_$CartItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemImplToJson(
      this,
    );
  }
}

abstract class _CartItem implements CartItem {
  const factory _CartItem(
      {required final int? id,
      @JsonKey(name: 'product') required final Map<String, dynamic> product,
      @JsonKey(name: 'product_id') required final int? productId,
      final int? quantity,
      @StringToDoubleConverter()
      @JsonKey(name: 'total_price')
      required final double? totalPrice}) = _$CartItemImpl;

  factory _CartItem.fromJson(Map<String, dynamic> json) =
      _$CartItemImpl.fromJson;

  @override
  int? get id;

  /// 🔄 Tu peux aussi remplacer `Map<String, dynamic>` par `Product` si tu veux.
  @override
  @JsonKey(name: 'product')
  Map<String, dynamic> get product;
  @override
  @JsonKey(name: 'product_id')
  int? get productId;
  @override
  int? get quantity;
  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'total_price')
  double? get totalPrice;

  /// Create a copy of CartItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
