// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatchedRegistration _$PatchedRegistrationFromJson(Map<String, dynamic> json) {
  return _PatchedRegistration.fromJson(json);
}

/// @nodoc
mixin _$PatchedRegistration {
  /// Prénom (optionnel)
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;

  /// Nom (optionnel)
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;

  /// Email (optionnel)
  String? get email => throw _privateConstructorUsedError;

  /// Mot de passe (optionnel)
  String? get password => throw _privateConstructorUsedError;

  /// Serializes this PatchedRegistration to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatchedRegistration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatchedRegistrationCopyWith<PatchedRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatchedRegistrationCopyWith<$Res> {
  factory $PatchedRegistrationCopyWith(
          PatchedRegistration value, $Res Function(PatchedRegistration) then) =
      _$PatchedRegistrationCopyWithImpl<$Res, PatchedRegistration>;
  @useResult
  $Res call(
      {@JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      String? email,
      String? password});
}

/// @nodoc
class _$PatchedRegistrationCopyWithImpl<$Res, $Val extends PatchedRegistration>
    implements $PatchedRegistrationCopyWith<$Res> {
  _$PatchedRegistrationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatchedRegistration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatchedRegistrationImplCopyWith<$Res>
    implements $PatchedRegistrationCopyWith<$Res> {
  factory _$$PatchedRegistrationImplCopyWith(_$PatchedRegistrationImpl value,
          $Res Function(_$PatchedRegistrationImpl) then) =
      __$$PatchedRegistrationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      String? email,
      String? password});
}

/// @nodoc
class __$$PatchedRegistrationImplCopyWithImpl<$Res>
    extends _$PatchedRegistrationCopyWithImpl<$Res, _$PatchedRegistrationImpl>
    implements _$$PatchedRegistrationImplCopyWith<$Res> {
  __$$PatchedRegistrationImplCopyWithImpl(_$PatchedRegistrationImpl _value,
      $Res Function(_$PatchedRegistrationImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatchedRegistration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$PatchedRegistrationImpl(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatchedRegistrationImpl implements _PatchedRegistration {
  const _$PatchedRegistrationImpl(
      {@JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      this.email,
      this.password});

  factory _$PatchedRegistrationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatchedRegistrationImplFromJson(json);

  /// Prénom (optionnel)
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;

  /// Nom (optionnel)
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;

  /// Email (optionnel)
  @override
  final String? email;

  /// Mot de passe (optionnel)
  @override
  final String? password;

  @override
  String toString() {
    return 'PatchedRegistration(firstName: $firstName, lastName: $lastName, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatchedRegistrationImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, firstName, lastName, email, password);

  /// Create a copy of PatchedRegistration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchedRegistrationImplCopyWith<_$PatchedRegistrationImpl> get copyWith =>
      __$$PatchedRegistrationImplCopyWithImpl<_$PatchedRegistrationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatchedRegistrationImplToJson(
      this,
    );
  }
}

abstract class _PatchedRegistration implements PatchedRegistration {
  const factory _PatchedRegistration(
      {@JsonKey(name: 'first_name') final String? firstName,
      @JsonKey(name: 'last_name') final String? lastName,
      final String? email,
      final String? password}) = _$PatchedRegistrationImpl;

  factory _PatchedRegistration.fromJson(Map<String, dynamic> json) =
      _$PatchedRegistrationImpl.fromJson;

  /// Prénom (optionnel)
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;

  /// Nom (optionnel)
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;

  /// Email (optionnel)
  @override
  String? get email;

  /// Mot de passe (optionnel)
  @override
  String? get password;

  /// Create a copy of PatchedRegistration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchedRegistrationImplCopyWith<_$PatchedRegistrationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
