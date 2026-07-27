// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_stock_movement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatchedStockMovement {

 int? get id;@JsonKey(name: 'product_id') int? get productId; int? get warehouse;@JsonKey(name: 'movement_type') String? get movementType; int? get quantity; DateTime? get timestamp; String? get destination;
/// Create a copy of PatchedStockMovement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatchedStockMovementCopyWith<PatchedStockMovement> get copyWith => _$PatchedStockMovementCopyWithImpl<PatchedStockMovement>(this as PatchedStockMovement, _$identity);

  /// Serializes this PatchedStockMovement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatchedStockMovement&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.warehouse, warehouse) || other.warehouse == warehouse)&&(identical(other.movementType, movementType) || other.movementType == movementType)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.destination, destination) || other.destination == destination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,warehouse,movementType,quantity,timestamp,destination);

@override
String toString() {
  return 'PatchedStockMovement(id: $id, productId: $productId, warehouse: $warehouse, movementType: $movementType, quantity: $quantity, timestamp: $timestamp, destination: $destination)';
}


}

/// @nodoc
abstract mixin class $PatchedStockMovementCopyWith<$Res>  {
  factory $PatchedStockMovementCopyWith(PatchedStockMovement value, $Res Function(PatchedStockMovement) _then) = _$PatchedStockMovementCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'product_id') int? productId, int? warehouse,@JsonKey(name: 'movement_type') String? movementType, int? quantity, DateTime? timestamp, String? destination
});




}
/// @nodoc
class _$PatchedStockMovementCopyWithImpl<$Res>
    implements $PatchedStockMovementCopyWith<$Res> {
  _$PatchedStockMovementCopyWithImpl(this._self, this._then);

  final PatchedStockMovement _self;
  final $Res Function(PatchedStockMovement) _then;

/// Create a copy of PatchedStockMovement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? productId = freezed,Object? warehouse = freezed,Object? movementType = freezed,Object? quantity = freezed,Object? timestamp = freezed,Object? destination = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int?,warehouse: freezed == warehouse ? _self.warehouse : warehouse // ignore: cast_nullable_to_non_nullable
as int?,movementType: freezed == movementType ? _self.movementType : movementType // ignore: cast_nullable_to_non_nullable
as String?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PatchedStockMovement].
extension PatchedStockMovementPatterns on PatchedStockMovement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatchedStockMovement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatchedStockMovement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatchedStockMovement value)  $default,){
final _that = this;
switch (_that) {
case _PatchedStockMovement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatchedStockMovement value)?  $default,){
final _that = this;
switch (_that) {
case _PatchedStockMovement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'product_id')  int? productId,  int? warehouse, @JsonKey(name: 'movement_type')  String? movementType,  int? quantity,  DateTime? timestamp,  String? destination)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatchedStockMovement() when $default != null:
return $default(_that.id,_that.productId,_that.warehouse,_that.movementType,_that.quantity,_that.timestamp,_that.destination);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'product_id')  int? productId,  int? warehouse, @JsonKey(name: 'movement_type')  String? movementType,  int? quantity,  DateTime? timestamp,  String? destination)  $default,) {final _that = this;
switch (_that) {
case _PatchedStockMovement():
return $default(_that.id,_that.productId,_that.warehouse,_that.movementType,_that.quantity,_that.timestamp,_that.destination);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'product_id')  int? productId,  int? warehouse, @JsonKey(name: 'movement_type')  String? movementType,  int? quantity,  DateTime? timestamp,  String? destination)?  $default,) {final _that = this;
switch (_that) {
case _PatchedStockMovement() when $default != null:
return $default(_that.id,_that.productId,_that.warehouse,_that.movementType,_that.quantity,_that.timestamp,_that.destination);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatchedStockMovement implements PatchedStockMovement {
  const _PatchedStockMovement({this.id, @JsonKey(name: 'product_id') this.productId, this.warehouse, @JsonKey(name: 'movement_type') this.movementType, this.quantity, this.timestamp, this.destination});
  factory _PatchedStockMovement.fromJson(Map<String, dynamic> json) => _$PatchedStockMovementFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'product_id') final  int? productId;
@override final  int? warehouse;
@override@JsonKey(name: 'movement_type') final  String? movementType;
@override final  int? quantity;
@override final  DateTime? timestamp;
@override final  String? destination;

/// Create a copy of PatchedStockMovement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatchedStockMovementCopyWith<_PatchedStockMovement> get copyWith => __$PatchedStockMovementCopyWithImpl<_PatchedStockMovement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatchedStockMovementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatchedStockMovement&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.warehouse, warehouse) || other.warehouse == warehouse)&&(identical(other.movementType, movementType) || other.movementType == movementType)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.destination, destination) || other.destination == destination));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,warehouse,movementType,quantity,timestamp,destination);

@override
String toString() {
  return 'PatchedStockMovement(id: $id, productId: $productId, warehouse: $warehouse, movementType: $movementType, quantity: $quantity, timestamp: $timestamp, destination: $destination)';
}


}

/// @nodoc
abstract mixin class _$PatchedStockMovementCopyWith<$Res> implements $PatchedStockMovementCopyWith<$Res> {
  factory _$PatchedStockMovementCopyWith(_PatchedStockMovement value, $Res Function(_PatchedStockMovement) _then) = __$PatchedStockMovementCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'product_id') int? productId, int? warehouse,@JsonKey(name: 'movement_type') String? movementType, int? quantity, DateTime? timestamp, String? destination
});




}
/// @nodoc
class __$PatchedStockMovementCopyWithImpl<$Res>
    implements _$PatchedStockMovementCopyWith<$Res> {
  __$PatchedStockMovementCopyWithImpl(this._self, this._then);

  final _PatchedStockMovement _self;
  final $Res Function(_PatchedStockMovement) _then;

/// Create a copy of PatchedStockMovement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? productId = freezed,Object? warehouse = freezed,Object? movementType = freezed,Object? quantity = freezed,Object? timestamp = freezed,Object? destination = freezed,}) {
  return _then(_PatchedStockMovement(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int?,warehouse: freezed == warehouse ? _self.warehouse : warehouse // ignore: cast_nullable_to_non_nullable
as int?,movementType: freezed == movementType ? _self.movementType : movementType // ignore: cast_nullable_to_non_nullable
as String?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
