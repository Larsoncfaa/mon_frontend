// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_refresh.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TokenRefresh {

 String get refresh; String? get access;
/// Create a copy of TokenRefresh
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenRefreshCopyWith<TokenRefresh> get copyWith => _$TokenRefreshCopyWithImpl<TokenRefresh>(this as TokenRefresh, _$identity);

  /// Serializes this TokenRefresh to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenRefresh&&(identical(other.refresh, refresh) || other.refresh == refresh)&&(identical(other.access, access) || other.access == access));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refresh,access);

@override
String toString() {
  return 'TokenRefresh(refresh: $refresh, access: $access)';
}


}

/// @nodoc
abstract mixin class $TokenRefreshCopyWith<$Res>  {
  factory $TokenRefreshCopyWith(TokenRefresh value, $Res Function(TokenRefresh) _then) = _$TokenRefreshCopyWithImpl;
@useResult
$Res call({
 String refresh, String? access
});




}
/// @nodoc
class _$TokenRefreshCopyWithImpl<$Res>
    implements $TokenRefreshCopyWith<$Res> {
  _$TokenRefreshCopyWithImpl(this._self, this._then);

  final TokenRefresh _self;
  final $Res Function(TokenRefresh) _then;

/// Create a copy of TokenRefresh
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? refresh = null,Object? access = freezed,}) {
  return _then(_self.copyWith(
refresh: null == refresh ? _self.refresh : refresh // ignore: cast_nullable_to_non_nullable
as String,access: freezed == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TokenRefresh].
extension TokenRefreshPatterns on TokenRefresh {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TokenRefresh value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TokenRefresh() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TokenRefresh value)  $default,){
final _that = this;
switch (_that) {
case _TokenRefresh():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TokenRefresh value)?  $default,){
final _that = this;
switch (_that) {
case _TokenRefresh() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String refresh,  String? access)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TokenRefresh() when $default != null:
return $default(_that.refresh,_that.access);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String refresh,  String? access)  $default,) {final _that = this;
switch (_that) {
case _TokenRefresh():
return $default(_that.refresh,_that.access);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String refresh,  String? access)?  $default,) {final _that = this;
switch (_that) {
case _TokenRefresh() when $default != null:
return $default(_that.refresh,_that.access);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TokenRefresh implements TokenRefresh {
  const _TokenRefresh({required this.refresh, this.access});
  factory _TokenRefresh.fromJson(Map<String, dynamic> json) => _$TokenRefreshFromJson(json);

@override final  String refresh;
@override final  String? access;

/// Create a copy of TokenRefresh
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenRefreshCopyWith<_TokenRefresh> get copyWith => __$TokenRefreshCopyWithImpl<_TokenRefresh>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokenRefreshToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenRefresh&&(identical(other.refresh, refresh) || other.refresh == refresh)&&(identical(other.access, access) || other.access == access));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refresh,access);

@override
String toString() {
  return 'TokenRefresh(refresh: $refresh, access: $access)';
}


}

/// @nodoc
abstract mixin class _$TokenRefreshCopyWith<$Res> implements $TokenRefreshCopyWith<$Res> {
  factory _$TokenRefreshCopyWith(_TokenRefresh value, $Res Function(_TokenRefresh) _then) = __$TokenRefreshCopyWithImpl;
@override @useResult
$Res call({
 String refresh, String? access
});




}
/// @nodoc
class __$TokenRefreshCopyWithImpl<$Res>
    implements _$TokenRefreshCopyWith<$Res> {
  __$TokenRefreshCopyWithImpl(this._self, this._then);

  final _TokenRefresh _self;
  final $Res Function(_TokenRefresh) _then;

/// Create a copy of TokenRefresh
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? refresh = null,Object? access = freezed,}) {
  return _then(_TokenRefresh(
refresh: null == refresh ? _self.refresh : refresh // ignore: cast_nullable_to_non_nullable
as String,access: freezed == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
