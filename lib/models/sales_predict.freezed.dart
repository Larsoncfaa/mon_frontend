// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_predict.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesPredict _$SalesPredictFromJson(Map<String, dynamic> json) {
  return _SalesPredict.fromJson(json);
}

/// @nodoc
mixin _$SalesPredict {
  /// ID du produit concerné par la prévision
  @JsonKey(name: 'product_id')
  int get productId => throw _privateConstructorUsedError;

  /// Période associée à la prévision (ex : "2025-06-01", "Semaine 22", etc.)
  @JsonKey(name: 'period')
  String get period => throw _privateConstructorUsedError;

  /// Valeur de vente prédite (exprimée en unités)
  @JsonKey(name: 'predicted_sales')
  int get predictedSales => throw _privateConstructorUsedError;

  /// Serializes this SalesPredict to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalesPredict
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesPredictCopyWith<SalesPredict> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesPredictCopyWith<$Res> {
  factory $SalesPredictCopyWith(
          SalesPredict value, $Res Function(SalesPredict) then) =
      _$SalesPredictCopyWithImpl<$Res, SalesPredict>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'period') String period,
      @JsonKey(name: 'predicted_sales') int predictedSales});
}

/// @nodoc
class _$SalesPredictCopyWithImpl<$Res, $Val extends SalesPredict>
    implements $SalesPredictCopyWith<$Res> {
  _$SalesPredictCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesPredict
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? period = null,
    Object? predictedSales = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      predictedSales: null == predictedSales
          ? _value.predictedSales
          : predictedSales // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesPredictImplCopyWith<$Res>
    implements $SalesPredictCopyWith<$Res> {
  factory _$$SalesPredictImplCopyWith(
          _$SalesPredictImpl value, $Res Function(_$SalesPredictImpl) then) =
      __$$SalesPredictImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'period') String period,
      @JsonKey(name: 'predicted_sales') int predictedSales});
}

/// @nodoc
class __$$SalesPredictImplCopyWithImpl<$Res>
    extends _$SalesPredictCopyWithImpl<$Res, _$SalesPredictImpl>
    implements _$$SalesPredictImplCopyWith<$Res> {
  __$$SalesPredictImplCopyWithImpl(
      _$SalesPredictImpl _value, $Res Function(_$SalesPredictImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesPredict
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? period = null,
    Object? predictedSales = null,
  }) {
    return _then(_$SalesPredictImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      predictedSales: null == predictedSales
          ? _value.predictedSales
          : predictedSales // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesPredictImpl implements _SalesPredict {
  const _$SalesPredictImpl(
      {@JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'period') required this.period,
      @JsonKey(name: 'predicted_sales') required this.predictedSales});

  factory _$SalesPredictImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesPredictImplFromJson(json);

  /// ID du produit concerné par la prévision
  @override
  @JsonKey(name: 'product_id')
  final int productId;

  /// Période associée à la prévision (ex : "2025-06-01", "Semaine 22", etc.)
  @override
  @JsonKey(name: 'period')
  final String period;

  /// Valeur de vente prédite (exprimée en unités)
  @override
  @JsonKey(name: 'predicted_sales')
  final int predictedSales;

  @override
  String toString() {
    return 'SalesPredict(productId: $productId, period: $period, predictedSales: $predictedSales)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesPredictImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.predictedSales, predictedSales) ||
                other.predictedSales == predictedSales));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, productId, period, predictedSales);

  /// Create a copy of SalesPredict
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesPredictImplCopyWith<_$SalesPredictImpl> get copyWith =>
      __$$SalesPredictImplCopyWithImpl<_$SalesPredictImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesPredictImplToJson(
      this,
    );
  }
}

abstract class _SalesPredict implements SalesPredict {
  const factory _SalesPredict(
      {@JsonKey(name: 'product_id') required final int productId,
      @JsonKey(name: 'period') required final String period,
      @JsonKey(name: 'predicted_sales')
      required final int predictedSales}) = _$SalesPredictImpl;

  factory _SalesPredict.fromJson(Map<String, dynamic> json) =
      _$SalesPredictImpl.fromJson;

  /// ID du produit concerné par la prévision
  @override
  @JsonKey(name: 'product_id')
  int get productId;

  /// Période associée à la prévision (ex : "2025-06-01", "Semaine 22", etc.)
  @override
  @JsonKey(name: 'period')
  String get period;

  /// Valeur de vente prédite (exprimée en unités)
  @override
  @JsonKey(name: 'predicted_sales')
  int get predictedSales;

  /// Create a copy of SalesPredict
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesPredictImplCopyWith<_$SalesPredictImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
