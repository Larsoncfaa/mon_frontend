// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_order_write.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatchedOrderWrite _$PatchedOrderWriteFromJson(Map<String, dynamic> json) {
  return _PatchedOrderWrite.fromJson(json);
}

/// @nodoc
mixin _$PatchedOrderWrite {
  int? get product => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  int? get customer => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  /// Serializes this PatchedOrderWrite to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatchedOrderWrite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatchedOrderWriteCopyWith<PatchedOrderWrite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatchedOrderWriteCopyWith<$Res> {
  factory $PatchedOrderWriteCopyWith(
          PatchedOrderWrite value, $Res Function(PatchedOrderWrite) then) =
      _$PatchedOrderWriteCopyWithImpl<$Res, PatchedOrderWrite>;
  @useResult
  $Res call(
      {int? product,
      int? quantity,
      double? price,
      int? customer,
      String? status});
}

/// @nodoc
class _$PatchedOrderWriteCopyWithImpl<$Res, $Val extends PatchedOrderWrite>
    implements $PatchedOrderWriteCopyWith<$Res> {
  _$PatchedOrderWriteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatchedOrderWrite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = freezed,
    Object? quantity = freezed,
    Object? price = freezed,
    Object? customer = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatchedOrderWriteImplCopyWith<$Res>
    implements $PatchedOrderWriteCopyWith<$Res> {
  factory _$$PatchedOrderWriteImplCopyWith(_$PatchedOrderWriteImpl value,
          $Res Function(_$PatchedOrderWriteImpl) then) =
      __$$PatchedOrderWriteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? product,
      int? quantity,
      double? price,
      int? customer,
      String? status});
}

/// @nodoc
class __$$PatchedOrderWriteImplCopyWithImpl<$Res>
    extends _$PatchedOrderWriteCopyWithImpl<$Res, _$PatchedOrderWriteImpl>
    implements _$$PatchedOrderWriteImplCopyWith<$Res> {
  __$$PatchedOrderWriteImplCopyWithImpl(_$PatchedOrderWriteImpl _value,
      $Res Function(_$PatchedOrderWriteImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatchedOrderWrite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = freezed,
    Object? quantity = freezed,
    Object? price = freezed,
    Object? customer = freezed,
    Object? status = freezed,
  }) {
    return _then(_$PatchedOrderWriteImpl(
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatchedOrderWriteImpl implements _PatchedOrderWrite {
  const _$PatchedOrderWriteImpl(
      {this.product, this.quantity, this.price, this.customer, this.status});

  factory _$PatchedOrderWriteImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatchedOrderWriteImplFromJson(json);

  @override
  final int? product;
  @override
  final int? quantity;
  @override
  final double? price;
  @override
  final int? customer;
  @override
  final String? status;

  @override
  String toString() {
    return 'PatchedOrderWrite(product: $product, quantity: $quantity, price: $price, customer: $customer, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatchedOrderWriteImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, product, quantity, price, customer, status);

  /// Create a copy of PatchedOrderWrite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchedOrderWriteImplCopyWith<_$PatchedOrderWriteImpl> get copyWith =>
      __$$PatchedOrderWriteImplCopyWithImpl<_$PatchedOrderWriteImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatchedOrderWriteImplToJson(
      this,
    );
  }
}

abstract class _PatchedOrderWrite implements PatchedOrderWrite {
  const factory _PatchedOrderWrite(
      {final int? product,
      final int? quantity,
      final double? price,
      final int? customer,
      final String? status}) = _$PatchedOrderWriteImpl;

  factory _PatchedOrderWrite.fromJson(Map<String, dynamic> json) =
      _$PatchedOrderWriteImpl.fromJson;

  @override
  int? get product;
  @override
  int? get quantity;
  @override
  double? get price;
  @override
  int? get customer;
  @override
  String? get status;

  /// Create a copy of PatchedOrderWrite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchedOrderWriteImplCopyWith<_$PatchedOrderWriteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
