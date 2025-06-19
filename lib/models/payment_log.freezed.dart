// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentLog _$PaymentLogFromJson(Map<String, dynamic> json) {
  return _PaymentLog.fromJson(json);
}

/// @nodoc
mixin _$PaymentLog {
  int get id => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  @JsonKey(name: 'attempt_time')
  DateTime get attemptTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_status')
  String get paymentStatus => throw _privateConstructorUsedError;
  @StringToDoubleConverter()
  double get amount => throw _privateConstructorUsedError;
  Map<String, dynamic>? get info => throw _privateConstructorUsedError;

  /// Serializes this PaymentLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentLogCopyWith<PaymentLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentLogCopyWith<$Res> {
  factory $PaymentLogCopyWith(
          PaymentLog value, $Res Function(PaymentLog) then) =
      _$PaymentLogCopyWithImpl<$Res, PaymentLog>;
  @useResult
  $Res call(
      {int id,
      int order,
      @JsonKey(name: 'attempt_time') DateTime attemptTime,
      @JsonKey(name: 'payment_status') String paymentStatus,
      @StringToDoubleConverter() double amount,
      Map<String, dynamic>? info});
}

/// @nodoc
class _$PaymentLogCopyWithImpl<$Res, $Val extends PaymentLog>
    implements $PaymentLogCopyWith<$Res> {
  _$PaymentLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? order = null,
    Object? attemptTime = null,
    Object? paymentStatus = null,
    Object? amount = null,
    Object? info = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      attemptTime: null == attemptTime
          ? _value.attemptTime
          : attemptTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentLogImplCopyWith<$Res>
    implements $PaymentLogCopyWith<$Res> {
  factory _$$PaymentLogImplCopyWith(
          _$PaymentLogImpl value, $Res Function(_$PaymentLogImpl) then) =
      __$$PaymentLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int order,
      @JsonKey(name: 'attempt_time') DateTime attemptTime,
      @JsonKey(name: 'payment_status') String paymentStatus,
      @StringToDoubleConverter() double amount,
      Map<String, dynamic>? info});
}

/// @nodoc
class __$$PaymentLogImplCopyWithImpl<$Res>
    extends _$PaymentLogCopyWithImpl<$Res, _$PaymentLogImpl>
    implements _$$PaymentLogImplCopyWith<$Res> {
  __$$PaymentLogImplCopyWithImpl(
      _$PaymentLogImpl _value, $Res Function(_$PaymentLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? order = null,
    Object? attemptTime = null,
    Object? paymentStatus = null,
    Object? amount = null,
    Object? info = freezed,
  }) {
    return _then(_$PaymentLogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      attemptTime: null == attemptTime
          ? _value.attemptTime
          : attemptTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      info: freezed == info
          ? _value._info
          : info // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentLogImpl implements _PaymentLog {
  const _$PaymentLogImpl(
      {required this.id,
      required this.order,
      @JsonKey(name: 'attempt_time') required this.attemptTime,
      @JsonKey(name: 'payment_status') required this.paymentStatus,
      @StringToDoubleConverter() required this.amount,
      final Map<String, dynamic>? info})
      : _info = info;

  factory _$PaymentLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentLogImplFromJson(json);

  @override
  final int id;
  @override
  final int order;
  @override
  @JsonKey(name: 'attempt_time')
  final DateTime attemptTime;
  @override
  @JsonKey(name: 'payment_status')
  final String paymentStatus;
  @override
  @StringToDoubleConverter()
  final double amount;
  final Map<String, dynamic>? _info;
  @override
  Map<String, dynamic>? get info {
    final value = _info;
    if (value == null) return null;
    if (_info is EqualUnmodifiableMapView) return _info;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'PaymentLog(id: $id, order: $order, attemptTime: $attemptTime, paymentStatus: $paymentStatus, amount: $amount, info: $info)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.attemptTime, attemptTime) ||
                other.attemptTime == attemptTime) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            const DeepCollectionEquality().equals(other._info, _info));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, order, attemptTime,
      paymentStatus, amount, const DeepCollectionEquality().hash(_info));

  /// Create a copy of PaymentLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentLogImplCopyWith<_$PaymentLogImpl> get copyWith =>
      __$$PaymentLogImplCopyWithImpl<_$PaymentLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentLogImplToJson(
      this,
    );
  }
}

abstract class _PaymentLog implements PaymentLog {
  const factory _PaymentLog(
      {required final int id,
      required final int order,
      @JsonKey(name: 'attempt_time') required final DateTime attemptTime,
      @JsonKey(name: 'payment_status') required final String paymentStatus,
      @StringToDoubleConverter() required final double amount,
      final Map<String, dynamic>? info}) = _$PaymentLogImpl;

  factory _PaymentLog.fromJson(Map<String, dynamic> json) =
      _$PaymentLogImpl.fromJson;

  @override
  int get id;
  @override
  int get order;
  @override
  @JsonKey(name: 'attempt_time')
  DateTime get attemptTime;
  @override
  @JsonKey(name: 'payment_status')
  String get paymentStatus;
  @override
  @StringToDoubleConverter()
  double get amount;
  @override
  Map<String, dynamic>? get info;

  /// Create a copy of PaymentLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentLogImplCopyWith<_$PaymentLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
