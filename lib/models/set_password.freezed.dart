// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_password.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SetPassword _$SetPasswordFromJson(Map<String, dynamic> json) {
  return _SetPassword.fromJson(json);
}

/// @nodoc
mixin _$SetPassword {
  /// Nouveau mot de passe à définir
  @JsonKey(name: 'new_password')
  String get newPassword => throw _privateConstructorUsedError;

  /// Mot de passe actuel
  @JsonKey(name: 'current_password')
  String get currentPassword => throw _privateConstructorUsedError;

  /// Serializes this SetPassword to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SetPassword
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SetPasswordCopyWith<SetPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetPasswordCopyWith<$Res> {
  factory $SetPasswordCopyWith(
          SetPassword value, $Res Function(SetPassword) then) =
      _$SetPasswordCopyWithImpl<$Res, SetPassword>;
  @useResult
  $Res call(
      {@JsonKey(name: 'new_password') String newPassword,
      @JsonKey(name: 'current_password') String currentPassword});
}

/// @nodoc
class _$SetPasswordCopyWithImpl<$Res, $Val extends SetPassword>
    implements $SetPasswordCopyWith<$Res> {
  _$SetPasswordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SetPassword
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPassword = null,
    Object? currentPassword = null,
  }) {
    return _then(_value.copyWith(
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      currentPassword: null == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SetPasswordImplCopyWith<$Res>
    implements $SetPasswordCopyWith<$Res> {
  factory _$$SetPasswordImplCopyWith(
          _$SetPasswordImpl value, $Res Function(_$SetPasswordImpl) then) =
      __$$SetPasswordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'new_password') String newPassword,
      @JsonKey(name: 'current_password') String currentPassword});
}

/// @nodoc
class __$$SetPasswordImplCopyWithImpl<$Res>
    extends _$SetPasswordCopyWithImpl<$Res, _$SetPasswordImpl>
    implements _$$SetPasswordImplCopyWith<$Res> {
  __$$SetPasswordImplCopyWithImpl(
      _$SetPasswordImpl _value, $Res Function(_$SetPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of SetPassword
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPassword = null,
    Object? currentPassword = null,
  }) {
    return _then(_$SetPasswordImpl(
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      currentPassword: null == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SetPasswordImpl implements _SetPassword {
  const _$SetPasswordImpl(
      {@JsonKey(name: 'new_password') required this.newPassword,
      @JsonKey(name: 'current_password') required this.currentPassword});

  factory _$SetPasswordImpl.fromJson(Map<String, dynamic> json) =>
      _$$SetPasswordImplFromJson(json);

  /// Nouveau mot de passe à définir
  @override
  @JsonKey(name: 'new_password')
  final String newPassword;

  /// Mot de passe actuel
  @override
  @JsonKey(name: 'current_password')
  final String currentPassword;

  @override
  String toString() {
    return 'SetPassword(newPassword: $newPassword, currentPassword: $currentPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetPasswordImpl &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, newPassword, currentPassword);

  /// Create a copy of SetPassword
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetPasswordImplCopyWith<_$SetPasswordImpl> get copyWith =>
      __$$SetPasswordImplCopyWithImpl<_$SetPasswordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SetPasswordImplToJson(
      this,
    );
  }
}

abstract class _SetPassword implements SetPassword {
  const factory _SetPassword(
      {@JsonKey(name: 'new_password') required final String newPassword,
      @JsonKey(name: 'current_password')
      required final String currentPassword}) = _$SetPasswordImpl;

  factory _SetPassword.fromJson(Map<String, dynamic> json) =
      _$SetPasswordImpl.fromJson;

  /// Nouveau mot de passe à définir
  @override
  @JsonKey(name: 'new_password')
  String get newPassword;

  /// Mot de passe actuel
  @override
  @JsonKey(name: 'current_password')
  String get currentPassword;

  /// Create a copy of SetPassword
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetPasswordImplCopyWith<_$SetPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
