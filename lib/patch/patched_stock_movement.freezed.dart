// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_stock_movement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatchedStockMovement _$PatchedStockMovementFromJson(Map<String, dynamic> json) {
  return _PatchedStockMovement.fromJson(json);
}

/// @nodoc
mixin _$PatchedStockMovement {
  String? get productId => throw _privateConstructorUsedError;
  String? get movementType => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  String? get destination => throw _privateConstructorUsedError;
  DateTime? get timestamp => throw _privateConstructorUsedError;

  /// Serializes this PatchedStockMovement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatchedStockMovement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatchedStockMovementCopyWith<PatchedStockMovement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatchedStockMovementCopyWith<$Res> {
  factory $PatchedStockMovementCopyWith(PatchedStockMovement value,
          $Res Function(PatchedStockMovement) then) =
      _$PatchedStockMovementCopyWithImpl<$Res, PatchedStockMovement>;
  @useResult
  $Res call(
      {String? productId,
      String? movementType,
      int? quantity,
      String? source,
      String? destination,
      DateTime? timestamp});
}

/// @nodoc
class _$PatchedStockMovementCopyWithImpl<$Res,
        $Val extends PatchedStockMovement>
    implements $PatchedStockMovementCopyWith<$Res> {
  _$PatchedStockMovementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatchedStockMovement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? movementType = freezed,
    Object? quantity = freezed,
    Object? source = freezed,
    Object? destination = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      movementType: freezed == movementType
          ? _value.movementType
          : movementType // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatchedStockMovementImplCopyWith<$Res>
    implements $PatchedStockMovementCopyWith<$Res> {
  factory _$$PatchedStockMovementImplCopyWith(_$PatchedStockMovementImpl value,
          $Res Function(_$PatchedStockMovementImpl) then) =
      __$$PatchedStockMovementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? productId,
      String? movementType,
      int? quantity,
      String? source,
      String? destination,
      DateTime? timestamp});
}

/// @nodoc
class __$$PatchedStockMovementImplCopyWithImpl<$Res>
    extends _$PatchedStockMovementCopyWithImpl<$Res, _$PatchedStockMovementImpl>
    implements _$$PatchedStockMovementImplCopyWith<$Res> {
  __$$PatchedStockMovementImplCopyWithImpl(_$PatchedStockMovementImpl _value,
      $Res Function(_$PatchedStockMovementImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatchedStockMovement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? movementType = freezed,
    Object? quantity = freezed,
    Object? source = freezed,
    Object? destination = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_$PatchedStockMovementImpl(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      movementType: freezed == movementType
          ? _value.movementType
          : movementType // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatchedStockMovementImpl implements _PatchedStockMovement {
  const _$PatchedStockMovementImpl(
      {this.productId,
      this.movementType,
      this.quantity,
      this.source,
      this.destination,
      this.timestamp});

  factory _$PatchedStockMovementImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatchedStockMovementImplFromJson(json);

  @override
  final String? productId;
  @override
  final String? movementType;
  @override
  final int? quantity;
  @override
  final String? source;
  @override
  final String? destination;
  @override
  final DateTime? timestamp;

  @override
  String toString() {
    return 'PatchedStockMovement(productId: $productId, movementType: $movementType, quantity: $quantity, source: $source, destination: $destination, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatchedStockMovementImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.movementType, movementType) ||
                other.movementType == movementType) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId, movementType,
      quantity, source, destination, timestamp);

  /// Create a copy of PatchedStockMovement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchedStockMovementImplCopyWith<_$PatchedStockMovementImpl>
      get copyWith =>
          __$$PatchedStockMovementImplCopyWithImpl<_$PatchedStockMovementImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatchedStockMovementImplToJson(
      this,
    );
  }
}

abstract class _PatchedStockMovement implements PatchedStockMovement {
  const factory _PatchedStockMovement(
      {final String? productId,
      final String? movementType,
      final int? quantity,
      final String? source,
      final String? destination,
      final DateTime? timestamp}) = _$PatchedStockMovementImpl;

  factory _PatchedStockMovement.fromJson(Map<String, dynamic> json) =
      _$PatchedStockMovementImpl.fromJson;

  @override
  String? get productId;
  @override
  String? get movementType;
  @override
  int? get quantity;
  @override
  String? get source;
  @override
  String? get destination;
  @override
  DateTime? get timestamp;

  /// Create a copy of PatchedStockMovement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchedStockMovementImplCopyWith<_$PatchedStockMovementImpl>
      get copyWith => throw _privateConstructorUsedError;
}
