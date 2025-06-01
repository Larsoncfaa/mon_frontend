// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StockAlert _$StockAlertFromJson(Map<String, dynamic> json) {
  return _StockAlert.fromJson(json);
}

/// @nodoc
mixin _$StockAlert {
  int get id => throw _privateConstructorUsedError;
  int get product => throw _privateConstructorUsedError;
  int get threshold => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;

  /// Serializes this StockAlert to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockAlertCopyWith<StockAlert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockAlertCopyWith<$Res> {
  factory $StockAlertCopyWith(
          StockAlert value, $Res Function(StockAlert) then) =
      _$StockAlertCopyWithImpl<$Res, StockAlert>;
  @useResult
  $Res call(
      {int id,
      int product,
      int threshold,
      @JsonKey(name: 'is_active') bool? isActive});
}

/// @nodoc
class _$StockAlertCopyWithImpl<$Res, $Val extends StockAlert>
    implements $StockAlertCopyWith<$Res> {
  _$StockAlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? threshold = null,
    Object? isActive = freezed,
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
      threshold: null == threshold
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockAlertImplCopyWith<$Res>
    implements $StockAlertCopyWith<$Res> {
  factory _$$StockAlertImplCopyWith(
          _$StockAlertImpl value, $Res Function(_$StockAlertImpl) then) =
      __$$StockAlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int product,
      int threshold,
      @JsonKey(name: 'is_active') bool? isActive});
}

/// @nodoc
class __$$StockAlertImplCopyWithImpl<$Res>
    extends _$StockAlertCopyWithImpl<$Res, _$StockAlertImpl>
    implements _$$StockAlertImplCopyWith<$Res> {
  __$$StockAlertImplCopyWithImpl(
      _$StockAlertImpl _value, $Res Function(_$StockAlertImpl) _then)
      : super(_value, _then);

  /// Create a copy of StockAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? threshold = null,
    Object? isActive = freezed,
  }) {
    return _then(_$StockAlertImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as int,
      threshold: null == threshold
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockAlertImpl implements _StockAlert {
  const _$StockAlertImpl(
      {required this.id,
      required this.product,
      required this.threshold,
      @JsonKey(name: 'is_active') this.isActive});

  factory _$StockAlertImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockAlertImplFromJson(json);

  @override
  final int id;
  @override
  final int product;
  @override
  final int threshold;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;

  @override
  String toString() {
    return 'StockAlert(id: $id, product: $product, threshold: $threshold, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockAlertImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.threshold, threshold) ||
                other.threshold == threshold) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, product, threshold, isActive);

  /// Create a copy of StockAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockAlertImplCopyWith<_$StockAlertImpl> get copyWith =>
      __$$StockAlertImplCopyWithImpl<_$StockAlertImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockAlertImplToJson(
      this,
    );
  }
}

abstract class _StockAlert implements StockAlert {
  const factory _StockAlert(
      {required final int id,
      required final int product,
      required final int threshold,
      @JsonKey(name: 'is_active') final bool? isActive}) = _$StockAlertImpl;

  factory _StockAlert.fromJson(Map<String, dynamic> json) =
      _$StockAlertImpl.fromJson;

  @override
  int get id;
  @override
  int get product;
  @override
  int get threshold;
  @override
  @JsonKey(name: 'is_active')
  bool? get isActive;

  /// Create a copy of StockAlert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockAlertImplCopyWith<_$StockAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
