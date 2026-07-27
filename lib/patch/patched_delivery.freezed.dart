// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_delivery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatchedDelivery {

 int? get id; int? get deliverer; int? get order; int? get product; String? get type;@JsonKey(name: 'delivery_status') String? get deliveryStatus; String? get description;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt; double? get latitude; double? get longitude;
/// Create a copy of PatchedDelivery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatchedDeliveryCopyWith<PatchedDelivery> get copyWith => _$PatchedDeliveryCopyWithImpl<PatchedDelivery>(this as PatchedDelivery, _$identity);

  /// Serializes this PatchedDelivery to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatchedDelivery&&(identical(other.id, id) || other.id == id)&&(identical(other.deliverer, deliverer) || other.deliverer == deliverer)&&(identical(other.order, order) || other.order == order)&&(identical(other.product, product) || other.product == product)&&(identical(other.type, type) || other.type == type)&&(identical(other.deliveryStatus, deliveryStatus) || other.deliveryStatus == deliveryStatus)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deliverer,order,product,type,deliveryStatus,description,createdAt,updatedAt,latitude,longitude);

@override
String toString() {
  return 'PatchedDelivery(id: $id, deliverer: $deliverer, order: $order, product: $product, type: $type, deliveryStatus: $deliveryStatus, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $PatchedDeliveryCopyWith<$Res>  {
  factory $PatchedDeliveryCopyWith(PatchedDelivery value, $Res Function(PatchedDelivery) _then) = _$PatchedDeliveryCopyWithImpl;
@useResult
$Res call({
 int? id, int? deliverer, int? order, int? product, String? type,@JsonKey(name: 'delivery_status') String? deliveryStatus, String? description,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, double? latitude, double? longitude
});




}
/// @nodoc
class _$PatchedDeliveryCopyWithImpl<$Res>
    implements $PatchedDeliveryCopyWith<$Res> {
  _$PatchedDeliveryCopyWithImpl(this._self, this._then);

  final PatchedDelivery _self;
  final $Res Function(PatchedDelivery) _then;

/// Create a copy of PatchedDelivery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? deliverer = freezed,Object? order = freezed,Object? product = freezed,Object? type = freezed,Object? deliveryStatus = freezed,Object? description = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,deliverer: freezed == deliverer ? _self.deliverer : deliverer // ignore: cast_nullable_to_non_nullable
as int?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,deliveryStatus: freezed == deliveryStatus ? _self.deliveryStatus : deliveryStatus // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [PatchedDelivery].
extension PatchedDeliveryPatterns on PatchedDelivery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatchedDelivery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatchedDelivery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatchedDelivery value)  $default,){
final _that = this;
switch (_that) {
case _PatchedDelivery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatchedDelivery value)?  $default,){
final _that = this;
switch (_that) {
case _PatchedDelivery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? deliverer,  int? order,  int? product,  String? type, @JsonKey(name: 'delivery_status')  String? deliveryStatus,  String? description, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  double? latitude,  double? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatchedDelivery() when $default != null:
return $default(_that.id,_that.deliverer,_that.order,_that.product,_that.type,_that.deliveryStatus,_that.description,_that.createdAt,_that.updatedAt,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? deliverer,  int? order,  int? product,  String? type, @JsonKey(name: 'delivery_status')  String? deliveryStatus,  String? description, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  double? latitude,  double? longitude)  $default,) {final _that = this;
switch (_that) {
case _PatchedDelivery():
return $default(_that.id,_that.deliverer,_that.order,_that.product,_that.type,_that.deliveryStatus,_that.description,_that.createdAt,_that.updatedAt,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? deliverer,  int? order,  int? product,  String? type, @JsonKey(name: 'delivery_status')  String? deliveryStatus,  String? description, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt,  double? latitude,  double? longitude)?  $default,) {final _that = this;
switch (_that) {
case _PatchedDelivery() when $default != null:
return $default(_that.id,_that.deliverer,_that.order,_that.product,_that.type,_that.deliveryStatus,_that.description,_that.createdAt,_that.updatedAt,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatchedDelivery implements PatchedDelivery {
  const _PatchedDelivery({this.id, this.deliverer, this.order, this.product, this.type, @JsonKey(name: 'delivery_status') this.deliveryStatus, this.description, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, this.latitude, this.longitude});
  factory _PatchedDelivery.fromJson(Map<String, dynamic> json) => _$PatchedDeliveryFromJson(json);

@override final  int? id;
@override final  int? deliverer;
@override final  int? order;
@override final  int? product;
@override final  String? type;
@override@JsonKey(name: 'delivery_status') final  String? deliveryStatus;
@override final  String? description;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;
@override final  double? latitude;
@override final  double? longitude;

/// Create a copy of PatchedDelivery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatchedDeliveryCopyWith<_PatchedDelivery> get copyWith => __$PatchedDeliveryCopyWithImpl<_PatchedDelivery>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatchedDeliveryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatchedDelivery&&(identical(other.id, id) || other.id == id)&&(identical(other.deliverer, deliverer) || other.deliverer == deliverer)&&(identical(other.order, order) || other.order == order)&&(identical(other.product, product) || other.product == product)&&(identical(other.type, type) || other.type == type)&&(identical(other.deliveryStatus, deliveryStatus) || other.deliveryStatus == deliveryStatus)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deliverer,order,product,type,deliveryStatus,description,createdAt,updatedAt,latitude,longitude);

@override
String toString() {
  return 'PatchedDelivery(id: $id, deliverer: $deliverer, order: $order, product: $product, type: $type, deliveryStatus: $deliveryStatus, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$PatchedDeliveryCopyWith<$Res> implements $PatchedDeliveryCopyWith<$Res> {
  factory _$PatchedDeliveryCopyWith(_PatchedDelivery value, $Res Function(_PatchedDelivery) _then) = __$PatchedDeliveryCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? deliverer, int? order, int? product, String? type,@JsonKey(name: 'delivery_status') String? deliveryStatus, String? description,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt, double? latitude, double? longitude
});




}
/// @nodoc
class __$PatchedDeliveryCopyWithImpl<$Res>
    implements _$PatchedDeliveryCopyWith<$Res> {
  __$PatchedDeliveryCopyWithImpl(this._self, this._then);

  final _PatchedDelivery _self;
  final $Res Function(_PatchedDelivery) _then;

/// Create a copy of PatchedDelivery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? deliverer = freezed,Object? order = freezed,Object? product = freezed,Object? type = freezed,Object? deliveryStatus = freezed,Object? description = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_PatchedDelivery(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,deliverer: freezed == deliverer ? _self.deliverer : deliverer // ignore: cast_nullable_to_non_nullable
as int?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,deliveryStatus: freezed == deliveryStatus ? _self.deliveryStatus : deliveryStatus // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
