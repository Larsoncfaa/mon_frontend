// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_payment_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatchedPaymentLog _$PatchedPaymentLogFromJson(Map<String, dynamic> json) {
  return _PatchedPaymentLog.fromJson(json);
}

/// @nodoc
mixin _$PatchedPaymentLog {
  int? get id => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;
  @JsonKey(name: 'attempt_time')
  DateTime? get attemptTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_status')
  String? get paymentStatus => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  Map<String, dynamic>? get info => throw _privateConstructorUsedError;

  /// Serializes this PatchedPaymentLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatchedPaymentLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatchedPaymentLogCopyWith<PatchedPaymentLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatchedPaymentLogCopyWith<$Res> {
  factory $PatchedPaymentLogCopyWith(
          PatchedPaymentLog value, $Res Function(PatchedPaymentLog) then) =
      _$PatchedPaymentLogCopyWithImpl<$Res, PatchedPaymentLog>;
  @useResult
  $Res call(
      {int? id,
      int? order,
      @JsonKey(name: 'attempt_time') DateTime? attemptTime,
      @JsonKey(name: 'payment_status') String? paymentStatus,
      double? amount,
      Map<String, dynamic>? info});
}

/// @nodoc
class _$PatchedPaymentLogCopyWithImpl<$Res, $Val extends PatchedPaymentLog>
    implements $PatchedPaymentLogCopyWith<$Res> {
  _$PatchedPaymentLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatchedPaymentLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? order = freezed,
    Object? attemptTime = freezed,
    Object? paymentStatus = freezed,
    Object? amount = freezed,
    Object? info = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      attemptTime: freezed == attemptTime
          ? _value.attemptTime
          : attemptTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatchedPaymentLogImplCopyWith<$Res>
    implements $PatchedPaymentLogCopyWith<$Res> {
  factory _$$PatchedPaymentLogImplCopyWith(_$PatchedPaymentLogImpl value,
          $Res Function(_$PatchedPaymentLogImpl) then) =
      __$$PatchedPaymentLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? order,
      @JsonKey(name: 'attempt_time') DateTime? attemptTime,
      @JsonKey(name: 'payment_status') String? paymentStatus,
      double? amount,
      Map<String, dynamic>? info});
}

/// @nodoc
class __$$PatchedPaymentLogImplCopyWithImpl<$Res>
    extends _$PatchedPaymentLogCopyWithImpl<$Res, _$PatchedPaymentLogImpl>
    implements _$$PatchedPaymentLogImplCopyWith<$Res> {
  __$$PatchedPaymentLogImplCopyWithImpl(_$PatchedPaymentLogImpl _value,
      $Res Function(_$PatchedPaymentLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatchedPaymentLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? order = freezed,
    Object? attemptTime = freezed,
    Object? paymentStatus = freezed,
    Object? amount = freezed,
    Object? info = freezed,
  }) {
    return _then(_$PatchedPaymentLogImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      attemptTime: freezed == attemptTime
          ? _value.attemptTime
          : attemptTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      info: freezed == info
          ? _value._info
          : info // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatchedPaymentLogImpl implements _PatchedPaymentLog {
  const _$PatchedPaymentLogImpl(
      {this.id,
      this.order,
      @JsonKey(name: 'attempt_time') this.attemptTime,
      @JsonKey(name: 'payment_status') this.paymentStatus,
      this.amount,
      final Map<String, dynamic>? info})
      : _info = info;

  factory _$PatchedPaymentLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatchedPaymentLogImplFromJson(json);

  @override
  final int? id;
  @override
  final int? order;
  @override
  @JsonKey(name: 'attempt_time')
  final DateTime? attemptTime;
  @override
  @JsonKey(name: 'payment_status')
  final String? paymentStatus;
  @override
  final double? amount;
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
    return 'PatchedPaymentLog(id: $id, order: $order, attemptTime: $attemptTime, paymentStatus: $paymentStatus, amount: $amount, info: $info)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatchedPaymentLogImpl &&
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

  /// Create a copy of PatchedPaymentLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchedPaymentLogImplCopyWith<_$PatchedPaymentLogImpl> get copyWith =>
      __$$PatchedPaymentLogImplCopyWithImpl<_$PatchedPaymentLogImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatchedPaymentLogImplToJson(
      this,
    );
  }
}

abstract class _PatchedPaymentLog implements PatchedPaymentLog {
  const factory _PatchedPaymentLog(
      {final int? id,
      final int? order,
      @JsonKey(name: 'attempt_time') final DateTime? attemptTime,
      @JsonKey(name: 'payment_status') final String? paymentStatus,
      final double? amount,
      final Map<String, dynamic>? info}) = _$PatchedPaymentLogImpl;

  factory _PatchedPaymentLog.fromJson(Map<String, dynamic> json) =
      _$PatchedPaymentLogImpl.fromJson;

  @override
  int? get id;
  @override
  int? get order;
  @override
  @JsonKey(name: 'attempt_time')
  DateTime? get attemptTime;
  @override
  @JsonKey(name: 'payment_status')
  String? get paymentStatus;
  @override
  double? get amount;
  @override
  Map<String, dynamic>? get info;

  /// Create a copy of PatchedPaymentLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchedPaymentLogImplCopyWith<_$PatchedPaymentLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
