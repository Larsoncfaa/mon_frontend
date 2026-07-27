// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_password.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SetPassword {

@JsonKey(name: 'new_password') String get newPassword;@JsonKey(name: 'current_password') String get currentPassword;
/// Create a copy of SetPassword
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetPasswordCopyWith<SetPassword> get copyWith => _$SetPasswordCopyWithImpl<SetPassword>(this as SetPassword, _$identity);

  /// Serializes this SetPassword to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetPassword&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword)&&(identical(other.currentPassword, currentPassword) || other.currentPassword == currentPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,newPassword,currentPassword);

@override
String toString() {
  return 'SetPassword(newPassword: $newPassword, currentPassword: $currentPassword)';
}


}

/// @nodoc
abstract mixin class $SetPasswordCopyWith<$Res>  {
  factory $SetPasswordCopyWith(SetPassword value, $Res Function(SetPassword) _then) = _$SetPasswordCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'new_password') String newPassword,@JsonKey(name: 'current_password') String currentPassword
});




}
/// @nodoc
class _$SetPasswordCopyWithImpl<$Res>
    implements $SetPasswordCopyWith<$Res> {
  _$SetPasswordCopyWithImpl(this._self, this._then);

  final SetPassword _self;
  final $Res Function(SetPassword) _then;

/// Create a copy of SetPassword
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? newPassword = null,Object? currentPassword = null,}) {
  return _then(_self.copyWith(
newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,currentPassword: null == currentPassword ? _self.currentPassword : currentPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SetPassword].
extension SetPasswordPatterns on SetPassword {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SetPassword value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SetPassword() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SetPassword value)  $default,){
final _that = this;
switch (_that) {
case _SetPassword():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SetPassword value)?  $default,){
final _that = this;
switch (_that) {
case _SetPassword() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'new_password')  String newPassword, @JsonKey(name: 'current_password')  String currentPassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SetPassword() when $default != null:
return $default(_that.newPassword,_that.currentPassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'new_password')  String newPassword, @JsonKey(name: 'current_password')  String currentPassword)  $default,) {final _that = this;
switch (_that) {
case _SetPassword():
return $default(_that.newPassword,_that.currentPassword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'new_password')  String newPassword, @JsonKey(name: 'current_password')  String currentPassword)?  $default,) {final _that = this;
switch (_that) {
case _SetPassword() when $default != null:
return $default(_that.newPassword,_that.currentPassword);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SetPassword implements SetPassword {
  const _SetPassword({@JsonKey(name: 'new_password') required this.newPassword, @JsonKey(name: 'current_password') required this.currentPassword});
  factory _SetPassword.fromJson(Map<String, dynamic> json) => _$SetPasswordFromJson(json);

@override@JsonKey(name: 'new_password') final  String newPassword;
@override@JsonKey(name: 'current_password') final  String currentPassword;

/// Create a copy of SetPassword
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetPasswordCopyWith<_SetPassword> get copyWith => __$SetPasswordCopyWithImpl<_SetPassword>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetPasswordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetPassword&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword)&&(identical(other.currentPassword, currentPassword) || other.currentPassword == currentPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,newPassword,currentPassword);

@override
String toString() {
  return 'SetPassword(newPassword: $newPassword, currentPassword: $currentPassword)';
}


}

/// @nodoc
abstract mixin class _$SetPasswordCopyWith<$Res> implements $SetPasswordCopyWith<$Res> {
  factory _$SetPasswordCopyWith(_SetPassword value, $Res Function(_SetPassword) _then) = __$SetPasswordCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'new_password') String newPassword,@JsonKey(name: 'current_password') String currentPassword
});




}
/// @nodoc
class __$SetPasswordCopyWithImpl<$Res>
    implements _$SetPasswordCopyWith<$Res> {
  __$SetPasswordCopyWithImpl(this._self, this._then);

  final _SetPassword _self;
  final $Res Function(_SetPassword) _then;

/// Create a copy of SetPassword
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? newPassword = null,Object? currentPassword = null,}) {
  return _then(_SetPassword(
newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,currentPassword: null == currentPassword ? _self.currentPassword : currentPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
