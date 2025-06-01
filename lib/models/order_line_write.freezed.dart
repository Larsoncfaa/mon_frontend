// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_line_write.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderLineWrite _$OrderLineWriteFromJson(Map<String, dynamic> json) {
  return _OrderLineWrite.fromJson(json);
}

/// @nodoc
mixin _$OrderLineWrite {
  int get product => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_price')
  double get unitPrice => throw _privateConstructorUsedError;

  /// Serializes this OrderLineWrite to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderLineWrite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderLineWriteCopyWith<OrderLineWrite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderLineWriteCopyWith<$Res> {
  factory $OrderLineWriteCopyWith(
          OrderLineWrite value, $Res Function(OrderLineWrite) then) =
      _$OrderLineWriteCopyWithImpl<$Res, OrderLineWrite>;
  @useResult
  $Res call(
      {int product,
      int quantity,
      @JsonKey(name: 'unit_price') double unitPrice});
}

/// @nodoc
class _$OrderLineWriteCopyWithImpl<$Res, $Val extends OrderLineWrite>
    implements $OrderLineWriteCopyWith<$Res> {
  _$OrderLineWriteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderLineWrite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
    Object? unitPrice = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as int,
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
}

/// @nodoc
abstract class _$$OrderLineWriteImplCopyWith<$Res>
    implements $OrderLineWriteCopyWith<$Res> {
  factory _$$OrderLineWriteImplCopyWith(_$OrderLineWriteImpl value,
          $Res Function(_$OrderLineWriteImpl) then) =
      __$$OrderLineWriteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int product,
      int quantity,
      @JsonKey(name: 'unit_price') double unitPrice});
}

/// @nodoc
class __$$OrderLineWriteImplCopyWithImpl<$Res>
    extends _$OrderLineWriteCopyWithImpl<$Res, _$OrderLineWriteImpl>
    implements _$$OrderLineWriteImplCopyWith<$Res> {
  __$$OrderLineWriteImplCopyWithImpl(
      _$OrderLineWriteImpl _value, $Res Function(_$OrderLineWriteImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderLineWrite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
    Object? unitPrice = null,
  }) {
    return _then(_$OrderLineWriteImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$OrderLineWriteImpl implements _OrderLineWrite {
  const _$OrderLineWriteImpl(
      {required this.product,
      required this.quantity,
      @JsonKey(name: 'unit_price') required this.unitPrice});

  factory _$OrderLineWriteImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderLineWriteImplFromJson(json);

  @override
  final int product;
  @override
  final int quantity;
  @override
  @JsonKey(name: 'unit_price')
  final double unitPrice;

  @override
  String toString() {
    return 'OrderLineWrite(product: $product, quantity: $quantity, unitPrice: $unitPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderLineWriteImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, product, quantity, unitPrice);

  /// Create a copy of OrderLineWrite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderLineWriteImplCopyWith<_$OrderLineWriteImpl> get copyWith =>
      __$$OrderLineWriteImplCopyWithImpl<_$OrderLineWriteImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderLineWriteImplToJson(
      this,
    );
  }
}

abstract class _OrderLineWrite implements OrderLineWrite {
  const factory _OrderLineWrite(
          {required final int product,
          required final int quantity,
          @JsonKey(name: 'unit_price') required final double unitPrice}) =
      _$OrderLineWriteImpl;

  factory _OrderLineWrite.fromJson(Map<String, dynamic> json) =
      _$OrderLineWriteImpl.fromJson;

  @override
  int get product;
  @override
  int get quantity;
  @override
  @JsonKey(name: 'unit_price')
  double get unitPrice;

  /// Create a copy of OrderLineWrite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderLineWriteImplCopyWith<_$OrderLineWriteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
