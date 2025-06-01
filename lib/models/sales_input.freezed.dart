// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesInput _$SalesInputFromJson(Map<String, dynamic> json) {
  return _SalesInput.fromJson(json);
}

/// @nodoc
mixin _$SalesInput {
  /// ID du produit (obligatoire)
  @JsonKey(name: 'product_id')
  int get productId => throw _privateConstructorUsedError;

  /// Nombre de jours d'historique à considérer (par défaut : 30)
  @JsonKey(name: 'history_days')
  int? get historyDays => throw _privateConstructorUsedError;

  /// Nombre de jours à prédire (par défaut : 30)
  @JsonKey(name: 'forecast_days')
  int? get forecastDays => throw _privateConstructorUsedError;

  /// Serializes this SalesInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalesInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesInputCopyWith<SalesInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesInputCopyWith<$Res> {
  factory $SalesInputCopyWith(
          SalesInput value, $Res Function(SalesInput) then) =
      _$SalesInputCopyWithImpl<$Res, SalesInput>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'history_days') int? historyDays,
      @JsonKey(name: 'forecast_days') int? forecastDays});
}

/// @nodoc
class _$SalesInputCopyWithImpl<$Res, $Val extends SalesInput>
    implements $SalesInputCopyWith<$Res> {
  _$SalesInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? historyDays = freezed,
    Object? forecastDays = freezed,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      historyDays: freezed == historyDays
          ? _value.historyDays
          : historyDays // ignore: cast_nullable_to_non_nullable
              as int?,
      forecastDays: freezed == forecastDays
          ? _value.forecastDays
          : forecastDays // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesInputImplCopyWith<$Res>
    implements $SalesInputCopyWith<$Res> {
  factory _$$SalesInputImplCopyWith(
          _$SalesInputImpl value, $Res Function(_$SalesInputImpl) then) =
      __$$SalesInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'history_days') int? historyDays,
      @JsonKey(name: 'forecast_days') int? forecastDays});
}

/// @nodoc
class __$$SalesInputImplCopyWithImpl<$Res>
    extends _$SalesInputCopyWithImpl<$Res, _$SalesInputImpl>
    implements _$$SalesInputImplCopyWith<$Res> {
  __$$SalesInputImplCopyWithImpl(
      _$SalesInputImpl _value, $Res Function(_$SalesInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? historyDays = freezed,
    Object? forecastDays = freezed,
  }) {
    return _then(_$SalesInputImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      historyDays: freezed == historyDays
          ? _value.historyDays
          : historyDays // ignore: cast_nullable_to_non_nullable
              as int?,
      forecastDays: freezed == forecastDays
          ? _value.forecastDays
          : forecastDays // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesInputImpl implements _SalesInput {
  const _$SalesInputImpl(
      {@JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'history_days') this.historyDays,
      @JsonKey(name: 'forecast_days') this.forecastDays});

  factory _$SalesInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesInputImplFromJson(json);

  /// ID du produit (obligatoire)
  @override
  @JsonKey(name: 'product_id')
  final int productId;

  /// Nombre de jours d'historique à considérer (par défaut : 30)
  @override
  @JsonKey(name: 'history_days')
  final int? historyDays;

  /// Nombre de jours à prédire (par défaut : 30)
  @override
  @JsonKey(name: 'forecast_days')
  final int? forecastDays;

  @override
  String toString() {
    return 'SalesInput(productId: $productId, historyDays: $historyDays, forecastDays: $forecastDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesInputImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.historyDays, historyDays) ||
                other.historyDays == historyDays) &&
            (identical(other.forecastDays, forecastDays) ||
                other.forecastDays == forecastDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productId, historyDays, forecastDays);

  /// Create a copy of SalesInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesInputImplCopyWith<_$SalesInputImpl> get copyWith =>
      __$$SalesInputImplCopyWithImpl<_$SalesInputImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesInputImplToJson(
      this,
    );
  }
}

abstract class _SalesInput implements SalesInput {
  const factory _SalesInput(
          {@JsonKey(name: 'product_id') required final int productId,
          @JsonKey(name: 'history_days') final int? historyDays,
          @JsonKey(name: 'forecast_days') final int? forecastDays}) =
      _$SalesInputImpl;

  factory _SalesInput.fromJson(Map<String, dynamic> json) =
      _$SalesInputImpl.fromJson;

  /// ID du produit (obligatoire)
  @override
  @JsonKey(name: 'product_id')
  int get productId;

  /// Nombre de jours d'historique à considérer (par défaut : 30)
  @override
  @JsonKey(name: 'history_days')
  int? get historyDays;

  /// Nombre de jours à prédire (par défaut : 30)
  @override
  @JsonKey(name: 'forecast_days')
  int? get forecastDays;

  /// Create a copy of SalesInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesInputImplCopyWith<_$SalesInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
