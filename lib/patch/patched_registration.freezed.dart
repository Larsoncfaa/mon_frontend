// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatchedRegistration {

@JsonKey(name: 'first_name') String? get firstName;@JsonKey(name: 'last_name') String? get lastName; String? get email; String? get password;
/// Create a copy of PatchedRegistration
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatchedRegistrationCopyWith<PatchedRegistration> get copyWith => _$PatchedRegistrationCopyWithImpl<PatchedRegistration>(this as PatchedRegistration, _$identity);

  /// Serializes this PatchedRegistration to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatchedRegistration&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,email,password);

@override
String toString() {
  return 'PatchedRegistration(firstName: $firstName, lastName: $lastName, email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $PatchedRegistrationCopyWith<$Res>  {
  factory $PatchedRegistrationCopyWith(PatchedRegistration value, $Res Function(PatchedRegistration) _then) = _$PatchedRegistrationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName, String? email, String? password
});




}
/// @nodoc
class _$PatchedRegistrationCopyWithImpl<$Res>
    implements $PatchedRegistrationCopyWith<$Res> {
  _$PatchedRegistrationCopyWithImpl(this._self, this._then);

  final PatchedRegistration _self;
  final $Res Function(PatchedRegistration) _then;

/// Create a copy of PatchedRegistration
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = freezed,Object? lastName = freezed,Object? email = freezed,Object? password = freezed,}) {
  return _then(_self.copyWith(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PatchedRegistration].
extension PatchedRegistrationPatterns on PatchedRegistration {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatchedRegistration value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatchedRegistration() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatchedRegistration value)  $default,){
final _that = this;
switch (_that) {
case _PatchedRegistration():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatchedRegistration value)?  $default,){
final _that = this;
switch (_that) {
case _PatchedRegistration() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? email,  String? password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatchedRegistration() when $default != null:
return $default(_that.firstName,_that.lastName,_that.email,_that.password);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? email,  String? password)  $default,) {final _that = this;
switch (_that) {
case _PatchedRegistration():
return $default(_that.firstName,_that.lastName,_that.email,_that.password);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? email,  String? password)?  $default,) {final _that = this;
switch (_that) {
case _PatchedRegistration() when $default != null:
return $default(_that.firstName,_that.lastName,_that.email,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatchedRegistration implements PatchedRegistration {
  const _PatchedRegistration({@JsonKey(name: 'first_name') this.firstName, @JsonKey(name: 'last_name') this.lastName, this.email, this.password});
  factory _PatchedRegistration.fromJson(Map<String, dynamic> json) => _$PatchedRegistrationFromJson(json);

@override@JsonKey(name: 'first_name') final  String? firstName;
@override@JsonKey(name: 'last_name') final  String? lastName;
@override final  String? email;
@override final  String? password;

/// Create a copy of PatchedRegistration
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatchedRegistrationCopyWith<_PatchedRegistration> get copyWith => __$PatchedRegistrationCopyWithImpl<_PatchedRegistration>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatchedRegistrationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatchedRegistration&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,email,password);

@override
String toString() {
  return 'PatchedRegistration(firstName: $firstName, lastName: $lastName, email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$PatchedRegistrationCopyWith<$Res> implements $PatchedRegistrationCopyWith<$Res> {
  factory _$PatchedRegistrationCopyWith(_PatchedRegistration value, $Res Function(_PatchedRegistration) _then) = __$PatchedRegistrationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName, String? email, String? password
});




}
/// @nodoc
class __$PatchedRegistrationCopyWithImpl<$Res>
    implements _$PatchedRegistrationCopyWith<$Res> {
  __$PatchedRegistrationCopyWithImpl(this._self, this._then);

  final _PatchedRegistration _self;
  final $Res Function(_PatchedRegistration) _then;

/// Create a copy of PatchedRegistration
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = freezed,Object? lastName = freezed,Object? email = freezed,Object? password = freezed,}) {
  return _then(_PatchedRegistration(
firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
