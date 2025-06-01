// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_obtain_pair.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenObtainPair _$TokenObtainPairFromJson(Map<String, dynamic> json) {
  return _TokenObtainPair.fromJson(json);
}

/// @nodoc
mixin _$TokenObtainPair {
  /// Nom d’utilisateur ou adresse e-mail utilisée pour l’authentification
  String get username => throw _privateConstructorUsedError;

  /// Mot de passe associé à l’utilisateur
  String get password => throw _privateConstructorUsedError;

  /// Token JWT d'accès (valide pour les appels API courts)
  String get access => throw _privateConstructorUsedError;

  /// Token JWT de rafraîchissement (valide plus longtemps, permet de renouveler l'access)
  String get refresh => throw _privateConstructorUsedError;

  /// Serializes this TokenObtainPair to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenObtainPair
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenObtainPairCopyWith<TokenObtainPair> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenObtainPairCopyWith<$Res> {
  factory $TokenObtainPairCopyWith(
          TokenObtainPair value, $Res Function(TokenObtainPair) then) =
      _$TokenObtainPairCopyWithImpl<$Res, TokenObtainPair>;
  @useResult
  $Res call({String username, String password, String access, String refresh});
}

/// @nodoc
class _$TokenObtainPairCopyWithImpl<$Res, $Val extends TokenObtainPair>
    implements $TokenObtainPairCopyWith<$Res> {
  _$TokenObtainPairCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenObtainPair
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? access = null,
    Object? refresh = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      access: null == access
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as String,
      refresh: null == refresh
          ? _value.refresh
          : refresh // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenObtainPairImplCopyWith<$Res>
    implements $TokenObtainPairCopyWith<$Res> {
  factory _$$TokenObtainPairImplCopyWith(_$TokenObtainPairImpl value,
          $Res Function(_$TokenObtainPairImpl) then) =
      __$$TokenObtainPairImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String password, String access, String refresh});
}

/// @nodoc
class __$$TokenObtainPairImplCopyWithImpl<$Res>
    extends _$TokenObtainPairCopyWithImpl<$Res, _$TokenObtainPairImpl>
    implements _$$TokenObtainPairImplCopyWith<$Res> {
  __$$TokenObtainPairImplCopyWithImpl(
      _$TokenObtainPairImpl _value, $Res Function(_$TokenObtainPairImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenObtainPair
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? access = null,
    Object? refresh = null,
  }) {
    return _then(_$TokenObtainPairImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      access: null == access
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as String,
      refresh: null == refresh
          ? _value.refresh
          : refresh // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenObtainPairImpl implements _TokenObtainPair {
  const _$TokenObtainPairImpl(
      {required this.username,
      required this.password,
      required this.access,
      required this.refresh});

  factory _$TokenObtainPairImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenObtainPairImplFromJson(json);

  /// Nom d’utilisateur ou adresse e-mail utilisée pour l’authentification
  @override
  final String username;

  /// Mot de passe associé à l’utilisateur
  @override
  final String password;

  /// Token JWT d'accès (valide pour les appels API courts)
  @override
  final String access;

  /// Token JWT de rafraîchissement (valide plus longtemps, permet de renouveler l'access)
  @override
  final String refresh;

  @override
  String toString() {
    return 'TokenObtainPair(username: $username, password: $password, access: $access, refresh: $refresh)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenObtainPairImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.access, access) || other.access == access) &&
            (identical(other.refresh, refresh) || other.refresh == refresh));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, username, password, access, refresh);

  /// Create a copy of TokenObtainPair
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenObtainPairImplCopyWith<_$TokenObtainPairImpl> get copyWith =>
      __$$TokenObtainPairImplCopyWithImpl<_$TokenObtainPairImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenObtainPairImplToJson(
      this,
    );
  }
}

abstract class _TokenObtainPair implements TokenObtainPair {
  const factory _TokenObtainPair(
      {required final String username,
      required final String password,
      required final String access,
      required final String refresh}) = _$TokenObtainPairImpl;

  factory _TokenObtainPair.fromJson(Map<String, dynamic> json) =
      _$TokenObtainPairImpl.fromJson;

  /// Nom d’utilisateur ou adresse e-mail utilisée pour l’authentification
  @override
  String get username;

  /// Mot de passe associé à l’utilisateur
  @override
  String get password;

  /// Token JWT d'accès (valide pour les appels API courts)
  @override
  String get access;

  /// Token JWT de rafraîchissement (valide plus longtemps, permet de renouveler l'access)
  @override
  String get refresh;

  /// Create a copy of TokenObtainPair
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenObtainPairImplCopyWith<_$TokenObtainPairImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
