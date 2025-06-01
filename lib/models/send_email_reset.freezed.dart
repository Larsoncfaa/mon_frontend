// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_email_reset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SendEmailReset _$SendEmailResetFromJson(Map<String, dynamic> json) {
  return _SendEmailReset.fromJson(json);
}

/// @nodoc
mixin _$SendEmailReset {
  /// Adresse e-mail de l'utilisateur pour réinitialiser son mot de passe
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;

  /// Serializes this SendEmailReset to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendEmailReset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendEmailResetCopyWith<SendEmailReset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendEmailResetCopyWith<$Res> {
  factory $SendEmailResetCopyWith(
          SendEmailReset value, $Res Function(SendEmailReset) then) =
      _$SendEmailResetCopyWithImpl<$Res, SendEmailReset>;
  @useResult
  $Res call({@JsonKey(name: 'email') String email});
}

/// @nodoc
class _$SendEmailResetCopyWithImpl<$Res, $Val extends SendEmailReset>
    implements $SendEmailResetCopyWith<$Res> {
  _$SendEmailResetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendEmailReset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendEmailResetImplCopyWith<$Res>
    implements $SendEmailResetCopyWith<$Res> {
  factory _$$SendEmailResetImplCopyWith(_$SendEmailResetImpl value,
          $Res Function(_$SendEmailResetImpl) then) =
      __$$SendEmailResetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'email') String email});
}

/// @nodoc
class __$$SendEmailResetImplCopyWithImpl<$Res>
    extends _$SendEmailResetCopyWithImpl<$Res, _$SendEmailResetImpl>
    implements _$$SendEmailResetImplCopyWith<$Res> {
  __$$SendEmailResetImplCopyWithImpl(
      _$SendEmailResetImpl _value, $Res Function(_$SendEmailResetImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendEmailReset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$SendEmailResetImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendEmailResetImpl implements _SendEmailReset {
  const _$SendEmailResetImpl({@JsonKey(name: 'email') required this.email});

  factory _$SendEmailResetImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendEmailResetImplFromJson(json);

  /// Adresse e-mail de l'utilisateur pour réinitialiser son mot de passe
  @override
  @JsonKey(name: 'email')
  final String email;

  @override
  String toString() {
    return 'SendEmailReset(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendEmailResetImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of SendEmailReset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendEmailResetImplCopyWith<_$SendEmailResetImpl> get copyWith =>
      __$$SendEmailResetImplCopyWithImpl<_$SendEmailResetImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendEmailResetImplToJson(
      this,
    );
  }
}

abstract class _SendEmailReset implements SendEmailReset {
  const factory _SendEmailReset(
          {@JsonKey(name: 'email') required final String email}) =
      _$SendEmailResetImpl;

  factory _SendEmailReset.fromJson(Map<String, dynamic> json) =
      _$SendEmailResetImpl.fromJson;

  /// Adresse e-mail de l'utilisateur pour réinitialiser son mot de passe
  @override
  @JsonKey(name: 'email')
  String get email;

  /// Create a copy of SendEmailReset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendEmailResetImplCopyWith<_$SendEmailResetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
