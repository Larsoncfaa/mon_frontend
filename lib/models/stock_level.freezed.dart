// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_level.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StockLevel _$StockLevelFromJson(Map<String, dynamic> json) {
  return _StockLevel.fromJson(json);
}

/// @nodoc
mixin _$StockLevel {
  int get id => throw _privateConstructorUsedError;
  int get product => throw _privateConstructorUsedError;
  int get warehouse => throw _privateConstructorUsedError;

  /// Minimum value: 0, Maximum value: 4294967295
  int get quantity => throw _privateConstructorUsedError;

  /// Serializes this StockLevel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockLevel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockLevelCopyWith<StockLevel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockLevelCopyWith<$Res> {
  factory $StockLevelCopyWith(
          StockLevel value, $Res Function(StockLevel) then) =
      _$StockLevelCopyWithImpl<$Res, StockLevel>;
  @useResult
  $Res call({int id, int product, int warehouse, int quantity});
}

/// @nodoc
class _$StockLevelCopyWithImpl<$Res, $Val extends StockLevel>
    implements $StockLevelCopyWith<$Res> {
  _$StockLevelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockLevel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? warehouse = null,
    Object? quantity = null,
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
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockLevelImplCopyWith<$Res>
    implements $StockLevelCopyWith<$Res> {
  factory _$$StockLevelImplCopyWith(
          _$StockLevelImpl value, $Res Function(_$StockLevelImpl) then) =
      __$$StockLevelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int product, int warehouse, int quantity});
}

/// @nodoc
class __$$StockLevelImplCopyWithImpl<$Res>
    extends _$StockLevelCopyWithImpl<$Res, _$StockLevelImpl>
    implements _$$StockLevelImplCopyWith<$Res> {
  __$$StockLevelImplCopyWithImpl(
      _$StockLevelImpl _value, $Res Function(_$StockLevelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockLevel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? warehouse = null,
    Object? quantity = null,
  }) {
    return _then(_$StockLevelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as int,
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockLevelImpl implements _StockLevel {
  const _$StockLevelImpl(
      {required this.id,
      required this.product,
      required this.warehouse,
      required this.quantity});

  factory _$StockLevelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockLevelImplFromJson(json);

  @override
  final int id;
  @override
  final int product;
  @override
  final int warehouse;

  /// Minimum value: 0, Maximum value: 4294967295
  @override
  final int quantity;

  @override
  String toString() {
    return 'StockLevel(id: $id, product: $product, warehouse: $warehouse, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockLevelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, product, warehouse, quantity);

  /// Create a copy of StockLevel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockLevelImplCopyWith<_$StockLevelImpl> get copyWith =>
      __$$StockLevelImplCopyWithImpl<_$StockLevelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockLevelImplToJson(
      this,
    );
  }
}

abstract class _StockLevel implements StockLevel {
  const factory _StockLevel(
      {required final int id,
      required final int product,
      required final int warehouse,
      required final int quantity}) = _$StockLevelImpl;

  factory _StockLevel.fromJson(Map<String, dynamic> json) =
      _$StockLevelImpl.fromJson;

  @override
  int get id;
  @override
  int get product;
  @override
  int get warehouse;

  /// Minimum value: 0, Maximum value: 4294967295
  @override
  int get quantity;

  /// Create a copy of StockLevel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockLevelImplCopyWith<_$StockLevelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
