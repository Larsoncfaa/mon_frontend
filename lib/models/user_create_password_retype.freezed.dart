// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_create_password_retype.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserCreatePasswordRetype {

 int get id; String get email;@JsonKey(name: 'first_name') String get firstName;@JsonKey(name: 'last_name') String get lastName; String get password;@JsonKey(name: 're_password') String get rePassword;
/// Create a copy of UserCreatePasswordRetype
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCreatePasswordRetypeCopyWith<UserCreatePasswordRetype> get copyWith => _$UserCreatePasswordRetypeCopyWithImpl<UserCreatePasswordRetype>(this as UserCreatePasswordRetype, _$identity);

  /// Serializes this UserCreatePasswordRetype to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCreatePasswordRetype&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.password, password) || other.password == password)&&(identical(other.rePassword, rePassword) || other.rePassword == rePassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,firstName,lastName,password,rePassword);

@override
String toString() {
  return 'UserCreatePasswordRetype(id: $id, email: $email, firstName: $firstName, lastName: $lastName, password: $password, rePassword: $rePassword)';
}


}

/// @nodoc
abstract mixin class $UserCreatePasswordRetypeCopyWith<$Res>  {
  factory $UserCreatePasswordRetypeCopyWith(UserCreatePasswordRetype value, $Res Function(UserCreatePasswordRetype) _then) = _$UserCreatePasswordRetypeCopyWithImpl;
@useResult
$Res call({
 int id, String email,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String password,@JsonKey(name: 're_password') String rePassword
});




}
/// @nodoc
class _$UserCreatePasswordRetypeCopyWithImpl<$Res>
    implements $UserCreatePasswordRetypeCopyWith<$Res> {
  _$UserCreatePasswordRetypeCopyWithImpl(this._self, this._then);

  final UserCreatePasswordRetype _self;
  final $Res Function(UserCreatePasswordRetype) _then;

/// Create a copy of UserCreatePasswordRetype
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? firstName = null,Object? lastName = null,Object? password = null,Object? rePassword = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,rePassword: null == rePassword ? _self.rePassword : rePassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserCreatePasswordRetype].
extension UserCreatePasswordRetypePatterns on UserCreatePasswordRetype {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserCreatePasswordRetype value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserCreatePasswordRetype() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserCreatePasswordRetype value)  $default,){
final _that = this;
switch (_that) {
case _UserCreatePasswordRetype():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserCreatePasswordRetype value)?  $default,){
final _that = this;
switch (_that) {
case _UserCreatePasswordRetype() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String email, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String password, @JsonKey(name: 're_password')  String rePassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserCreatePasswordRetype() when $default != null:
return $default(_that.id,_that.email,_that.firstName,_that.lastName,_that.password,_that.rePassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String email, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String password, @JsonKey(name: 're_password')  String rePassword)  $default,) {final _that = this;
switch (_that) {
case _UserCreatePasswordRetype():
return $default(_that.id,_that.email,_that.firstName,_that.lastName,_that.password,_that.rePassword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String email, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String password, @JsonKey(name: 're_password')  String rePassword)?  $default,) {final _that = this;
switch (_that) {
case _UserCreatePasswordRetype() when $default != null:
return $default(_that.id,_that.email,_that.firstName,_that.lastName,_that.password,_that.rePassword);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserCreatePasswordRetype implements UserCreatePasswordRetype {
  const _UserCreatePasswordRetype({required this.id, required this.email, @JsonKey(name: 'first_name') required this.firstName, @JsonKey(name: 'last_name') required this.lastName, required this.password, @JsonKey(name: 're_password') required this.rePassword});
  factory _UserCreatePasswordRetype.fromJson(Map<String, dynamic> json) => _$UserCreatePasswordRetypeFromJson(json);

@override final  int id;
@override final  String email;
@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String lastName;
@override final  String password;
@override@JsonKey(name: 're_password') final  String rePassword;

/// Create a copy of UserCreatePasswordRetype
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCreatePasswordRetypeCopyWith<_UserCreatePasswordRetype> get copyWith => __$UserCreatePasswordRetypeCopyWithImpl<_UserCreatePasswordRetype>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserCreatePasswordRetypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserCreatePasswordRetype&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.password, password) || other.password == password)&&(identical(other.rePassword, rePassword) || other.rePassword == rePassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,firstName,lastName,password,rePassword);

@override
String toString() {
  return 'UserCreatePasswordRetype(id: $id, email: $email, firstName: $firstName, lastName: $lastName, password: $password, rePassword: $rePassword)';
}


}

/// @nodoc
abstract mixin class _$UserCreatePasswordRetypeCopyWith<$Res> implements $UserCreatePasswordRetypeCopyWith<$Res> {
  factory _$UserCreatePasswordRetypeCopyWith(_UserCreatePasswordRetype value, $Res Function(_UserCreatePasswordRetype) _then) = __$UserCreatePasswordRetypeCopyWithImpl;
@override @useResult
$Res call({
 int id, String email,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String password,@JsonKey(name: 're_password') String rePassword
});




}
/// @nodoc
class __$UserCreatePasswordRetypeCopyWithImpl<$Res>
    implements _$UserCreatePasswordRetypeCopyWith<$Res> {
  __$UserCreatePasswordRetypeCopyWithImpl(this._self, this._then);

  final _UserCreatePasswordRetype _self;
  final $Res Function(_UserCreatePasswordRetype) _then;

/// Create a copy of UserCreatePasswordRetype
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? firstName = null,Object? lastName = null,Object? password = null,Object? rePassword = null,}) {
  return _then(_UserCreatePasswordRetype(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,rePassword: null == rePassword ? _self.rePassword : rePassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
