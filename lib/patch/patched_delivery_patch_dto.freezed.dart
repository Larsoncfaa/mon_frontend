// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_delivery_patch_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatchedDeliveryPatchDto _$PatchedDeliveryPatchDtoFromJson(
    Map<String, dynamic> json) {
  return _PatchedDeliveryPatchDto.fromJson(json);
}

/// @nodoc
mixin _$PatchedDeliveryPatchDto {
  int? get deliverer => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;
  int? get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  TypeEnum? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_status')
  DeliveryStatusEnum? get deliveryStatus => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this PatchedDeliveryPatchDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatchedDeliveryPatchDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatchedDeliveryPatchDtoCopyWith<PatchedDeliveryPatchDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatchedDeliveryPatchDtoCopyWith<$Res> {
  factory $PatchedDeliveryPatchDtoCopyWith(PatchedDeliveryPatchDto value,
          $Res Function(PatchedDeliveryPatchDto) then) =
      _$PatchedDeliveryPatchDtoCopyWithImpl<$Res, PatchedDeliveryPatchDto>;
  @useResult
  $Res call(
      {int? deliverer,
      int? order,
      int? product,
      @JsonKey(name: 'type') TypeEnum? type,
      @JsonKey(name: 'delivery_status') DeliveryStatusEnum? deliveryStatus,
      String? description});
}

/// @nodoc
class _$PatchedDeliveryPatchDtoCopyWithImpl<$Res,
        $Val extends PatchedDeliveryPatchDto>
    implements $PatchedDeliveryPatchDtoCopyWith<$Res> {
  _$PatchedDeliveryPatchDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatchedDeliveryPatchDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliverer = freezed,
    Object? order = freezed,
    Object? product = freezed,
    Object? type = freezed,
    Object? deliveryStatus = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatchedDeliveryPatchDtoImplCopyWith<$Res>
    implements $PatchedDeliveryPatchDtoCopyWith<$Res> {
  factory _$$PatchedDeliveryPatchDtoImplCopyWith(
          _$PatchedDeliveryPatchDtoImpl value,
          $Res Function(_$PatchedDeliveryPatchDtoImpl) then) =
      __$$PatchedDeliveryPatchDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? deliverer,
      int? order,
      int? product,
      @JsonKey(name: 'type') TypeEnum? type,
      @JsonKey(name: 'delivery_status') DeliveryStatusEnum? deliveryStatus,
      String? description});
}

/// @nodoc
class __$$PatchedDeliveryPatchDtoImplCopyWithImpl<$Res>
    extends _$PatchedDeliveryPatchDtoCopyWithImpl<$Res,
        _$PatchedDeliveryPatchDtoImpl>
    implements _$$PatchedDeliveryPatchDtoImplCopyWith<$Res> {
  __$$PatchedDeliveryPatchDtoImplCopyWithImpl(
      _$PatchedDeliveryPatchDtoImpl _value,
      $Res Function(_$PatchedDeliveryPatchDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatchedDeliveryPatchDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deliverer = freezed,
    Object? order = freezed,
    Object? product = freezed,
    Object? type = freezed,
    Object? deliveryStatus = freezed,
    Object? description = freezed,
  }) {
    return _then(_$PatchedDeliveryPatchDtoImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatchedDeliveryPatchDtoImpl implements _PatchedDeliveryPatchDto {
  const _$PatchedDeliveryPatchDtoImpl(
      {this.deliverer,
      this.order,
      this.product,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'delivery_status') this.deliveryStatus,
      this.description});

  factory _$PatchedDeliveryPatchDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatchedDeliveryPatchDtoImplFromJson(json);

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
  String toString() {
    return 'PatchedDeliveryPatchDto(deliverer: $deliverer, order: $order, product: $product, type: $type, deliveryStatus: $deliveryStatus, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatchedDeliveryPatchDtoImpl &&
            (identical(other.deliverer, deliverer) ||
                other.deliverer == deliverer) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.deliveryStatus, deliveryStatus) ||
                other.deliveryStatus == deliveryStatus) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, deliverer, order, product, type,
      deliveryStatus, description);

  /// Create a copy of PatchedDeliveryPatchDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchedDeliveryPatchDtoImplCopyWith<_$PatchedDeliveryPatchDtoImpl>
      get copyWith => __$$PatchedDeliveryPatchDtoImplCopyWithImpl<
          _$PatchedDeliveryPatchDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatchedDeliveryPatchDtoImplToJson(
      this,
    );
  }
}

abstract class _PatchedDeliveryPatchDto implements PatchedDeliveryPatchDto {
  const factory _PatchedDeliveryPatchDto(
      {final int? deliverer,
      final int? order,
      final int? product,
      @JsonKey(name: 'type') final TypeEnum? type,
      @JsonKey(name: 'delivery_status')
      final DeliveryStatusEnum? deliveryStatus,
      final String? description}) = _$PatchedDeliveryPatchDtoImpl;

  factory _PatchedDeliveryPatchDto.fromJson(Map<String, dynamic> json) =
      _$PatchedDeliveryPatchDtoImpl.fromJson;

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

  /// Create a copy of PatchedDeliveryPatchDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchedDeliveryPatchDtoImplCopyWith<_$PatchedDeliveryPatchDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
