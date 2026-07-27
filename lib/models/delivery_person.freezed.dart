// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeliveryPerson {

 int get id; int get agriculteur;@JsonKey(name: 'agriculteur_name') String get agriculteurName;@JsonKey(name: 'first_name') String get firstName;@JsonKey(name: 'last_name') String get lastName; String get phone;
/// Create a copy of DeliveryPerson
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryPersonCopyWith<DeliveryPerson> get copyWith => _$DeliveryPersonCopyWithImpl<DeliveryPerson>(this as DeliveryPerson, _$identity);

  /// Serializes this DeliveryPerson to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryPerson&&(identical(other.id, id) || other.id == id)&&(identical(other.agriculteur, agriculteur) || other.agriculteur == agriculteur)&&(identical(other.agriculteurName, agriculteurName) || other.agriculteurName == agriculteurName)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,agriculteur,agriculteurName,firstName,lastName,phone);

@override
String toString() {
  return 'DeliveryPerson(id: $id, agriculteur: $agriculteur, agriculteurName: $agriculteurName, firstName: $firstName, lastName: $lastName, phone: $phone)';
}


}

/// @nodoc
abstract mixin class $DeliveryPersonCopyWith<$Res>  {
  factory $DeliveryPersonCopyWith(DeliveryPerson value, $Res Function(DeliveryPerson) _then) = _$DeliveryPersonCopyWithImpl;
@useResult
$Res call({
 int id, int agriculteur,@JsonKey(name: 'agriculteur_name') String agriculteurName,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String phone
});




}
/// @nodoc
class _$DeliveryPersonCopyWithImpl<$Res>
    implements $DeliveryPersonCopyWith<$Res> {
  _$DeliveryPersonCopyWithImpl(this._self, this._then);

  final DeliveryPerson _self;
  final $Res Function(DeliveryPerson) _then;

/// Create a copy of DeliveryPerson
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? agriculteur = null,Object? agriculteurName = null,Object? firstName = null,Object? lastName = null,Object? phone = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,agriculteur: null == agriculteur ? _self.agriculteur : agriculteur // ignore: cast_nullable_to_non_nullable
as int,agriculteurName: null == agriculteurName ? _self.agriculteurName : agriculteurName // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeliveryPerson].
extension DeliveryPersonPatterns on DeliveryPerson {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliveryPerson value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliveryPerson() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliveryPerson value)  $default,){
final _that = this;
switch (_that) {
case _DeliveryPerson():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliveryPerson value)?  $default,){
final _that = this;
switch (_that) {
case _DeliveryPerson() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int agriculteur, @JsonKey(name: 'agriculteur_name')  String agriculteurName, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliveryPerson() when $default != null:
return $default(_that.id,_that.agriculteur,_that.agriculteurName,_that.firstName,_that.lastName,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int agriculteur, @JsonKey(name: 'agriculteur_name')  String agriculteurName, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String phone)  $default,) {final _that = this;
switch (_that) {
case _DeliveryPerson():
return $default(_that.id,_that.agriculteur,_that.agriculteurName,_that.firstName,_that.lastName,_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int agriculteur, @JsonKey(name: 'agriculteur_name')  String agriculteurName, @JsonKey(name: 'first_name')  String firstName, @JsonKey(name: 'last_name')  String lastName,  String phone)?  $default,) {final _that = this;
switch (_that) {
case _DeliveryPerson() when $default != null:
return $default(_that.id,_that.agriculteur,_that.agriculteurName,_that.firstName,_that.lastName,_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeliveryPerson implements DeliveryPerson {
  const _DeliveryPerson({required this.id, required this.agriculteur, @JsonKey(name: 'agriculteur_name') required this.agriculteurName, @JsonKey(name: 'first_name') required this.firstName, @JsonKey(name: 'last_name') required this.lastName, required this.phone});
  factory _DeliveryPerson.fromJson(Map<String, dynamic> json) => _$DeliveryPersonFromJson(json);

@override final  int id;
@override final  int agriculteur;
@override@JsonKey(name: 'agriculteur_name') final  String agriculteurName;
@override@JsonKey(name: 'first_name') final  String firstName;
@override@JsonKey(name: 'last_name') final  String lastName;
@override final  String phone;

/// Create a copy of DeliveryPerson
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryPersonCopyWith<_DeliveryPerson> get copyWith => __$DeliveryPersonCopyWithImpl<_DeliveryPerson>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryPersonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryPerson&&(identical(other.id, id) || other.id == id)&&(identical(other.agriculteur, agriculteur) || other.agriculteur == agriculteur)&&(identical(other.agriculteurName, agriculteurName) || other.agriculteurName == agriculteurName)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,agriculteur,agriculteurName,firstName,lastName,phone);

@override
String toString() {
  return 'DeliveryPerson(id: $id, agriculteur: $agriculteur, agriculteurName: $agriculteurName, firstName: $firstName, lastName: $lastName, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$DeliveryPersonCopyWith<$Res> implements $DeliveryPersonCopyWith<$Res> {
  factory _$DeliveryPersonCopyWith(_DeliveryPerson value, $Res Function(_DeliveryPerson) _then) = __$DeliveryPersonCopyWithImpl;
@override @useResult
$Res call({
 int id, int agriculteur,@JsonKey(name: 'agriculteur_name') String agriculteurName,@JsonKey(name: 'first_name') String firstName,@JsonKey(name: 'last_name') String lastName, String phone
});




}
/// @nodoc
class __$DeliveryPersonCopyWithImpl<$Res>
    implements _$DeliveryPersonCopyWith<$Res> {
  __$DeliveryPersonCopyWithImpl(this._self, this._then);

  final _DeliveryPerson _self;
  final $Res Function(_DeliveryPerson) _then;

/// Create a copy of DeliveryPerson
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? agriculteur = null,Object? agriculteurName = null,Object? firstName = null,Object? lastName = null,Object? phone = null,}) {
  return _then(_DeliveryPerson(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,agriculteur: null == agriculteur ? _self.agriculteur : agriculteur // ignore: cast_nullable_to_non_nullable
as int,agriculteurName: null == agriculteurName ? _self.agriculteurName : agriculteurName // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
