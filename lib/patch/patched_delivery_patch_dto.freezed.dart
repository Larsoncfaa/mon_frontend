// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_delivery_patch_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatchedDeliveryPatchDto {

 int? get deliverer; int? get order; int? get product; String? get type;@JsonKey(name: 'delivery_status') String? get deliveryStatus; String? get description; double? get latitude; double? get longitude;
/// Create a copy of PatchedDeliveryPatchDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatchedDeliveryPatchDtoCopyWith<PatchedDeliveryPatchDto> get copyWith => _$PatchedDeliveryPatchDtoCopyWithImpl<PatchedDeliveryPatchDto>(this as PatchedDeliveryPatchDto, _$identity);

  /// Serializes this PatchedDeliveryPatchDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatchedDeliveryPatchDto&&(identical(other.deliverer, deliverer) || other.deliverer == deliverer)&&(identical(other.order, order) || other.order == order)&&(identical(other.product, product) || other.product == product)&&(identical(other.type, type) || other.type == type)&&(identical(other.deliveryStatus, deliveryStatus) || other.deliveryStatus == deliveryStatus)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deliverer,order,product,type,deliveryStatus,description,latitude,longitude);

@override
String toString() {
  return 'PatchedDeliveryPatchDto(deliverer: $deliverer, order: $order, product: $product, type: $type, deliveryStatus: $deliveryStatus, description: $description, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $PatchedDeliveryPatchDtoCopyWith<$Res>  {
  factory $PatchedDeliveryPatchDtoCopyWith(PatchedDeliveryPatchDto value, $Res Function(PatchedDeliveryPatchDto) _then) = _$PatchedDeliveryPatchDtoCopyWithImpl;
@useResult
$Res call({
 int? deliverer, int? order, int? product, String? type,@JsonKey(name: 'delivery_status') String? deliveryStatus, String? description, double? latitude, double? longitude
});




}
/// @nodoc
class _$PatchedDeliveryPatchDtoCopyWithImpl<$Res>
    implements $PatchedDeliveryPatchDtoCopyWith<$Res> {
  _$PatchedDeliveryPatchDtoCopyWithImpl(this._self, this._then);

  final PatchedDeliveryPatchDto _self;
  final $Res Function(PatchedDeliveryPatchDto) _then;

/// Create a copy of PatchedDeliveryPatchDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deliverer = freezed,Object? order = freezed,Object? product = freezed,Object? type = freezed,Object? deliveryStatus = freezed,Object? description = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
deliverer: freezed == deliverer ? _self.deliverer : deliverer // ignore: cast_nullable_to_non_nullable
as int?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,deliveryStatus: freezed == deliveryStatus ? _self.deliveryStatus : deliveryStatus // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [PatchedDeliveryPatchDto].
extension PatchedDeliveryPatchDtoPatterns on PatchedDeliveryPatchDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatchedDeliveryPatchDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatchedDeliveryPatchDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatchedDeliveryPatchDto value)  $default,){
final _that = this;
switch (_that) {
case _PatchedDeliveryPatchDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatchedDeliveryPatchDto value)?  $default,){
final _that = this;
switch (_that) {
case _PatchedDeliveryPatchDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? deliverer,  int? order,  int? product,  String? type, @JsonKey(name: 'delivery_status')  String? deliveryStatus,  String? description,  double? latitude,  double? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatchedDeliveryPatchDto() when $default != null:
return $default(_that.deliverer,_that.order,_that.product,_that.type,_that.deliveryStatus,_that.description,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? deliverer,  int? order,  int? product,  String? type, @JsonKey(name: 'delivery_status')  String? deliveryStatus,  String? description,  double? latitude,  double? longitude)  $default,) {final _that = this;
switch (_that) {
case _PatchedDeliveryPatchDto():
return $default(_that.deliverer,_that.order,_that.product,_that.type,_that.deliveryStatus,_that.description,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? deliverer,  int? order,  int? product,  String? type, @JsonKey(name: 'delivery_status')  String? deliveryStatus,  String? description,  double? latitude,  double? longitude)?  $default,) {final _that = this;
switch (_that) {
case _PatchedDeliveryPatchDto() when $default != null:
return $default(_that.deliverer,_that.order,_that.product,_that.type,_that.deliveryStatus,_that.description,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatchedDeliveryPatchDto implements PatchedDeliveryPatchDto {
  const _PatchedDeliveryPatchDto({this.deliverer, this.order, this.product, this.type, @JsonKey(name: 'delivery_status') this.deliveryStatus, this.description, this.latitude, this.longitude});
  factory _PatchedDeliveryPatchDto.fromJson(Map<String, dynamic> json) => _$PatchedDeliveryPatchDtoFromJson(json);

@override final  int? deliverer;
@override final  int? order;
@override final  int? product;
@override final  String? type;
@override@JsonKey(name: 'delivery_status') final  String? deliveryStatus;
@override final  String? description;
@override final  double? latitude;
@override final  double? longitude;

/// Create a copy of PatchedDeliveryPatchDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatchedDeliveryPatchDtoCopyWith<_PatchedDeliveryPatchDto> get copyWith => __$PatchedDeliveryPatchDtoCopyWithImpl<_PatchedDeliveryPatchDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatchedDeliveryPatchDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatchedDeliveryPatchDto&&(identical(other.deliverer, deliverer) || other.deliverer == deliverer)&&(identical(other.order, order) || other.order == order)&&(identical(other.product, product) || other.product == product)&&(identical(other.type, type) || other.type == type)&&(identical(other.deliveryStatus, deliveryStatus) || other.deliveryStatus == deliveryStatus)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deliverer,order,product,type,deliveryStatus,description,latitude,longitude);

@override
String toString() {
  return 'PatchedDeliveryPatchDto(deliverer: $deliverer, order: $order, product: $product, type: $type, deliveryStatus: $deliveryStatus, description: $description, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$PatchedDeliveryPatchDtoCopyWith<$Res> implements $PatchedDeliveryPatchDtoCopyWith<$Res> {
  factory _$PatchedDeliveryPatchDtoCopyWith(_PatchedDeliveryPatchDto value, $Res Function(_PatchedDeliveryPatchDto) _then) = __$PatchedDeliveryPatchDtoCopyWithImpl;
@override @useResult
$Res call({
 int? deliverer, int? order, int? product, String? type,@JsonKey(name: 'delivery_status') String? deliveryStatus, String? description, double? latitude, double? longitude
});




}
/// @nodoc
class __$PatchedDeliveryPatchDtoCopyWithImpl<$Res>
    implements _$PatchedDeliveryPatchDtoCopyWith<$Res> {
  __$PatchedDeliveryPatchDtoCopyWithImpl(this._self, this._then);

  final _PatchedDeliveryPatchDto _self;
  final $Res Function(_PatchedDeliveryPatchDto) _then;

/// Create a copy of PatchedDeliveryPatchDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deliverer = freezed,Object? order = freezed,Object? product = freezed,Object? type = freezed,Object? deliveryStatus = freezed,Object? description = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_PatchedDeliveryPatchDto(
deliverer: freezed == deliverer ? _self.deliverer : deliverer // ignore: cast_nullable_to_non_nullable
as int?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,deliveryStatus: freezed == deliveryStatus ? _self.deliveryStatus : deliveryStatus // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
