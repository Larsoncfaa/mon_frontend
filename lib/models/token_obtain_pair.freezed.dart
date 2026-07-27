// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_obtain_pair.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TokenObtainPair {

 String get email; String get password; String? get access; String? get refresh;
/// Create a copy of TokenObtainPair
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenObtainPairCopyWith<TokenObtainPair> get copyWith => _$TokenObtainPairCopyWithImpl<TokenObtainPair>(this as TokenObtainPair, _$identity);

  /// Serializes this TokenObtainPair to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenObtainPair&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.access, access) || other.access == access)&&(identical(other.refresh, refresh) || other.refresh == refresh));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password,access,refresh);

@override
String toString() {
  return 'TokenObtainPair(email: $email, password: $password, access: $access, refresh: $refresh)';
}


}

/// @nodoc
abstract mixin class $TokenObtainPairCopyWith<$Res>  {
  factory $TokenObtainPairCopyWith(TokenObtainPair value, $Res Function(TokenObtainPair) _then) = _$TokenObtainPairCopyWithImpl;
@useResult
$Res call({
 String email, String password, String? access, String? refresh
});




}
/// @nodoc
class _$TokenObtainPairCopyWithImpl<$Res>
    implements $TokenObtainPairCopyWith<$Res> {
  _$TokenObtainPairCopyWithImpl(this._self, this._then);

  final TokenObtainPair _self;
  final $Res Function(TokenObtainPair) _then;

/// Create a copy of TokenObtainPair
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,Object? access = freezed,Object? refresh = freezed,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,access: freezed == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as String?,refresh: freezed == refresh ? _self.refresh : refresh // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TokenObtainPair].
extension TokenObtainPairPatterns on TokenObtainPair {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TokenObtainPair value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TokenObtainPair() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TokenObtainPair value)  $default,){
final _that = this;
switch (_that) {
case _TokenObtainPair():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TokenObtainPair value)?  $default,){
final _that = this;
switch (_that) {
case _TokenObtainPair() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String password,  String? access,  String? refresh)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TokenObtainPair() when $default != null:
return $default(_that.email,_that.password,_that.access,_that.refresh);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String password,  String? access,  String? refresh)  $default,) {final _that = this;
switch (_that) {
case _TokenObtainPair():
return $default(_that.email,_that.password,_that.access,_that.refresh);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String password,  String? access,  String? refresh)?  $default,) {final _that = this;
switch (_that) {
case _TokenObtainPair() when $default != null:
return $default(_that.email,_that.password,_that.access,_that.refresh);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TokenObtainPair implements TokenObtainPair {
  const _TokenObtainPair({required this.email, required this.password, this.access, this.refresh});
  factory _TokenObtainPair.fromJson(Map<String, dynamic> json) => _$TokenObtainPairFromJson(json);

@override final  String email;
@override final  String password;
@override final  String? access;
@override final  String? refresh;

/// Create a copy of TokenObtainPair
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenObtainPairCopyWith<_TokenObtainPair> get copyWith => __$TokenObtainPairCopyWithImpl<_TokenObtainPair>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokenObtainPairToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenObtainPair&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.access, access) || other.access == access)&&(identical(other.refresh, refresh) || other.refresh == refresh));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password,access,refresh);

@override
String toString() {
  return 'TokenObtainPair(email: $email, password: $password, access: $access, refresh: $refresh)';
}


}

/// @nodoc
abstract mixin class _$TokenObtainPairCopyWith<$Res> implements $TokenObtainPairCopyWith<$Res> {
  factory _$TokenObtainPairCopyWith(_TokenObtainPair value, $Res Function(_TokenObtainPair) _then) = __$TokenObtainPairCopyWithImpl;
@override @useResult
$Res call({
 String email, String password, String? access, String? refresh
});




}
/// @nodoc
class __$TokenObtainPairCopyWithImpl<$Res>
    implements _$TokenObtainPairCopyWith<$Res> {
  __$TokenObtainPairCopyWithImpl(this._self, this._then);

  final _TokenObtainPair _self;
  final $Res Function(_TokenObtainPair) _then;

/// Create a copy of TokenObtainPair
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? access = freezed,Object? refresh = freezed,}) {
  return _then(_TokenObtainPair(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,access: freezed == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as String?,refresh: freezed == refresh ? _self.refresh : refresh // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
