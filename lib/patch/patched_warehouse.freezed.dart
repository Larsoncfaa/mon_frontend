// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_warehouse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatchedWarehouse {

 int? get id; String? get name; String? get location;
/// Create a copy of PatchedWarehouse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatchedWarehouseCopyWith<PatchedWarehouse> get copyWith => _$PatchedWarehouseCopyWithImpl<PatchedWarehouse>(this as PatchedWarehouse, _$identity);

  /// Serializes this PatchedWarehouse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatchedWarehouse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,location);

@override
String toString() {
  return 'PatchedWarehouse(id: $id, name: $name, location: $location)';
}


}

/// @nodoc
abstract mixin class $PatchedWarehouseCopyWith<$Res>  {
  factory $PatchedWarehouseCopyWith(PatchedWarehouse value, $Res Function(PatchedWarehouse) _then) = _$PatchedWarehouseCopyWithImpl;
@useResult
$Res call({
 int? id, String? name, String? location
});




}
/// @nodoc
class _$PatchedWarehouseCopyWithImpl<$Res>
    implements $PatchedWarehouseCopyWith<$Res> {
  _$PatchedWarehouseCopyWithImpl(this._self, this._then);

  final PatchedWarehouse _self;
  final $Res Function(PatchedWarehouse) _then;

/// Create a copy of PatchedWarehouse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? location = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PatchedWarehouse].
extension PatchedWarehousePatterns on PatchedWarehouse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatchedWarehouse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatchedWarehouse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatchedWarehouse value)  $default,){
final _that = this;
switch (_that) {
case _PatchedWarehouse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatchedWarehouse value)?  $default,){
final _that = this;
switch (_that) {
case _PatchedWarehouse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name,  String? location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatchedWarehouse() when $default != null:
return $default(_that.id,_that.name,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name,  String? location)  $default,) {final _that = this;
switch (_that) {
case _PatchedWarehouse():
return $default(_that.id,_that.name,_that.location);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name,  String? location)?  $default,) {final _that = this;
switch (_that) {
case _PatchedWarehouse() when $default != null:
return $default(_that.id,_that.name,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatchedWarehouse implements PatchedWarehouse {
  const _PatchedWarehouse({this.id, this.name, this.location});
  factory _PatchedWarehouse.fromJson(Map<String, dynamic> json) => _$PatchedWarehouseFromJson(json);

@override final  int? id;
@override final  String? name;
@override final  String? location;

/// Create a copy of PatchedWarehouse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatchedWarehouseCopyWith<_PatchedWarehouse> get copyWith => __$PatchedWarehouseCopyWithImpl<_PatchedWarehouse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatchedWarehouseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatchedWarehouse&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,location);

@override
String toString() {
  return 'PatchedWarehouse(id: $id, name: $name, location: $location)';
}


}

/// @nodoc
abstract mixin class _$PatchedWarehouseCopyWith<$Res> implements $PatchedWarehouseCopyWith<$Res> {
  factory _$PatchedWarehouseCopyWith(_PatchedWarehouse value, $Res Function(_PatchedWarehouse) _then) = __$PatchedWarehouseCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name, String? location
});




}
/// @nodoc
class __$PatchedWarehouseCopyWithImpl<$Res>
    implements _$PatchedWarehouseCopyWith<$Res> {
  __$PatchedWarehouseCopyWithImpl(this._self, this._then);

  final _PatchedWarehouse _self;
  final $Res Function(_PatchedWarehouse) _then;

/// Create a copy of PatchedWarehouse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? location = freezed,}) {
  return _then(_PatchedWarehouse(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
