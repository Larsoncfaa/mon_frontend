// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'username_reset_confirm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UsernameResetConfirm _$UsernameResetConfirmFromJson(Map<String, dynamic> json) {
  return _UsernameResetConfirm.fromJson(json);
}

/// @nodoc
mixin _$UsernameResetConfirm {
  /// La nouvelle adresse e-mail à enregistrer pour l'utilisateur
  @JsonKey(name: 'new_email')
  String get newEmail => throw _privateConstructorUsedError;

  /// Serializes this UsernameResetConfirm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UsernameResetConfirm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsernameResetConfirmCopyWith<UsernameResetConfirm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsernameResetConfirmCopyWith<$Res> {
  factory $UsernameResetConfirmCopyWith(UsernameResetConfirm value,
          $Res Function(UsernameResetConfirm) then) =
      _$UsernameResetConfirmCopyWithImpl<$Res, UsernameResetConfirm>;
  @useResult
  $Res call({@JsonKey(name: 'new_email') String newEmail});
}

/// @nodoc
class _$UsernameResetConfirmCopyWithImpl<$Res,
        $Val extends UsernameResetConfirm>
    implements $UsernameResetConfirmCopyWith<$Res> {
  _$UsernameResetConfirmCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UsernameResetConfirm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newEmail = null,
  }) {
    return _then(_value.copyWith(
      newEmail: null == newEmail
          ? _value.newEmail
          : newEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsernameResetConfirmImplCopyWith<$Res>
    implements $UsernameResetConfirmCopyWith<$Res> {
  factory _$$UsernameResetConfirmImplCopyWith(_$UsernameResetConfirmImpl value,
          $Res Function(_$UsernameResetConfirmImpl) then) =
      __$$UsernameResetConfirmImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'new_email') String newEmail});
}

/// @nodoc
class __$$UsernameResetConfirmImplCopyWithImpl<$Res>
    extends _$UsernameResetConfirmCopyWithImpl<$Res, _$UsernameResetConfirmImpl>
    implements _$$UsernameResetConfirmImplCopyWith<$Res> {
  __$$UsernameResetConfirmImplCopyWithImpl(_$UsernameResetConfirmImpl _value,
      $Res Function(_$UsernameResetConfirmImpl) _then)
      : super(_value, _then);

  /// Create a copy of UsernameResetConfirm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newEmail = null,
  }) {
    return _then(_$UsernameResetConfirmImpl(
      newEmail: null == newEmail
          ? _value.newEmail
          : newEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsernameResetConfirmImpl implements _UsernameResetConfirm {
  const _$UsernameResetConfirmImpl(
      {@JsonKey(name: 'new_email') required this.newEmail});

  factory _$UsernameResetConfirmImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsernameResetConfirmImplFromJson(json);

  /// La nouvelle adresse e-mail à enregistrer pour l'utilisateur
  @override
  @JsonKey(name: 'new_email')
  final String newEmail;

  @override
  String toString() {
    return 'UsernameResetConfirm(newEmail: $newEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsernameResetConfirmImpl &&
            (identical(other.newEmail, newEmail) ||
                other.newEmail == newEmail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, newEmail);

  /// Create a copy of UsernameResetConfirm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsernameResetConfirmImplCopyWith<_$UsernameResetConfirmImpl>
      get copyWith =>
          __$$UsernameResetConfirmImplCopyWithImpl<_$UsernameResetConfirmImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsernameResetConfirmImplToJson(
      this,
    );
  }
}

abstract class _UsernameResetConfirm implements UsernameResetConfirm {
  const factory _UsernameResetConfirm(
          {@JsonKey(name: 'new_email') required final String newEmail}) =
      _$UsernameResetConfirmImpl;

  factory _UsernameResetConfirm.fromJson(Map<String, dynamic> json) =
      _$UsernameResetConfirmImpl.fromJson;

  /// La nouvelle adresse e-mail à enregistrer pour l'utilisateur
  @override
  @JsonKey(name: 'new_email')
  String get newEmail;

  /// Create a copy of UsernameResetConfirm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsernameResetConfirmImplCopyWith<_$UsernameResetConfirmImpl>
      get copyWith => throw _privateConstructorUsedError;
}
