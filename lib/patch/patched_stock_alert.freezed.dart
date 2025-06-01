// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_stock_alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatchedStockAlert _$PatchedStockAlertFromJson(Map<String, dynamic> json) {
  return _PatchedStockAlert.fromJson(json);
}

/// @nodoc
mixin _$PatchedStockAlert {
  int? get product => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this PatchedStockAlert to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatchedStockAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatchedStockAlertCopyWith<PatchedStockAlert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatchedStockAlertCopyWith<$Res> {
  factory $PatchedStockAlertCopyWith(
          PatchedStockAlert value, $Res Function(PatchedStockAlert) then) =
      _$PatchedStockAlertCopyWithImpl<$Res, PatchedStockAlert>;
  @useResult
  $Res call({int? product, int? quantity, String? message});
}

/// @nodoc
class _$PatchedStockAlertCopyWithImpl<$Res, $Val extends PatchedStockAlert>
    implements $PatchedStockAlertCopyWith<$Res> {
  _$PatchedStockAlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatchedStockAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = freezed,
    Object? quantity = freezed,
    Object? message = freezed,
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
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatchedStockAlertImplCopyWith<$Res>
    implements $PatchedStockAlertCopyWith<$Res> {
  factory _$$PatchedStockAlertImplCopyWith(_$PatchedStockAlertImpl value,
          $Res Function(_$PatchedStockAlertImpl) then) =
      __$$PatchedStockAlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? product, int? quantity, String? message});
}

/// @nodoc
class __$$PatchedStockAlertImplCopyWithImpl<$Res>
    extends _$PatchedStockAlertCopyWithImpl<$Res, _$PatchedStockAlertImpl>
    implements _$$PatchedStockAlertImplCopyWith<$Res> {
  __$$PatchedStockAlertImplCopyWithImpl(_$PatchedStockAlertImpl _value,
      $Res Function(_$PatchedStockAlertImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatchedStockAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = freezed,
    Object? quantity = freezed,
    Object? message = freezed,
  }) {
    return _then(_$PatchedStockAlertImpl(
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatchedStockAlertImpl implements _PatchedStockAlert {
  const _$PatchedStockAlertImpl({this.product, this.quantity, this.message});

  factory _$PatchedStockAlertImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatchedStockAlertImplFromJson(json);

  @override
  final int? product;
  @override
  final int? quantity;
  @override
  final String? message;

  @override
  String toString() {
    return 'PatchedStockAlert(product: $product, quantity: $quantity, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatchedStockAlertImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, product, quantity, message);

  /// Create a copy of PatchedStockAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchedStockAlertImplCopyWith<_$PatchedStockAlertImpl> get copyWith =>
      __$$PatchedStockAlertImplCopyWithImpl<_$PatchedStockAlertImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatchedStockAlertImplToJson(
      this,
    );
  }
}

abstract class _PatchedStockAlert implements PatchedStockAlert {
  const factory _PatchedStockAlert(
      {final int? product,
      final int? quantity,
      final String? message}) = _$PatchedStockAlertImpl;

  factory _PatchedStockAlert.fromJson(Map<String, dynamic> json) =
      _$PatchedStockAlertImpl.fromJson;

  @override
  int? get product;
  @override
  int? get quantity;
  @override
  String? get message;

  /// Create a copy of PatchedStockAlert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchedStockAlertImplCopyWith<_$PatchedStockAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
