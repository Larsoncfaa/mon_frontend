// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Delivery _$DeliveryFromJson(Map<String, dynamic> json) {
  return _Delivery.fromJson(json);
}

/// @nodoc
mixin _$Delivery {
  int get id => throw _privateConstructorUsedError;
  int? get deliverer => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;
  int? get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', fromJson: _typeEnumFromJson)
  TypeEnum get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_status', fromJson: _deliveryStatusEnumFromJson)
  DeliveryStatusEnum? get deliveryStatus => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;

  /// Serializes this Delivery to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Delivery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryCopyWith<Delivery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryCopyWith<$Res> {
  factory $DeliveryCopyWith(Delivery value, $Res Function(Delivery) then) =
      _$DeliveryCopyWithImpl<$Res, Delivery>;
  @useResult
  $Res call(
      {int id,
      int? deliverer,
      int? order,
      int? product,
      @JsonKey(name: 'type', fromJson: _typeEnumFromJson) TypeEnum type,
      @JsonKey(name: 'delivery_status', fromJson: _deliveryStatusEnumFromJson)
      DeliveryStatusEnum? deliveryStatus,
      String description,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      double? latitude,
      double? longitude});
}

/// @nodoc
class _$DeliveryCopyWithImpl<$Res, $Val extends Delivery>
    implements $DeliveryCopyWith<$Res> {
  _$DeliveryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Delivery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deliverer = freezed,
    Object? order = freezed,
    Object? product = freezed,
    Object? type = null,
    Object? deliveryStatus = freezed,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeEnum,
      deliveryStatus: freezed == deliveryStatus
          ? _value.deliveryStatus
          : deliveryStatus // ignore: cast_nullable_to_non_nullable
              as DeliveryStatusEnum?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryImplCopyWith<$Res>
    implements $DeliveryCopyWith<$Res> {
  factory _$$DeliveryImplCopyWith(
          _$DeliveryImpl value, $Res Function(_$DeliveryImpl) then) =
      __$$DeliveryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int? deliverer,
      int? order,
      int? product,
      @JsonKey(name: 'type', fromJson: _typeEnumFromJson) TypeEnum type,
      @JsonKey(name: 'delivery_status', fromJson: _deliveryStatusEnumFromJson)
      DeliveryStatusEnum? deliveryStatus,
      String description,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      double? latitude,
      double? longitude});
}

/// @nodoc
class __$$DeliveryImplCopyWithImpl<$Res>
    extends _$DeliveryCopyWithImpl<$Res, _$DeliveryImpl>
    implements _$$DeliveryImplCopyWith<$Res> {
  __$$DeliveryImplCopyWithImpl(
      _$DeliveryImpl _value, $Res Function(_$DeliveryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Delivery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deliverer = freezed,
    Object? order = freezed,
    Object? product = freezed,
    Object? type = null,
    Object? deliveryStatus = freezed,
    Object? description = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$DeliveryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeEnum,
      deliveryStatus: freezed == deliveryStatus
          ? _value.deliveryStatus
          : deliveryStatus // ignore: cast_nullable_to_non_nullable
              as DeliveryStatusEnum?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryImpl implements _Delivery {
  const _$DeliveryImpl(
      {required this.id,
      this.deliverer,
      this.order,
      this.product,
      @JsonKey(name: 'type', fromJson: _typeEnumFromJson) required this.type,
      @JsonKey(name: 'delivery_status', fromJson: _deliveryStatusEnumFromJson)
      this.deliveryStatus,
      required this.description,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      this.latitude,
      this.longitude});

  factory _$DeliveryImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryImplFromJson(json);

  @override
  final int id;
  @override
  final int? deliverer;
  @override
  final int? order;
  @override
  final int? product;
  @override
  @JsonKey(name: 'type', fromJson: _typeEnumFromJson)
  final TypeEnum type;
  @override
  @JsonKey(name: 'delivery_status', fromJson: _deliveryStatusEnumFromJson)
  final DeliveryStatusEnum? deliveryStatus;
  @override
  final String description;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  final double? latitude;
  @override
  final double? longitude;

  @override
  String toString() {
    return 'Delivery(id: $id, deliverer: $deliverer, order: $order, product: $product, type: $type, deliveryStatus: $deliveryStatus, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryImpl &&
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
                other.updatedAt == updatedAt) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      deliverer,
      order,
      product,
      type,
      deliveryStatus,
      description,
      createdAt,
      updatedAt,
      latitude,
      longitude);

  /// Create a copy of Delivery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryImplCopyWith<_$DeliveryImpl> get copyWith =>
      __$$DeliveryImplCopyWithImpl<_$DeliveryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryImplToJson(
      this,
    );
  }
}

abstract class _Delivery implements Delivery {
  const factory _Delivery(
      {required final int id,
      final int? deliverer,
      final int? order,
      final int? product,
      @JsonKey(name: 'type', fromJson: _typeEnumFromJson)
      required final TypeEnum type,
      @JsonKey(name: 'delivery_status', fromJson: _deliveryStatusEnumFromJson)
      final DeliveryStatusEnum? deliveryStatus,
      required final String description,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      final double? latitude,
      final double? longitude}) = _$DeliveryImpl;

  factory _Delivery.fromJson(Map<String, dynamic> json) =
      _$DeliveryImpl.fromJson;

  @override
  int get id;
  @override
  int? get deliverer;
  @override
  int? get order;
  @override
  int? get product;
  @override
  @JsonKey(name: 'type', fromJson: _typeEnumFromJson)
  TypeEnum get type;
  @override
  @JsonKey(name: 'delivery_status', fromJson: _deliveryStatusEnumFromJson)
  DeliveryStatusEnum? get deliveryStatus;
  @override
  String get description;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  double? get latitude;
  @override
  double? get longitude;

  /// Create a copy of Delivery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryImplCopyWith<_$DeliveryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
