// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_verify.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenVerify _$TokenVerifyFromJson(Map<String, dynamic> json) {
  return _TokenVerify.fromJson(json);
}

/// @nodoc
mixin _$TokenVerify {
  /// Le token JWT que tu veux vérifier (valide ou expiré ?).
  String get token => throw _privateConstructorUsedError;

  /// Serializes this TokenVerify to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenVerify
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenVerifyCopyWith<TokenVerify> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenVerifyCopyWith<$Res> {
  factory $TokenVerifyCopyWith(
          TokenVerify value, $Res Function(TokenVerify) then) =
      _$TokenVerifyCopyWithImpl<$Res, TokenVerify>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class _$TokenVerifyCopyWithImpl<$Res, $Val extends TokenVerify>
    implements $TokenVerifyCopyWith<$Res> {
  _$TokenVerifyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenVerify
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenVerifyImplCopyWith<$Res>
    implements $TokenVerifyCopyWith<$Res> {
  factory _$$TokenVerifyImplCopyWith(
          _$TokenVerifyImpl value, $Res Function(_$TokenVerifyImpl) then) =
      __$$TokenVerifyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$TokenVerifyImplCopyWithImpl<$Res>
    extends _$TokenVerifyCopyWithImpl<$Res, _$TokenVerifyImpl>
    implements _$$TokenVerifyImplCopyWith<$Res> {
  __$$TokenVerifyImplCopyWithImpl(
      _$TokenVerifyImpl _value, $Res Function(_$TokenVerifyImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenVerify
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$TokenVerifyImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenVerifyImpl implements _TokenVerify {
  const _$TokenVerifyImpl({required this.token});

  factory _$TokenVerifyImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenVerifyImplFromJson(json);

  /// Le token JWT que tu veux vérifier (valide ou expiré ?).
  @override
  final String token;

  @override
  String toString() {
    return 'TokenVerify(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenVerifyImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token);

  /// Create a copy of TokenVerify
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenVerifyImplCopyWith<_$TokenVerifyImpl> get copyWith =>
      __$$TokenVerifyImplCopyWithImpl<_$TokenVerifyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenVerifyImplToJson(
      this,
    );
  }
}

abstract class _TokenVerify implements TokenVerify {
  const factory _TokenVerify({required final String token}) = _$TokenVerifyImpl;

  factory _TokenVerify.fromJson(Map<String, dynamic> json) =
      _$TokenVerifyImpl.fromJson;

  /// Le token JWT que tu veux vérifier (valide ou expiré ?).
  @override
  String get token;

  /// Create a copy of TokenVerify
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenVerifyImplCopyWith<_$TokenVerifyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
