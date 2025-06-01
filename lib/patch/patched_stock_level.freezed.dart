// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_stock_level.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatchedStockLevel _$PatchedStockLevelFromJson(Map<String, dynamic> json) {
  return _PatchedStockLevel.fromJson(json);
}

/// @nodoc
mixin _$PatchedStockLevel {
  int? get productId => throw _privateConstructorUsedError;
  int? get warehouseId => throw _privateConstructorUsedError;
  double? get quantity => throw _privateConstructorUsedError;
  double? get threshold => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PatchedStockLevel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatchedStockLevel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatchedStockLevelCopyWith<PatchedStockLevel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatchedStockLevelCopyWith<$Res> {
  factory $PatchedStockLevelCopyWith(
          PatchedStockLevel value, $Res Function(PatchedStockLevel) then) =
      _$PatchedStockLevelCopyWithImpl<$Res, PatchedStockLevel>;
  @useResult
  $Res call(
      {int? productId,
      int? warehouseId,
      double? quantity,
      double? threshold,
      DateTime? updatedAt});
}

/// @nodoc
class _$PatchedStockLevelCopyWithImpl<$Res, $Val extends PatchedStockLevel>
    implements $PatchedStockLevelCopyWith<$Res> {
  _$PatchedStockLevelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatchedStockLevel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? warehouseId = freezed,
    Object? quantity = freezed,
    Object? threshold = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      warehouseId: freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      threshold: freezed == threshold
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as double?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatchedStockLevelImplCopyWith<$Res>
    implements $PatchedStockLevelCopyWith<$Res> {
  factory _$$PatchedStockLevelImplCopyWith(_$PatchedStockLevelImpl value,
          $Res Function(_$PatchedStockLevelImpl) then) =
      __$$PatchedStockLevelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? productId,
      int? warehouseId,
      double? quantity,
      double? threshold,
      DateTime? updatedAt});
}

/// @nodoc
class __$$PatchedStockLevelImplCopyWithImpl<$Res>
    extends _$PatchedStockLevelCopyWithImpl<$Res, _$PatchedStockLevelImpl>
    implements _$$PatchedStockLevelImplCopyWith<$Res> {
  __$$PatchedStockLevelImplCopyWithImpl(_$PatchedStockLevelImpl _value,
      $Res Function(_$PatchedStockLevelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatchedStockLevel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? warehouseId = freezed,
    Object? quantity = freezed,
    Object? threshold = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PatchedStockLevelImpl(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      warehouseId: freezed == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      threshold: freezed == threshold
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as double?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatchedStockLevelImpl implements _PatchedStockLevel {
  const _$PatchedStockLevelImpl(
      {this.productId,
      this.warehouseId,
      this.quantity,
      this.threshold,
      this.updatedAt});

  factory _$PatchedStockLevelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatchedStockLevelImplFromJson(json);

  @override
  final int? productId;
  @override
  final int? warehouseId;
  @override
  final double? quantity;
  @override
  final double? threshold;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PatchedStockLevel(productId: $productId, warehouseId: $warehouseId, quantity: $quantity, threshold: $threshold, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatchedStockLevelImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.threshold, threshold) ||
                other.threshold == threshold) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, productId, warehouseId, quantity, threshold, updatedAt);

  /// Create a copy of PatchedStockLevel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchedStockLevelImplCopyWith<_$PatchedStockLevelImpl> get copyWith =>
      __$$PatchedStockLevelImplCopyWithImpl<_$PatchedStockLevelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatchedStockLevelImplToJson(
      this,
    );
  }
}

abstract class _PatchedStockLevel implements PatchedStockLevel {
  const factory _PatchedStockLevel(
      {final int? productId,
      final int? warehouseId,
      final double? quantity,
      final double? threshold,
      final DateTime? updatedAt}) = _$PatchedStockLevelImpl;

  factory _PatchedStockLevel.fromJson(Map<String, dynamic> json) =
      _$PatchedStockLevelImpl.fromJson;

  @override
  int? get productId;
  @override
  int? get warehouseId;
  @override
  double? get quantity;
  @override
  double? get threshold;
  @override
  DateTime? get updatedAt;

  /// Create a copy of PatchedStockLevel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchedStockLevelImplCopyWith<_$PatchedStockLevelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
