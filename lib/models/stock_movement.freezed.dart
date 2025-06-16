// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_movement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StockMovement _$StockMovementFromJson(Map<String, dynamic> json) {
  return _StockMovement.fromJson(json);
}

/// @nodoc
mixin _$StockMovement {
  int get id => throw _privateConstructorUsedError;
  int get product => throw _privateConstructorUsedError;
  int get warehouse => throw _privateConstructorUsedError;
  @JsonKey(name: 'stock_applied')
  bool get stockApplied => throw _privateConstructorUsedError;
  int? get batch => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_archived')
  bool get isArchived => throw _privateConstructorUsedError; // ✅ Ajouté ici
  @JsonKey(
      name: 'movement_type',
      fromJson: stringToMovementTypeEnum,
      toJson: movementTypeEnumToString)
  MovementTypeEnum get movementType => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  int? get user => throw _privateConstructorUsedError; // ✅ Ajouter ce champ
  @JsonKey(name: 'product_name')
  String? get productName => throw _privateConstructorUsedError;

  /// Serializes this StockMovement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockMovement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockMovementCopyWith<StockMovement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockMovementCopyWith<$Res> {
  factory $StockMovementCopyWith(
          StockMovement value, $Res Function(StockMovement) then) =
      _$StockMovementCopyWithImpl<$Res, StockMovement>;
  @useResult
  $Res call(
      {int id,
      int product,
      int warehouse,
      @JsonKey(name: 'stock_applied') bool stockApplied,
      int? batch,
      @JsonKey(name: 'is_archived') bool isArchived,
      @JsonKey(
          name: 'movement_type',
          fromJson: stringToMovementTypeEnum,
          toJson: movementTypeEnumToString)
      MovementTypeEnum movementType,
      int quantity,
      DateTime timestamp,
      int? user,
      @JsonKey(name: 'product_name') String? productName});
}

/// @nodoc
class _$StockMovementCopyWithImpl<$Res, $Val extends StockMovement>
    implements $StockMovementCopyWith<$Res> {
  _$StockMovementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockMovement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? warehouse = null,
    Object? stockApplied = null,
    Object? batch = freezed,
    Object? isArchived = null,
    Object? movementType = null,
    Object? quantity = null,
    Object? timestamp = null,
    Object? user = freezed,
    Object? productName = freezed,
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
      stockApplied: null == stockApplied
          ? _value.stockApplied
          : stockApplied // ignore: cast_nullable_to_non_nullable
              as bool,
      batch: freezed == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as int?,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      movementType: null == movementType
          ? _value.movementType
          : movementType // ignore: cast_nullable_to_non_nullable
              as MovementTypeEnum,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockMovementImplCopyWith<$Res>
    implements $StockMovementCopyWith<$Res> {
  factory _$$StockMovementImplCopyWith(
          _$StockMovementImpl value, $Res Function(_$StockMovementImpl) then) =
      __$$StockMovementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int product,
      int warehouse,
      @JsonKey(name: 'stock_applied') bool stockApplied,
      int? batch,
      @JsonKey(name: 'is_archived') bool isArchived,
      @JsonKey(
          name: 'movement_type',
          fromJson: stringToMovementTypeEnum,
          toJson: movementTypeEnumToString)
      MovementTypeEnum movementType,
      int quantity,
      DateTime timestamp,
      int? user,
      @JsonKey(name: 'product_name') String? productName});
}

/// @nodoc
class __$$StockMovementImplCopyWithImpl<$Res>
    extends _$StockMovementCopyWithImpl<$Res, _$StockMovementImpl>
    implements _$$StockMovementImplCopyWith<$Res> {
  __$$StockMovementImplCopyWithImpl(
      _$StockMovementImpl _value, $Res Function(_$StockMovementImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockMovement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? warehouse = null,
    Object? stockApplied = null,
    Object? batch = freezed,
    Object? isArchived = null,
    Object? movementType = null,
    Object? quantity = null,
    Object? timestamp = null,
    Object? user = freezed,
    Object? productName = freezed,
  }) {
    return _then(_$StockMovementImpl(
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
      stockApplied: null == stockApplied
          ? _value.stockApplied
          : stockApplied // ignore: cast_nullable_to_non_nullable
              as bool,
      batch: freezed == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as int?,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      movementType: null == movementType
          ? _value.movementType
          : movementType // ignore: cast_nullable_to_non_nullable
              as MovementTypeEnum,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockMovementImpl implements _StockMovement {
  const _$StockMovementImpl(
      {required this.id,
      required this.product,
      required this.warehouse,
      @JsonKey(name: 'stock_applied') this.stockApplied = false,
      this.batch,
      @JsonKey(name: 'is_archived') this.isArchived = false,
      @JsonKey(
          name: 'movement_type',
          fromJson: stringToMovementTypeEnum,
          toJson: movementTypeEnumToString)
      required this.movementType,
      required this.quantity,
      required this.timestamp,
      this.user,
      @JsonKey(name: 'product_name') this.productName});

  factory _$StockMovementImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockMovementImplFromJson(json);

  @override
  final int id;
  @override
  final int product;
  @override
  final int warehouse;
  @override
  @JsonKey(name: 'stock_applied')
  final bool stockApplied;
  @override
  final int? batch;
  @override
  @JsonKey(name: 'is_archived')
  final bool isArchived;
// ✅ Ajouté ici
  @override
  @JsonKey(
      name: 'movement_type',
      fromJson: stringToMovementTypeEnum,
      toJson: movementTypeEnumToString)
  final MovementTypeEnum movementType;
  @override
  final int quantity;
  @override
  final DateTime timestamp;
  @override
  final int? user;
// ✅ Ajouter ce champ
  @override
  @JsonKey(name: 'product_name')
  final String? productName;

  @override
  String toString() {
    return 'StockMovement(id: $id, product: $product, warehouse: $warehouse, stockApplied: $stockApplied, batch: $batch, isArchived: $isArchived, movementType: $movementType, quantity: $quantity, timestamp: $timestamp, user: $user, productName: $productName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockMovementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse) &&
            (identical(other.stockApplied, stockApplied) ||
                other.stockApplied == stockApplied) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.movementType, movementType) ||
                other.movementType == movementType) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.productName, productName) ||
                other.productName == productName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      product,
      warehouse,
      stockApplied,
      batch,
      isArchived,
      movementType,
      quantity,
      timestamp,
      user,
      productName);

  /// Create a copy of StockMovement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockMovementImplCopyWith<_$StockMovementImpl> get copyWith =>
      __$$StockMovementImplCopyWithImpl<_$StockMovementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockMovementImplToJson(
      this,
    );
  }
}

abstract class _StockMovement implements StockMovement {
  const factory _StockMovement(
          {required final int id,
          required final int product,
          required final int warehouse,
          @JsonKey(name: 'stock_applied') final bool stockApplied,
          final int? batch,
          @JsonKey(name: 'is_archived') final bool isArchived,
          @JsonKey(
              name: 'movement_type',
              fromJson: stringToMovementTypeEnum,
              toJson: movementTypeEnumToString)
          required final MovementTypeEnum movementType,
          required final int quantity,
          required final DateTime timestamp,
          final int? user,
          @JsonKey(name: 'product_name') final String? productName}) =
      _$StockMovementImpl;

  factory _StockMovement.fromJson(Map<String, dynamic> json) =
      _$StockMovementImpl.fromJson;

  @override
  int get id;
  @override
  int get product;
  @override
  int get warehouse;
  @override
  @JsonKey(name: 'stock_applied')
  bool get stockApplied;
  @override
  int? get batch;
  @override
  @JsonKey(name: 'is_archived')
  bool get isArchived; // ✅ Ajouté ici
  @override
  @JsonKey(
      name: 'movement_type',
      fromJson: stringToMovementTypeEnum,
      toJson: movementTypeEnumToString)
  MovementTypeEnum get movementType;
  @override
  int get quantity;
  @override
  DateTime get timestamp;
  @override
  int? get user; // ✅ Ajouter ce champ
  @override
  @JsonKey(name: 'product_name')
  String? get productName;

  /// Create a copy of StockMovement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockMovementImplCopyWith<_$StockMovementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
