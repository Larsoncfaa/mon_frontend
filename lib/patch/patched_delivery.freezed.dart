// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_delivery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatchedDelivery _$PatchedDeliveryFromJson(Map<String, dynamic> json) {
  return _PatchedDelivery.fromJson(json);
}

/// @nodoc
mixin _$PatchedDelivery {
  int? get id => throw _privateConstructorUsedError;
  int? get deliverer => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;
  int? get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  TypeEnum? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_status')
  DeliveryStatusEnum? get deliveryStatus => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PatchedDelivery to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatchedDelivery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatchedDeliveryCopyWith<PatchedDelivery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatchedDeliveryCopyWith<$Res> {
  factory $PatchedDeliveryCopyWith(
          PatchedDelivery value, $Res Function(PatchedDelivery) then) =
      _$PatchedDeliveryCopyWithImpl<$Res, PatchedDelivery>;
  @useResult
  $Res call(
      {int? id,
      int? deliverer,
      int? order,
      int? product,
      @JsonKey(name: 'type') TypeEnum? type,
      @JsonKey(name: 'delivery_status') DeliveryStatusEnum? deliveryStatus,
      String? description,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$PatchedDeliveryCopyWithImpl<$Res, $Val extends PatchedDelivery>
    implements $PatchedDeliveryCopyWith<$Res> {
  _$PatchedDeliveryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatchedDelivery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? deliverer = freezed,
    Object? order = freezed,
    Object? product = freezed,
    Object? type = freezed,
    Object? deliveryStatus = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      deliverer: freezed == deliverer
          ? _value.deliverer
          : deliverer // ignore: cast_nullable_to_non_nullable
              as int?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeEnum?,
      deliveryStatus: freezed == deliveryStatus
          ? _value.deliveryStatus
          : deliveryStatus // ignore: cast_nullable_to_non_nullable
              as DeliveryStatusEnum?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatchedDeliveryImplCopyWith<$Res>
    implements $PatchedDeliveryCopyWith<$Res> {
  factory _$$PatchedDeliveryImplCopyWith(_$PatchedDeliveryImpl value,
          $Res Function(_$PatchedDeliveryImpl) then) =
      __$$PatchedDeliveryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? deliverer,
      int? order,
      int? product,
      @JsonKey(name: 'type') TypeEnum? type,
      @JsonKey(name: 'delivery_status') DeliveryStatusEnum? deliveryStatus,
      String? description,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$PatchedDeliveryImplCopyWithImpl<$Res>
    extends _$PatchedDeliveryCopyWithImpl<$Res, _$PatchedDeliveryImpl>
    implements _$$PatchedDeliveryImplCopyWith<$Res> {
  __$$PatchedDeliveryImplCopyWithImpl(
      _$PatchedDeliveryImpl _value, $Res Function(_$PatchedDeliveryImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatchedDelivery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? deliverer = freezed,
    Object? order = freezed,
    Object? product = freezed,
    Object? type = freezed,
    Object? deliveryStatus = freezed,
    Object? description = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PatchedDeliveryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      deliverer: freezed == deliverer
          ? _value.deliverer
          : deliverer // ignore: cast_nullable_to_non_nullable
              as int?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeEnum?,
      deliveryStatus: freezed == deliveryStatus
          ? _value.deliveryStatus
          : deliveryStatus // ignore: cast_nullable_to_non_nullable
              as DeliveryStatusEnum?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatchedDeliveryImpl implements _PatchedDelivery {
  const _$PatchedDeliveryImpl(
      {this.id,
      this.deliverer,
      this.order,
      this.product,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'delivery_status') this.deliveryStatus,
      this.description,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$PatchedDeliveryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatchedDeliveryImplFromJson(json);

  @override
  final int? id;
  @override
  final int? deliverer;
  @override
  final int? order;
  @override
  final int? product;
  @override
  @JsonKey(name: 'type')
  final TypeEnum? type;
  @override
  @JsonKey(name: 'delivery_status')
  final DeliveryStatusEnum? deliveryStatus;
  @override
  final String? description;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PatchedDelivery(id: $id, deliverer: $deliverer, order: $order, product: $product, type: $type, deliveryStatus: $deliveryStatus, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatchedDeliveryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.deliverer, deliverer) ||
                other.deliverer == deliverer) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.deliveryStatus, deliveryStatus) ||
                other.deliveryStatus == deliveryStatus) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, deliverer, order, product,
      type, deliveryStatus, description, createdAt, updatedAt);

  /// Create a copy of PatchedDelivery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchedDeliveryImplCopyWith<_$PatchedDeliveryImpl> get copyWith =>
      __$$PatchedDeliveryImplCopyWithImpl<_$PatchedDeliveryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatchedDeliveryImplToJson(
      this,
    );
  }
}

abstract class _PatchedDelivery implements PatchedDelivery {
  const factory _PatchedDelivery(
          {final int? id,
          final int? deliverer,
          final int? order,
          final int? product,
          @JsonKey(name: 'type') final TypeEnum? type,
          @JsonKey(name: 'delivery_status')
          final DeliveryStatusEnum? deliveryStatus,
          final String? description,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$PatchedDeliveryImpl;

  factory _PatchedDelivery.fromJson(Map<String, dynamic> json) =
      _$PatchedDeliveryImpl.fromJson;

  @override
  int? get id;
  @override
  int? get deliverer;
  @override
  int? get order;
  @override
  int? get product;
  @override
  @JsonKey(name: 'type')
  TypeEnum? get type;
  @override
  @JsonKey(name: 'delivery_status')
  DeliveryStatusEnum? get deliveryStatus;
  @override
  String? get description;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of PatchedDelivery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchedDeliveryImplCopyWith<_$PatchedDeliveryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
