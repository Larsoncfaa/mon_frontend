// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_tracking_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatchedTrackingInfo {

 int? get id; int? get delivery; double? get latitude; double? get longitude; String? get location;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of PatchedTrackingInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatchedTrackingInfoCopyWith<PatchedTrackingInfo> get copyWith => _$PatchedTrackingInfoCopyWithImpl<PatchedTrackingInfo>(this as PatchedTrackingInfo, _$identity);

  /// Serializes this PatchedTrackingInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatchedTrackingInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.location, location) || other.location == location)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,delivery,latitude,longitude,location,updatedAt);

@override
String toString() {
  return 'PatchedTrackingInfo(id: $id, delivery: $delivery, latitude: $latitude, longitude: $longitude, location: $location, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PatchedTrackingInfoCopyWith<$Res>  {
  factory $PatchedTrackingInfoCopyWith(PatchedTrackingInfo value, $Res Function(PatchedTrackingInfo) _then) = _$PatchedTrackingInfoCopyWithImpl;
@useResult
$Res call({
 int? id, int? delivery, double? latitude, double? longitude, String? location,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$PatchedTrackingInfoCopyWithImpl<$Res>
    implements $PatchedTrackingInfoCopyWith<$Res> {
  _$PatchedTrackingInfoCopyWithImpl(this._self, this._then);

  final PatchedTrackingInfo _self;
  final $Res Function(PatchedTrackingInfo) _then;

/// Create a copy of PatchedTrackingInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? delivery = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? location = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,delivery: freezed == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as int?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PatchedTrackingInfo].
extension PatchedTrackingInfoPatterns on PatchedTrackingInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatchedTrackingInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatchedTrackingInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatchedTrackingInfo value)  $default,){
final _that = this;
switch (_that) {
case _PatchedTrackingInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatchedTrackingInfo value)?  $default,){
final _that = this;
switch (_that) {
case _PatchedTrackingInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? delivery,  double? latitude,  double? longitude,  String? location, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatchedTrackingInfo() when $default != null:
return $default(_that.id,_that.delivery,_that.latitude,_that.longitude,_that.location,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? delivery,  double? latitude,  double? longitude,  String? location, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _PatchedTrackingInfo():
return $default(_that.id,_that.delivery,_that.latitude,_that.longitude,_that.location,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? delivery,  double? latitude,  double? longitude,  String? location, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _PatchedTrackingInfo() when $default != null:
return $default(_that.id,_that.delivery,_that.latitude,_that.longitude,_that.location,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatchedTrackingInfo implements PatchedTrackingInfo {
  const _PatchedTrackingInfo({this.id, this.delivery, this.latitude, this.longitude, this.location, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _PatchedTrackingInfo.fromJson(Map<String, dynamic> json) => _$PatchedTrackingInfoFromJson(json);

@override final  int? id;
@override final  int? delivery;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? location;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of PatchedTrackingInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatchedTrackingInfoCopyWith<_PatchedTrackingInfo> get copyWith => __$PatchedTrackingInfoCopyWithImpl<_PatchedTrackingInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatchedTrackingInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatchedTrackingInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.location, location) || other.location == location)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,delivery,latitude,longitude,location,updatedAt);

@override
String toString() {
  return 'PatchedTrackingInfo(id: $id, delivery: $delivery, latitude: $latitude, longitude: $longitude, location: $location, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PatchedTrackingInfoCopyWith<$Res> implements $PatchedTrackingInfoCopyWith<$Res> {
  factory _$PatchedTrackingInfoCopyWith(_PatchedTrackingInfo value, $Res Function(_PatchedTrackingInfo) _then) = __$PatchedTrackingInfoCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? delivery, double? latitude, double? longitude, String? location,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$PatchedTrackingInfoCopyWithImpl<$Res>
    implements _$PatchedTrackingInfoCopyWith<$Res> {
  __$PatchedTrackingInfoCopyWithImpl(this._self, this._then);

  final _PatchedTrackingInfo _self;
  final $Res Function(_PatchedTrackingInfo) _then;

/// Create a copy of PatchedTrackingInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? delivery = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? location = freezed,Object? updatedAt = freezed,}) {
  return _then(_PatchedTrackingInfo(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,delivery: freezed == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as int?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
