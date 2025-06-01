// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatchedUser _$PatchedUserFromJson(Map<String, dynamic> json) {
  return _PatchedUser.fromJson(json);
}

/// @nodoc
mixin _$PatchedUser {
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this PatchedUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatchedUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatchedUserCopyWith<PatchedUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatchedUserCopyWith<$Res> {
  factory $PatchedUserCopyWith(
          PatchedUser value, $Res Function(PatchedUser) then) =
      _$PatchedUserCopyWithImpl<$Res, PatchedUser>;
  @useResult
  $Res call(
      {String? email,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      int? id});
}

/// @nodoc
class _$PatchedUserCopyWithImpl<$Res, $Val extends PatchedUser>
    implements $PatchedUserCopyWith<$Res> {
  _$PatchedUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatchedUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatchedUserImplCopyWith<$Res>
    implements $PatchedUserCopyWith<$Res> {
  factory _$$PatchedUserImplCopyWith(
          _$PatchedUserImpl value, $Res Function(_$PatchedUserImpl) then) =
      __$$PatchedUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? email,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      int? id});
}

/// @nodoc
class __$$PatchedUserImplCopyWithImpl<$Res>
    extends _$PatchedUserCopyWithImpl<$Res, _$PatchedUserImpl>
    implements _$$PatchedUserImplCopyWith<$Res> {
  __$$PatchedUserImplCopyWithImpl(
      _$PatchedUserImpl _value, $Res Function(_$PatchedUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatchedUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? id = freezed,
  }) {
    return _then(_$PatchedUserImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatchedUserImpl implements _PatchedUser {
  const _$PatchedUserImpl(
      {this.email,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      this.id});

  factory _$PatchedUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatchedUserImplFromJson(json);

  @override
  final String? email;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  final int? id;

  @override
  String toString() {
    return 'PatchedUser(email: $email, firstName: $firstName, lastName: $lastName, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatchedUserImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, firstName, lastName, id);

  /// Create a copy of PatchedUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchedUserImplCopyWith<_$PatchedUserImpl> get copyWith =>
      __$$PatchedUserImplCopyWithImpl<_$PatchedUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatchedUserImplToJson(
      this,
    );
  }
}

abstract class _PatchedUser implements PatchedUser {
  const factory _PatchedUser(
      {final String? email,
      @JsonKey(name: 'first_name') final String? firstName,
      @JsonKey(name: 'last_name') final String? lastName,
      final int? id}) = _$PatchedUserImpl;

  factory _PatchedUser.fromJson(Map<String, dynamic> json) =
      _$PatchedUserImpl.fromJson;

  @override
  String? get email;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  int? get id;

  /// Create a copy of PatchedUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchedUserImplCopyWith<_$PatchedUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
