// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loyalty_program.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoyaltyProgram _$LoyaltyProgramFromJson(Map<String, dynamic> json) {
  return _LoyaltyProgram.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyProgram {
  int get id => throw _privateConstructorUsedError;
  int get client => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;
  Map<String, dynamic>? get transactions => throw _privateConstructorUsedError;

  /// Serializes this LoyaltyProgram to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoyaltyProgram
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoyaltyProgramCopyWith<LoyaltyProgram> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyProgramCopyWith<$Res> {
  factory $LoyaltyProgramCopyWith(
          LoyaltyProgram value, $Res Function(LoyaltyProgram) then) =
      _$LoyaltyProgramCopyWithImpl<$Res, LoyaltyProgram>;
  @useResult
  $Res call(
      {int id,
      int client,
      int points,
      DateTime lastUpdated,
      Map<String, dynamic>? transactions});
}

/// @nodoc
class _$LoyaltyProgramCopyWithImpl<$Res, $Val extends LoyaltyProgram>
    implements $LoyaltyProgramCopyWith<$Res> {
  _$LoyaltyProgramCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoyaltyProgram
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? client = null,
    Object? points = null,
    Object? lastUpdated = null,
    Object? transactions = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactions: freezed == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoyaltyProgramImplCopyWith<$Res>
    implements $LoyaltyProgramCopyWith<$Res> {
  factory _$$LoyaltyProgramImplCopyWith(_$LoyaltyProgramImpl value,
          $Res Function(_$LoyaltyProgramImpl) then) =
      __$$LoyaltyProgramImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int client,
      int points,
      DateTime lastUpdated,
      Map<String, dynamic>? transactions});
}

/// @nodoc
class __$$LoyaltyProgramImplCopyWithImpl<$Res>
    extends _$LoyaltyProgramCopyWithImpl<$Res, _$LoyaltyProgramImpl>
    implements _$$LoyaltyProgramImplCopyWith<$Res> {
  __$$LoyaltyProgramImplCopyWithImpl(
      _$LoyaltyProgramImpl _value, $Res Function(_$LoyaltyProgramImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoyaltyProgram
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? client = null,
    Object? points = null,
    Object? lastUpdated = null,
    Object? transactions = freezed,
  }) {
    return _then(_$LoyaltyProgramImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactions: freezed == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoyaltyProgramImpl implements _LoyaltyProgram {
  const _$LoyaltyProgramImpl(
      {required this.id,
      required this.client,
      required this.points,
      required this.lastUpdated,
      final Map<String, dynamic>? transactions})
      : _transactions = transactions;

  factory _$LoyaltyProgramImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoyaltyProgramImplFromJson(json);

  @override
  final int id;
  @override
  final int client;
  @override
  final int points;
  @override
  final DateTime lastUpdated;
  final Map<String, dynamic>? _transactions;
  @override
  Map<String, dynamic>? get transactions {
    final value = _transactions;
    if (value == null) return null;
    if (_transactions is EqualUnmodifiableMapView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'LoyaltyProgram(id: $id, client: $client, points: $points, lastUpdated: $lastUpdated, transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoyaltyProgramImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, client, points, lastUpdated,
      const DeepCollectionEquality().hash(_transactions));

  /// Create a copy of LoyaltyProgram
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoyaltyProgramImplCopyWith<_$LoyaltyProgramImpl> get copyWith =>
      __$$LoyaltyProgramImplCopyWithImpl<_$LoyaltyProgramImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoyaltyProgramImplToJson(
      this,
    );
  }
}

abstract class _LoyaltyProgram implements LoyaltyProgram {
  const factory _LoyaltyProgram(
      {required final int id,
      required final int client,
      required final int points,
      required final DateTime lastUpdated,
      final Map<String, dynamic>? transactions}) = _$LoyaltyProgramImpl;

  factory _LoyaltyProgram.fromJson(Map<String, dynamic> json) =
      _$LoyaltyProgramImpl.fromJson;

  @override
  int get id;
  @override
  int get client;
  @override
  int get points;
  @override
  DateTime get lastUpdated;
  @override
  Map<String, dynamic>? get transactions;

  /// Create a copy of LoyaltyProgram
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoyaltyProgramImplCopyWith<_$LoyaltyProgramImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
