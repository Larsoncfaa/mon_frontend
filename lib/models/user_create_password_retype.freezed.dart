// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_create_password_retype.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserCreatePasswordRetype _$UserCreatePasswordRetypeFromJson(
    Map<String, dynamic> json) {
  return _UserCreatePasswordRetype.fromJson(json);
}

/// @nodoc
mixin _$UserCreatePasswordRetype {
  /// Adresse e-mail de l'utilisateur
  String get email => throw _privateConstructorUsedError;

  /// Prénom de l'utilisateur (optionnel)
  String? get firstName => throw _privateConstructorUsedError;

  /// Nom de famille de l'utilisateur (optionnel)
  String? get lastName => throw _privateConstructorUsedError;

  /// ID de l'utilisateur
  int get id => throw _privateConstructorUsedError;

  /// Mot de passe de l'utilisateur
  String get password => throw _privateConstructorUsedError;

  /// Confirmation du mot de passe
  String get rePassword => throw _privateConstructorUsedError;

  /// Serializes this UserCreatePasswordRetype to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserCreatePasswordRetype
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCreatePasswordRetypeCopyWith<UserCreatePasswordRetype> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCreatePasswordRetypeCopyWith<$Res> {
  factory $UserCreatePasswordRetypeCopyWith(UserCreatePasswordRetype value,
          $Res Function(UserCreatePasswordRetype) then) =
      _$UserCreatePasswordRetypeCopyWithImpl<$Res, UserCreatePasswordRetype>;
  @useResult
  $Res call(
      {String email,
      String? firstName,
      String? lastName,
      int id,
      String password,
      String rePassword});
}

/// @nodoc
class _$UserCreatePasswordRetypeCopyWithImpl<$Res,
        $Val extends UserCreatePasswordRetype>
    implements $UserCreatePasswordRetypeCopyWith<$Res> {
  _$UserCreatePasswordRetypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserCreatePasswordRetype
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? id = null,
    Object? password = null,
    Object? rePassword = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      rePassword: null == rePassword
          ? _value.rePassword
          : rePassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserCreatePasswordRetypeImplCopyWith<$Res>
    implements $UserCreatePasswordRetypeCopyWith<$Res> {
  factory _$$UserCreatePasswordRetypeImplCopyWith(
          _$UserCreatePasswordRetypeImpl value,
          $Res Function(_$UserCreatePasswordRetypeImpl) then) =
      __$$UserCreatePasswordRetypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String? firstName,
      String? lastName,
      int id,
      String password,
      String rePassword});
}

/// @nodoc
class __$$UserCreatePasswordRetypeImplCopyWithImpl<$Res>
    extends _$UserCreatePasswordRetypeCopyWithImpl<$Res,
        _$UserCreatePasswordRetypeImpl>
    implements _$$UserCreatePasswordRetypeImplCopyWith<$Res> {
  __$$UserCreatePasswordRetypeImplCopyWithImpl(
      _$UserCreatePasswordRetypeImpl _value,
      $Res Function(_$UserCreatePasswordRetypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserCreatePasswordRetype
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? id = null,
    Object? password = null,
    Object? rePassword = null,
  }) {
    return _then(_$UserCreatePasswordRetypeImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      rePassword: null == rePassword
          ? _value.rePassword
          : rePassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserCreatePasswordRetypeImpl implements _UserCreatePasswordRetype {
  const _$UserCreatePasswordRetypeImpl(
      {required this.email,
      this.firstName,
      this.lastName,
      required this.id,
      required this.password,
      required this.rePassword});

  factory _$UserCreatePasswordRetypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserCreatePasswordRetypeImplFromJson(json);

  /// Adresse e-mail de l'utilisateur
  @override
  final String email;

  /// Prénom de l'utilisateur (optionnel)
  @override
  final String? firstName;

  /// Nom de famille de l'utilisateur (optionnel)
  @override
  final String? lastName;

  /// ID de l'utilisateur
  @override
  final int id;

  /// Mot de passe de l'utilisateur
  @override
  final String password;

  /// Confirmation du mot de passe
  @override
  final String rePassword;

  @override
  String toString() {
    return 'UserCreatePasswordRetype(email: $email, firstName: $firstName, lastName: $lastName, id: $id, password: $password, rePassword: $rePassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserCreatePasswordRetypeImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.rePassword, rePassword) ||
                other.rePassword == rePassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, email, firstName, lastName, id, password, rePassword);

  /// Create a copy of UserCreatePasswordRetype
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCreatePasswordRetypeImplCopyWith<_$UserCreatePasswordRetypeImpl>
      get copyWith => __$$UserCreatePasswordRetypeImplCopyWithImpl<
          _$UserCreatePasswordRetypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserCreatePasswordRetypeImplToJson(
      this,
    );
  }
}

abstract class _UserCreatePasswordRetype implements UserCreatePasswordRetype {
  const factory _UserCreatePasswordRetype(
      {required final String email,
      final String? firstName,
      final String? lastName,
      required final int id,
      required final String password,
      required final String rePassword}) = _$UserCreatePasswordRetypeImpl;

  factory _UserCreatePasswordRetype.fromJson(Map<String, dynamic> json) =
      _$UserCreatePasswordRetypeImpl.fromJson;

  /// Adresse e-mail de l'utilisateur
  @override
  String get email;

  /// Prénom de l'utilisateur (optionnel)
  @override
  String? get firstName;

  /// Nom de famille de l'utilisateur (optionnel)
  @override
  String? get lastName;

  /// ID de l'utilisateur
  @override
  int get id;

  /// Mot de passe de l'utilisateur
  @override
  String get password;

  /// Confirmation du mot de passe
  @override
  String get rePassword;

  /// Create a copy of UserCreatePasswordRetype
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserCreatePasswordRetypeImplCopyWith<_$UserCreatePasswordRetypeImpl>
      get copyWith => throw _privateConstructorUsedError;
}
