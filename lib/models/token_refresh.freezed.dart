// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_refresh.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenRefresh _$TokenRefreshFromJson(Map<String, dynamic> json) {
  return _TokenRefresh.fromJson(json);
}

/// @nodoc
mixin _$TokenRefresh {
  /// Nouveau token d’accès (JWT) généré par le backend
  String get access => throw _privateConstructorUsedError;

  /// Token de rafraîchissement (souvent inchangé, mais parfois renouvelé)
  String get refresh => throw _privateConstructorUsedError;

  /// Serializes this TokenRefresh to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenRefresh
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenRefreshCopyWith<TokenRefresh> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenRefreshCopyWith<$Res> {
  factory $TokenRefreshCopyWith(
          TokenRefresh value, $Res Function(TokenRefresh) then) =
      _$TokenRefreshCopyWithImpl<$Res, TokenRefresh>;
  @useResult
  $Res call({String access, String refresh});
}

/// @nodoc
class _$TokenRefreshCopyWithImpl<$Res, $Val extends TokenRefresh>
    implements $TokenRefreshCopyWith<$Res> {
  _$TokenRefreshCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenRefresh
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access = null,
    Object? refresh = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$TokenRefreshImplCopyWith<$Res>
    implements $TokenRefreshCopyWith<$Res> {
  factory _$$TokenRefreshImplCopyWith(
          _$TokenRefreshImpl value, $Res Function(_$TokenRefreshImpl) then) =
      __$$TokenRefreshImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String access, String refresh});
}

/// @nodoc
class __$$TokenRefreshImplCopyWithImpl<$Res>
    extends _$TokenRefreshCopyWithImpl<$Res, _$TokenRefreshImpl>
    implements _$$TokenRefreshImplCopyWith<$Res> {
  __$$TokenRefreshImplCopyWithImpl(
      _$TokenRefreshImpl _value, $Res Function(_$TokenRefreshImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenRefresh
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access = null,
    Object? refresh = null,
  }) {
    return _then(_$TokenRefreshImpl(
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
class _$TokenRefreshImpl implements _TokenRefresh {
  const _$TokenRefreshImpl({required this.access, required this.refresh});

  factory _$TokenRefreshImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenRefreshImplFromJson(json);

  /// Nouveau token d’accès (JWT) généré par le backend
  @override
  final String access;

  /// Token de rafraîchissement (souvent inchangé, mais parfois renouvelé)
  @override
  final String refresh;

  @override
  String toString() {
    return 'TokenRefresh(access: $access, refresh: $refresh)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenRefreshImpl &&
            (identical(other.access, access) || other.access == access) &&
            (identical(other.refresh, refresh) || other.refresh == refresh));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, access, refresh);

  /// Create a copy of TokenRefresh
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenRefreshImplCopyWith<_$TokenRefreshImpl> get copyWith =>
      __$$TokenRefreshImplCopyWithImpl<_$TokenRefreshImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenRefreshImplToJson(
      this,
    );
  }
}

abstract class _TokenRefresh implements TokenRefresh {
  const factory _TokenRefresh(
      {required final String access,
      required final String refresh}) = _$TokenRefreshImpl;

  factory _TokenRefresh.fromJson(Map<String, dynamic> json) =
      _$TokenRefreshImpl.fromJson;

  /// Nouveau token d’accès (JWT) généré par le backend
  @override
  String get access;

  /// Token de rafraîchissement (souvent inchangé, mais parfois renouvelé)
  @override
  String get refresh;

  /// Create a copy of TokenRefresh
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenRefreshImplCopyWith<_$TokenRefreshImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
