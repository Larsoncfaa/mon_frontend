// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderLine _$OrderLineFromJson(Map<String, dynamic> json) {
  return _OrderLine.fromJson(json);
}

/// @nodoc
mixin _$OrderLine {
  int get id => throw _privateConstructorUsedError;
  Product get product => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_price')
  double get unitPrice => throw _privateConstructorUsedError;

  /// Serializes this OrderLine to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderLine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderLineCopyWith<OrderLine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderLineCopyWith<$Res> {
  factory $OrderLineCopyWith(OrderLine value, $Res Function(OrderLine) then) =
      _$OrderLineCopyWithImpl<$Res, OrderLine>;
  @useResult
  $Res call(
      {int id,
      Product product,
      int quantity,
      @JsonKey(name: 'unit_price') double unitPrice});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$OrderLineCopyWithImpl<$Res, $Val extends OrderLine>
    implements $OrderLineCopyWith<$Res> {
  _$OrderLineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderLine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? quantity = null,
    Object? unitPrice = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of OrderLine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderLineImplCopyWith<$Res>
    implements $OrderLineCopyWith<$Res> {
  factory _$$OrderLineImplCopyWith(
          _$OrderLineImpl value, $Res Function(_$OrderLineImpl) then) =
      __$$OrderLineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      Product product,
      int quantity,
      @JsonKey(name: 'unit_price') double unitPrice});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$OrderLineImplCopyWithImpl<$Res>
    extends _$OrderLineCopyWithImpl<$Res, _$OrderLineImpl>
    implements _$$OrderLineImplCopyWith<$Res> {
  __$$OrderLineImplCopyWithImpl(
      _$OrderLineImpl _value, $Res Function(_$OrderLineImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderLine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? quantity = null,
    Object? unitPrice = null,
  }) {
    return _then(_$OrderLineImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitPrice: null == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderLineImpl implements _OrderLine {
  const _$OrderLineImpl(
      {required this.id,
      required this.product,
      required this.quantity,
      @JsonKey(name: 'unit_price') required this.unitPrice});

  factory _$OrderLineImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderLineImplFromJson(json);

  @override
  final int id;
  @override
  final Product product;
  @override
  final int quantity;
  @override
  @JsonKey(name: 'unit_price')
  final double unitPrice;

  @override
  String toString() {
    return 'OrderLine(id: $id, product: $product, quantity: $quantity, unitPrice: $unitPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderLineImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, product, quantity, unitPrice);

  /// Create a copy of OrderLine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderLineImplCopyWith<_$OrderLineImpl> get copyWith =>
      __$$OrderLineImplCopyWithImpl<_$OrderLineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderLineImplToJson(
      this,
    );
  }
}

abstract class _OrderLine implements OrderLine {
  const factory _OrderLine(
          {required final int id,
          required final Product product,
          required final int quantity,
          @JsonKey(name: 'unit_price') required final double unitPrice}) =
      _$OrderLineImpl;

  factory _OrderLine.fromJson(Map<String, dynamic> json) =
      _$OrderLineImpl.fromJson;

  @override
  int get id;
  @override
  Product get product;
  @override
  int get quantity;
  @override
  @JsonKey(name: 'unit_price')
  double get unitPrice;

  /// Create a copy of OrderLine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderLineImplCopyWith<_$OrderLineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
