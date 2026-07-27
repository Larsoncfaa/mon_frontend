// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_client_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatchedClientProfile {

 int? get id; String? get location; double? get balance;@JsonKey(name: 'loyalty_points') int? get loyaltyPoints; int? get user;
/// Create a copy of PatchedClientProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatchedClientProfileCopyWith<PatchedClientProfile> get copyWith => _$PatchedClientProfileCopyWithImpl<PatchedClientProfile>(this as PatchedClientProfile, _$identity);

  /// Serializes this PatchedClientProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatchedClientProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.location, location) || other.location == location)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.loyaltyPoints, loyaltyPoints) || other.loyaltyPoints == loyaltyPoints)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,location,balance,loyaltyPoints,user);

@override
String toString() {
  return 'PatchedClientProfile(id: $id, location: $location, balance: $balance, loyaltyPoints: $loyaltyPoints, user: $user)';
}


}

/// @nodoc
abstract mixin class $PatchedClientProfileCopyWith<$Res>  {
  factory $PatchedClientProfileCopyWith(PatchedClientProfile value, $Res Function(PatchedClientProfile) _then) = _$PatchedClientProfileCopyWithImpl;
@useResult
$Res call({
 int? id, String? location, double? balance,@JsonKey(name: 'loyalty_points') int? loyaltyPoints, int? user
});




}
/// @nodoc
class _$PatchedClientProfileCopyWithImpl<$Res>
    implements $PatchedClientProfileCopyWith<$Res> {
  _$PatchedClientProfileCopyWithImpl(this._self, this._then);

  final PatchedClientProfile _self;
  final $Res Function(PatchedClientProfile) _then;

/// Create a copy of PatchedClientProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? location = freezed,Object? balance = freezed,Object? loyaltyPoints = freezed,Object? user = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double?,loyaltyPoints: freezed == loyaltyPoints ? _self.loyaltyPoints : loyaltyPoints // ignore: cast_nullable_to_non_nullable
as int?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PatchedClientProfile].
extension PatchedClientProfilePatterns on PatchedClientProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatchedClientProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatchedClientProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatchedClientProfile value)  $default,){
final _that = this;
switch (_that) {
case _PatchedClientProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatchedClientProfile value)?  $default,){
final _that = this;
switch (_that) {
case _PatchedClientProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? location,  double? balance, @JsonKey(name: 'loyalty_points')  int? loyaltyPoints,  int? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatchedClientProfile() when $default != null:
return $default(_that.id,_that.location,_that.balance,_that.loyaltyPoints,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? location,  double? balance, @JsonKey(name: 'loyalty_points')  int? loyaltyPoints,  int? user)  $default,) {final _that = this;
switch (_that) {
case _PatchedClientProfile():
return $default(_that.id,_that.location,_that.balance,_that.loyaltyPoints,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? location,  double? balance, @JsonKey(name: 'loyalty_points')  int? loyaltyPoints,  int? user)?  $default,) {final _that = this;
switch (_that) {
case _PatchedClientProfile() when $default != null:
return $default(_that.id,_that.location,_that.balance,_that.loyaltyPoints,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatchedClientProfile implements PatchedClientProfile {
  const _PatchedClientProfile({this.id, this.location, this.balance, @JsonKey(name: 'loyalty_points') this.loyaltyPoints, this.user});
  factory _PatchedClientProfile.fromJson(Map<String, dynamic> json) => _$PatchedClientProfileFromJson(json);

@override final  int? id;
@override final  String? location;
@override final  double? balance;
@override@JsonKey(name: 'loyalty_points') final  int? loyaltyPoints;
@override final  int? user;

/// Create a copy of PatchedClientProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatchedClientProfileCopyWith<_PatchedClientProfile> get copyWith => __$PatchedClientProfileCopyWithImpl<_PatchedClientProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatchedClientProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatchedClientProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.location, location) || other.location == location)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.loyaltyPoints, loyaltyPoints) || other.loyaltyPoints == loyaltyPoints)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,location,balance,loyaltyPoints,user);

@override
String toString() {
  return 'PatchedClientProfile(id: $id, location: $location, balance: $balance, loyaltyPoints: $loyaltyPoints, user: $user)';
}


}

/// @nodoc
abstract mixin class _$PatchedClientProfileCopyWith<$Res> implements $PatchedClientProfileCopyWith<$Res> {
  factory _$PatchedClientProfileCopyWith(_PatchedClientProfile value, $Res Function(_PatchedClientProfile) _then) = __$PatchedClientProfileCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? location, double? balance,@JsonKey(name: 'loyalty_points') int? loyaltyPoints, int? user
});




}
/// @nodoc
class __$PatchedClientProfileCopyWithImpl<$Res>
    implements _$PatchedClientProfileCopyWith<$Res> {
  __$PatchedClientProfileCopyWithImpl(this._self, this._then);

  final _PatchedClientProfile _self;
  final $Res Function(_PatchedClientProfile) _then;

/// Create a copy of PatchedClientProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? location = freezed,Object? balance = freezed,Object? loyaltyPoints = freezed,Object? user = freezed,}) {
  return _then(_PatchedClientProfile(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as double?,loyaltyPoints: freezed == loyaltyPoints ? _self.loyaltyPoints : loyaltyPoints // ignore: cast_nullable_to_non_nullable
as int?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
