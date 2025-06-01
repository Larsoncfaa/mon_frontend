// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_predict.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeliveryPredict _$DeliveryPredictFromJson(Map<String, dynamic> json) {
  return _DeliveryPredict.fromJson(json);
}

/// @nodoc
mixin _$DeliveryPredict {
  /// ID du produit concerné
  @JsonKey(name: 'product_id')
  int get productId => throw _privateConstructorUsedError;

  /// Quantité demandée pour la prédiction
  int get quantity => throw _privateConstructorUsedError;

  /// Résultat de la prédiction (ex : durée estimée, etc.)
  String get prediction => throw _privateConstructorUsedError;

  /// Serializes this DeliveryPredict to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryPredict
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryPredictCopyWith<DeliveryPredict> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryPredictCopyWith<$Res> {
  factory $DeliveryPredictCopyWith(
          DeliveryPredict value, $Res Function(DeliveryPredict) then) =
      _$DeliveryPredictCopyWithImpl<$Res, DeliveryPredict>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') int productId,
      int quantity,
      String prediction});
}

/// @nodoc
class _$DeliveryPredictCopyWithImpl<$Res, $Val extends DeliveryPredict>
    implements $DeliveryPredictCopyWith<$Res> {
  _$DeliveryPredictCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryPredict
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? quantity = null,
    Object? prediction = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      prediction: null == prediction
          ? _value.prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryPredictImplCopyWith<$Res>
    implements $DeliveryPredictCopyWith<$Res> {
  factory _$$DeliveryPredictImplCopyWith(_$DeliveryPredictImpl value,
          $Res Function(_$DeliveryPredictImpl) then) =
      __$$DeliveryPredictImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') int productId,
      int quantity,
      String prediction});
}

/// @nodoc
class __$$DeliveryPredictImplCopyWithImpl<$Res>
    extends _$DeliveryPredictCopyWithImpl<$Res, _$DeliveryPredictImpl>
    implements _$$DeliveryPredictImplCopyWith<$Res> {
  __$$DeliveryPredictImplCopyWithImpl(
      _$DeliveryPredictImpl _value, $Res Function(_$DeliveryPredictImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryPredict
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? quantity = null,
    Object? prediction = null,
  }) {
    return _then(_$DeliveryPredictImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      prediction: null == prediction
          ? _value.prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryPredictImpl implements _DeliveryPredict {
  const _$DeliveryPredictImpl(
      {@JsonKey(name: 'product_id') required this.productId,
      required this.quantity,
      required this.prediction});

  factory _$DeliveryPredictImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryPredictImplFromJson(json);

  /// ID du produit concerné
  @override
  @JsonKey(name: 'product_id')
  final int productId;

  /// Quantité demandée pour la prédiction
  @override
  final int quantity;

  /// Résultat de la prédiction (ex : durée estimée, etc.)
  @override
  final String prediction;

  @override
  String toString() {
    return 'DeliveryPredict(productId: $productId, quantity: $quantity, prediction: $prediction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryPredictImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.prediction, prediction) ||
                other.prediction == prediction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId, quantity, prediction);

  /// Create a copy of DeliveryPredict
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryPredictImplCopyWith<_$DeliveryPredictImpl> get copyWith =>
      __$$DeliveryPredictImplCopyWithImpl<_$DeliveryPredictImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryPredictImplToJson(
      this,
    );
  }
}

abstract class _DeliveryPredict implements DeliveryPredict {
  const factory _DeliveryPredict(
      {@JsonKey(name: 'product_id') required final int productId,
      required final int quantity,
      required final String prediction}) = _$DeliveryPredictImpl;

  factory _DeliveryPredict.fromJson(Map<String, dynamic> json) =
      _$DeliveryPredictImpl.fromJson;

  /// ID du produit concerné
  @override
  @JsonKey(name: 'product_id')
  int get productId;

  /// Quantité demandée pour la prédiction
  @override
  int get quantity;

  /// Résultat de la prédiction (ex : durée estimée, etc.)
  @override
  String get prediction;

  /// Create a copy of DeliveryPredict
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryPredictImplCopyWith<_$DeliveryPredictImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
