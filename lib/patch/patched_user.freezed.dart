// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatchedUser {

 int? get id; String? get email;@JsonKey(name: 'first_name') String? get firstName;@JsonKey(name: 'last_name') String? get lastName; String? get role;
/// Create a copy of PatchedUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatchedUserCopyWith<PatchedUser> get copyWith => _$PatchedUserCopyWithImpl<PatchedUser>(this as PatchedUser, _$identity);

  /// Serializes this PatchedUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatchedUser&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,firstName,lastName,role);

@override
String toString() {
  return 'PatchedUser(id: $id, email: $email, firstName: $firstName, lastName: $lastName, role: $role)';
}


}

/// @nodoc
abstract mixin class $PatchedUserCopyWith<$Res>  {
  factory $PatchedUserCopyWith(PatchedUser value, $Res Function(PatchedUser) _then) = _$PatchedUserCopyWithImpl;
@useResult
$Res call({
 int? id, String? email,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName, String? role
});




}
/// @nodoc
class _$PatchedUserCopyWithImpl<$Res>
    implements $PatchedUserCopyWith<$Res> {
  _$PatchedUserCopyWithImpl(this._self, this._then);

  final PatchedUser _self;
  final $Res Function(PatchedUser) _then;

/// Create a copy of PatchedUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? email = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? role = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PatchedUser].
extension PatchedUserPatterns on PatchedUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatchedUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatchedUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatchedUser value)  $default,){
final _that = this;
switch (_that) {
case _PatchedUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatchedUser value)?  $default,){
final _that = this;
switch (_that) {
case _PatchedUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? email, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? role)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatchedUser() when $default != null:
return $default(_that.id,_that.email,_that.firstName,_that.lastName,_that.role);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? email, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? role)  $default,) {final _that = this;
switch (_that) {
case _PatchedUser():
return $default(_that.id,_that.email,_that.firstName,_that.lastName,_that.role);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? email, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? role)?  $default,) {final _that = this;
switch (_that) {
case _PatchedUser() when $default != null:
return $default(_that.id,_that.email,_that.firstName,_that.lastName,_that.role);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatchedUser implements PatchedUser {
  const _PatchedUser({this.id, this.email, @JsonKey(name: 'first_name') this.firstName, @JsonKey(name: 'last_name') this.lastName, this.role});
  factory _PatchedUser.fromJson(Map<String, dynamic> json) => _$PatchedUserFromJson(json);

@override final  int? id;
@override final  String? email;
@override@JsonKey(name: 'first_name') final  String? firstName;
@override@JsonKey(name: 'last_name') final  String? lastName;
@override final  String? role;

/// Create a copy of PatchedUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatchedUserCopyWith<_PatchedUser> get copyWith => __$PatchedUserCopyWithImpl<_PatchedUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatchedUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatchedUser&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.role, role) || other.role == role));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,firstName,lastName,role);

@override
String toString() {
  return 'PatchedUser(id: $id, email: $email, firstName: $firstName, lastName: $lastName, role: $role)';
}


}

/// @nodoc
abstract mixin class _$PatchedUserCopyWith<$Res> implements $PatchedUserCopyWith<$Res> {
  factory _$PatchedUserCopyWith(_PatchedUser value, $Res Function(_PatchedUser) _then) = __$PatchedUserCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? email,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName, String? role
});




}
/// @nodoc
class __$PatchedUserCopyWithImpl<$Res>
    implements _$PatchedUserCopyWith<$Res> {
  __$PatchedUserCopyWithImpl(this._self, this._then);

  final _PatchedUser _self;
  final $Res Function(_PatchedUser) _then;

/// Create a copy of PatchedUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? email = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? role = freezed,}) {
  return _then(_PatchedUser(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
