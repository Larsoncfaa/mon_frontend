// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_client_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatchedClientProfile _$PatchedClientProfileFromJson(Map<String, dynamic> json) {
  return _PatchedClientProfile.fromJson(json);
}

/// @nodoc
mixin _$PatchedClientProfile {
  int? get id => throw _privateConstructorUsedError;
  int? get user => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  double? get balance => throw _privateConstructorUsedError;
  int? get points => throw _privateConstructorUsedError;

  /// Serializes this PatchedClientProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatchedClientProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatchedClientProfileCopyWith<PatchedClientProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatchedClientProfileCopyWith<$Res> {
  factory $PatchedClientProfileCopyWith(PatchedClientProfile value,
          $Res Function(PatchedClientProfile) then) =
      _$PatchedClientProfileCopyWithImpl<$Res, PatchedClientProfile>;
  @useResult
  $Res call(
      {int? id, int? user, String? location, double? balance, int? points});
}

/// @nodoc
class _$PatchedClientProfileCopyWithImpl<$Res,
        $Val extends PatchedClientProfile>
    implements $PatchedClientProfileCopyWith<$Res> {
  _$PatchedClientProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatchedClientProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? location = freezed,
    Object? balance = freezed,
    Object? points = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatchedClientProfileImplCopyWith<$Res>
    implements $PatchedClientProfileCopyWith<$Res> {
  factory _$$PatchedClientProfileImplCopyWith(_$PatchedClientProfileImpl value,
          $Res Function(_$PatchedClientProfileImpl) then) =
      __$$PatchedClientProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id, int? user, String? location, double? balance, int? points});
}

/// @nodoc
class __$$PatchedClientProfileImplCopyWithImpl<$Res>
    extends _$PatchedClientProfileCopyWithImpl<$Res, _$PatchedClientProfileImpl>
    implements _$$PatchedClientProfileImplCopyWith<$Res> {
  __$$PatchedClientProfileImplCopyWithImpl(_$PatchedClientProfileImpl _value,
      $Res Function(_$PatchedClientProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatchedClientProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? location = freezed,
    Object? balance = freezed,
    Object? points = freezed,
  }) {
    return _then(_$PatchedClientProfileImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatchedClientProfileImpl implements _PatchedClientProfile {
  const _$PatchedClientProfileImpl(
      {this.id, this.user, this.location, this.balance, this.points});

  factory _$PatchedClientProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatchedClientProfileImplFromJson(json);

  @override
  final int? id;
  @override
  final int? user;
  @override
  final String? location;
  @override
  final double? balance;
  @override
  final int? points;

  @override
  String toString() {
    return 'PatchedClientProfile(id: $id, user: $user, location: $location, balance: $balance, points: $points)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatchedClientProfileImpl &&
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

  /// Create a copy of PatchedClientProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchedClientProfileImplCopyWith<_$PatchedClientProfileImpl>
      get copyWith =>
          __$$PatchedClientProfileImplCopyWithImpl<_$PatchedClientProfileImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatchedClientProfileImplToJson(
      this,
    );
  }
}

abstract class _PatchedClientProfile implements PatchedClientProfile {
  const factory _PatchedClientProfile(
      {final int? id,
      final int? user,
      final String? location,
      final double? balance,
      final int? points}) = _$PatchedClientProfileImpl;

  factory _PatchedClientProfile.fromJson(Map<String, dynamic> json) =
      _$PatchedClientProfileImpl.fromJson;

  @override
  int? get id;
  @override
  int? get user;
  @override
  String? get location;
  @override
  double? get balance;
  @override
  int? get points;

  /// Create a copy of PatchedClientProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchedClientProfileImplCopyWith<_$PatchedClientProfileImpl>
      get copyWith => throw _privateConstructorUsedError;
}
