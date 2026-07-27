// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracking_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrackingInfo {

 int get id; int get delivery; double get latitude; double get longitude; String get location; String get status;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of TrackingInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackingInfoCopyWith<TrackingInfo> get copyWith => _$TrackingInfoCopyWithImpl<TrackingInfo>(this as TrackingInfo, _$identity);

  /// Serializes this TrackingInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackingInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,delivery,latitude,longitude,location,status,updatedAt);

@override
String toString() {
  return 'TrackingInfo(id: $id, delivery: $delivery, latitude: $latitude, longitude: $longitude, location: $location, status: $status, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TrackingInfoCopyWith<$Res>  {
  factory $TrackingInfoCopyWith(TrackingInfo value, $Res Function(TrackingInfo) _then) = _$TrackingInfoCopyWithImpl;
@useResult
$Res call({
 int id, int delivery, double latitude, double longitude, String location, String status,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$TrackingInfoCopyWithImpl<$Res>
    implements $TrackingInfoCopyWith<$Res> {
  _$TrackingInfoCopyWithImpl(this._self, this._then);

  final TrackingInfo _self;
  final $Res Function(TrackingInfo) _then;

/// Create a copy of TrackingInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? delivery = null,Object? latitude = null,Object? longitude = null,Object? location = null,Object? status = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,delivery: null == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as int,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackingInfo].
extension TrackingInfoPatterns on TrackingInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackingInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackingInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackingInfo value)  $default,){
final _that = this;
switch (_that) {
case _TrackingInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackingInfo value)?  $default,){
final _that = this;
switch (_that) {
case _TrackingInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int delivery,  double latitude,  double longitude,  String location,  String status, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackingInfo() when $default != null:
return $default(_that.id,_that.delivery,_that.latitude,_that.longitude,_that.location,_that.status,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int delivery,  double latitude,  double longitude,  String location,  String status, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TrackingInfo():
return $default(_that.id,_that.delivery,_that.latitude,_that.longitude,_that.location,_that.status,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int delivery,  double latitude,  double longitude,  String location,  String status, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TrackingInfo() when $default != null:
return $default(_that.id,_that.delivery,_that.latitude,_that.longitude,_that.location,_that.status,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrackingInfo implements TrackingInfo {
  const _TrackingInfo({required this.id, required this.delivery, required this.latitude, required this.longitude, required this.location, required this.status, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _TrackingInfo.fromJson(Map<String, dynamic> json) => _$TrackingInfoFromJson(json);

@override final  int id;
@override final  int delivery;
@override final  double latitude;
@override final  double longitude;
@override final  String location;
@override final  String status;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of TrackingInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackingInfoCopyWith<_TrackingInfo> get copyWith => __$TrackingInfoCopyWithImpl<_TrackingInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackingInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackingInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,delivery,latitude,longitude,location,status,updatedAt);

@override
String toString() {
  return 'TrackingInfo(id: $id, delivery: $delivery, latitude: $latitude, longitude: $longitude, location: $location, status: $status, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TrackingInfoCopyWith<$Res> implements $TrackingInfoCopyWith<$Res> {
  factory _$TrackingInfoCopyWith(_TrackingInfo value, $Res Function(_TrackingInfo) _then) = __$TrackingInfoCopyWithImpl;
@override @useResult
$Res call({
 int id, int delivery, double latitude, double longitude, String location, String status,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$TrackingInfoCopyWithImpl<$Res>
    implements _$TrackingInfoCopyWith<$Res> {
  __$TrackingInfoCopyWithImpl(this._self, this._then);

  final _TrackingInfo _self;
  final $Res Function(_TrackingInfo) _then;

/// Create a copy of TrackingInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? delivery = null,Object? latitude = null,Object? longitude = null,Object? location = null,Object? status = null,Object? updatedAt = null,}) {
  return _then(_TrackingInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,delivery: null == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as int,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
