// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_predict.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InventoryPredict _$InventoryPredictFromJson(Map<String, dynamic> json) {
  return _InventoryPredict.fromJson(json);
}

/// @nodoc
mixin _$InventoryPredict {
  /// ID du produit concerné par la prédiction
  @JsonKey(name: 'product_id')
  int get productId => throw _privateConstructorUsedError;

  /// Nombre de jours projetés dans la prédiction
  @JsonKey(name: 'days')
  int get days => throw _privateConstructorUsedError;

  /// Stock prédit à la fin de la période
  @JsonKey(name: 'predicted_inventory')
  int get predictedInventory => throw _privateConstructorUsedError;

  /// Serializes this InventoryPredict to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InventoryPredict
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InventoryPredictCopyWith<InventoryPredict> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryPredictCopyWith<$Res> {
  factory $InventoryPredictCopyWith(
          InventoryPredict value, $Res Function(InventoryPredict) then) =
      _$InventoryPredictCopyWithImpl<$Res, InventoryPredict>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'days') int days,
      @JsonKey(name: 'predicted_inventory') int predictedInventory});
}

/// @nodoc
class _$InventoryPredictCopyWithImpl<$Res, $Val extends InventoryPredict>
    implements $InventoryPredictCopyWith<$Res> {
  _$InventoryPredictCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InventoryPredict
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? days = null,
    Object? predictedInventory = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as int,
      predictedInventory: null == predictedInventory
          ? _value.predictedInventory
          : predictedInventory // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryPredictImplCopyWith<$Res>
    implements $InventoryPredictCopyWith<$Res> {
  factory _$$InventoryPredictImplCopyWith(_$InventoryPredictImpl value,
          $Res Function(_$InventoryPredictImpl) then) =
      __$$InventoryPredictImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'days') int days,
      @JsonKey(name: 'predicted_inventory') int predictedInventory});
}

/// @nodoc
class __$$InventoryPredictImplCopyWithImpl<$Res>
    extends _$InventoryPredictCopyWithImpl<$Res, _$InventoryPredictImpl>
    implements _$$InventoryPredictImplCopyWith<$Res> {
  __$$InventoryPredictImplCopyWithImpl(_$InventoryPredictImpl _value,
      $Res Function(_$InventoryPredictImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryPredict
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? days = null,
    Object? predictedInventory = null,
  }) {
    return _then(_$InventoryPredictImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as int,
      predictedInventory: null == predictedInventory
          ? _value.predictedInventory
          : predictedInventory // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryPredictImpl implements _InventoryPredict {
  const _$InventoryPredictImpl(
      {@JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'days') required this.days,
      @JsonKey(name: 'predicted_inventory') required this.predictedInventory});

  factory _$InventoryPredictImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryPredictImplFromJson(json);

  /// ID du produit concerné par la prédiction
  @override
  @JsonKey(name: 'product_id')
  final int productId;

  /// Nombre de jours projetés dans la prédiction
  @override
  @JsonKey(name: 'days')
  final int days;

  /// Stock prédit à la fin de la période
  @override
  @JsonKey(name: 'predicted_inventory')
  final int predictedInventory;

  @override
  String toString() {
    return 'InventoryPredict(productId: $productId, days: $days, predictedInventory: $predictedInventory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryPredictImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.days, days) || other.days == days) &&
            (identical(other.predictedInventory, predictedInventory) ||
                other.predictedInventory == predictedInventory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productId, days, predictedInventory);

  /// Create a copy of InventoryPredict
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryPredictImplCopyWith<_$InventoryPredictImpl> get copyWith =>
      __$$InventoryPredictImplCopyWithImpl<_$InventoryPredictImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryPredictImplToJson(
      this,
    );
  }
}

abstract class _InventoryPredict implements InventoryPredict {
  const factory _InventoryPredict(
      {@JsonKey(name: 'product_id') required final int productId,
      @JsonKey(name: 'days') required final int days,
      @JsonKey(name: 'predicted_inventory')
      required final int predictedInventory}) = _$InventoryPredictImpl;

  factory _InventoryPredict.fromJson(Map<String, dynamic> json) =
      _$InventoryPredictImpl.fromJson;

  /// ID du produit concerné par la prédiction
  @override
  @JsonKey(name: 'product_id')
  int get productId;

  /// Nombre de jours projetés dans la prédiction
  @override
  @JsonKey(name: 'days')
  int get days;

  /// Stock prédit à la fin de la période
  @override
  @JsonKey(name: 'predicted_inventory')
  int get predictedInventory;

  /// Create a copy of InventoryPredict
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InventoryPredictImplCopyWith<_$InventoryPredictImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
