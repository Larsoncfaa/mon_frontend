// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClientProfile _$ClientProfileFromJson(Map<String, dynamic> json) {
  return _ClientProfile.fromJson(json);
}

/// @nodoc
mixin _$ClientProfile {
  int get id => throw _privateConstructorUsedError;
  int get user => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;

  /// Serializes this ClientProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClientProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClientProfileCopyWith<ClientProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientProfileCopyWith<$Res> {
  factory $ClientProfileCopyWith(
          ClientProfile value, $Res Function(ClientProfile) then) =
      _$ClientProfileCopyWithImpl<$Res, ClientProfile>;
  @useResult
  $Res call({int id, int user, String location, double balance, int points});
}

/// @nodoc
class _$ClientProfileCopyWithImpl<$Res, $Val extends ClientProfile>
    implements $ClientProfileCopyWith<$Res> {
  _$ClientProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClientProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? location = null,
    Object? balance = null,
    Object? points = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClientProfileImplCopyWith<$Res>
    implements $ClientProfileCopyWith<$Res> {
  factory _$$ClientProfileImplCopyWith(
          _$ClientProfileImpl value, $Res Function(_$ClientProfileImpl) then) =
      __$$ClientProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int user, String location, double balance, int points});
}

/// @nodoc
class __$$ClientProfileImplCopyWithImpl<$Res>
    extends _$ClientProfileCopyWithImpl<$Res, _$ClientProfileImpl>
    implements _$$ClientProfileImplCopyWith<$Res> {
  __$$ClientProfileImplCopyWithImpl(
      _$ClientProfileImpl _value, $Res Function(_$ClientProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClientProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? location = null,
    Object? balance = null,
    Object? points = null,
  }) {
    return _then(_$ClientProfileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClientProfileImpl implements _ClientProfile {
  const _$ClientProfileImpl(
      {required this.id,
      required this.user,
      required this.location,
      required this.balance,
      required this.points});

  factory _$ClientProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClientProfileImplFromJson(json);

  @override
  final int id;
  @override
  final int user;
  @override
  final String location;
  @override
  final double balance;
  @override
  final int points;

  @override
  String toString() {
    return 'ClientProfile(id: $id, user: $user, location: $location, balance: $balance, points: $points)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.points, points) || other.points == points));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, user, location, balance, points);

  /// Create a copy of ClientProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientProfileImplCopyWith<_$ClientProfileImpl> get copyWith =>
      __$$ClientProfileImplCopyWithImpl<_$ClientProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClientProfileImplToJson(
      this,
    );
  }
}

abstract class _ClientProfile implements ClientProfile {
  const factory _ClientProfile(
      {required final int id,
      required final int user,
      required final String location,
      required final double balance,
      required final int points}) = _$ClientProfileImpl;

  factory _ClientProfile.fromJson(Map<String, dynamic> json) =
      _$ClientProfileImpl.fromJson;

  @override
  int get id;
  @override
  int get user;
  @override
  String get location;
  @override
  double get balance;
  @override
  int get points;

  /// Create a copy of ClientProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClientProfileImplCopyWith<_$ClientProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
