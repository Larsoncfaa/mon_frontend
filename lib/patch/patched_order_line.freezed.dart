// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_order_line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatchedOrderLine _$PatchedOrderLineFromJson(Map<String, dynamic> json) {
  return _PatchedOrderLine.fromJson(json);
}

/// @nodoc
mixin _$PatchedOrderLine {
  int? get id => throw _privateConstructorUsedError;
  Product? get product => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_price')
  double? get unitPrice => throw _privateConstructorUsedError;

  /// Serializes this PatchedOrderLine to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatchedOrderLine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatchedOrderLineCopyWith<PatchedOrderLine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatchedOrderLineCopyWith<$Res> {
  factory $PatchedOrderLineCopyWith(
          PatchedOrderLine value, $Res Function(PatchedOrderLine) then) =
      _$PatchedOrderLineCopyWithImpl<$Res, PatchedOrderLine>;
  @useResult
  $Res call(
      {int? id,
      Product? product,
      int? quantity,
      @JsonKey(name: 'unit_price') double? unitPrice});

  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class _$PatchedOrderLineCopyWithImpl<$Res, $Val extends PatchedOrderLine>
    implements $PatchedOrderLineCopyWith<$Res> {
  _$PatchedOrderLineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatchedOrderLine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? product = freezed,
    Object? quantity = freezed,
    Object? unitPrice = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      unitPrice: freezed == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  /// Create a copy of PatchedOrderLine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PatchedOrderLineImplCopyWith<$Res>
    implements $PatchedOrderLineCopyWith<$Res> {
  factory _$$PatchedOrderLineImplCopyWith(_$PatchedOrderLineImpl value,
          $Res Function(_$PatchedOrderLineImpl) then) =
      __$$PatchedOrderLineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      Product? product,
      int? quantity,
      @JsonKey(name: 'unit_price') double? unitPrice});

  @override
  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class __$$PatchedOrderLineImplCopyWithImpl<$Res>
    extends _$PatchedOrderLineCopyWithImpl<$Res, _$PatchedOrderLineImpl>
    implements _$$PatchedOrderLineImplCopyWith<$Res> {
  __$$PatchedOrderLineImplCopyWithImpl(_$PatchedOrderLineImpl _value,
      $Res Function(_$PatchedOrderLineImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatchedOrderLine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? product = freezed,
    Object? quantity = freezed,
    Object? unitPrice = freezed,
  }) {
    return _then(_$PatchedOrderLineImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      unitPrice: freezed == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatchedOrderLineImpl implements _PatchedOrderLine {
  const _$PatchedOrderLineImpl(
      {this.id,
      this.product,
      this.quantity,
      @JsonKey(name: 'unit_price') this.unitPrice});

  factory _$PatchedOrderLineImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatchedOrderLineImplFromJson(json);

  @override
  final int? id;
  @override
  final Product? product;
  @override
  final int? quantity;
  @override
  @JsonKey(name: 'unit_price')
  final double? unitPrice;

  @override
  String toString() {
    return 'PatchedOrderLine(id: $id, product: $product, quantity: $quantity, unitPrice: $unitPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatchedOrderLineImpl &&
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

  /// Create a copy of PatchedOrderLine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchedOrderLineImplCopyWith<_$PatchedOrderLineImpl> get copyWith =>
      __$$PatchedOrderLineImplCopyWithImpl<_$PatchedOrderLineImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatchedOrderLineImplToJson(
      this,
    );
  }
}

abstract class _PatchedOrderLine implements PatchedOrderLine {
  const factory _PatchedOrderLine(
          {final int? id,
          final Product? product,
          final int? quantity,
          @JsonKey(name: 'unit_price') final double? unitPrice}) =
      _$PatchedOrderLineImpl;

  factory _PatchedOrderLine.fromJson(Map<String, dynamic> json) =
      _$PatchedOrderLineImpl.fromJson;

  @override
  int? get id;
  @override
  Product? get product;
  @override
  int? get quantity;
  @override
  @JsonKey(name: 'unit_price')
  double? get unitPrice;

  /// Create a copy of PatchedOrderLine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchedOrderLineImplCopyWith<_$PatchedOrderLineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
