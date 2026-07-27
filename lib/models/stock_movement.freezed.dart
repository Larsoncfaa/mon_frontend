// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_movement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StockMovement {

 int get id; int get product; int get warehouse;@JsonKey(name: 'stock_applied') bool get stockApplied; int? get batch;@JsonKey(name: 'is_archived') bool get isArchived;@JsonKey(name: 'movement_type', fromJson: stringToMovementTypeEnum, toJson: movementTypeEnumToString) MovementTypeEnum get movementType; int get quantity; DateTime get timestamp; int? get user;@JsonKey(name: 'product_name') String? get productName;
/// Create a copy of StockMovement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockMovementCopyWith<StockMovement> get copyWith => _$StockMovementCopyWithImpl<StockMovement>(this as StockMovement, _$identity);

  /// Serializes this StockMovement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockMovement&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.warehouse, warehouse) || other.warehouse == warehouse)&&(identical(other.stockApplied, stockApplied) || other.stockApplied == stockApplied)&&(identical(other.batch, batch) || other.batch == batch)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.movementType, movementType) || other.movementType == movementType)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.user, user) || other.user == user)&&(identical(other.productName, productName) || other.productName == productName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,warehouse,stockApplied,batch,isArchived,movementType,quantity,timestamp,user,productName);

@override
String toString() {
  return 'StockMovement(id: $id, product: $product, warehouse: $warehouse, stockApplied: $stockApplied, batch: $batch, isArchived: $isArchived, movementType: $movementType, quantity: $quantity, timestamp: $timestamp, user: $user, productName: $productName)';
}


}

/// @nodoc
abstract mixin class $StockMovementCopyWith<$Res>  {
  factory $StockMovementCopyWith(StockMovement value, $Res Function(StockMovement) _then) = _$StockMovementCopyWithImpl;
@useResult
$Res call({
 int id, int product, int warehouse,@JsonKey(name: 'stock_applied') bool stockApplied, int? batch,@JsonKey(name: 'is_archived') bool isArchived,@JsonKey(name: 'movement_type', fromJson: stringToMovementTypeEnum, toJson: movementTypeEnumToString) MovementTypeEnum movementType, int quantity, DateTime timestamp, int? user,@JsonKey(name: 'product_name') String? productName
});




}
/// @nodoc
class _$StockMovementCopyWithImpl<$Res>
    implements $StockMovementCopyWith<$Res> {
  _$StockMovementCopyWithImpl(this._self, this._then);

  final StockMovement _self;
  final $Res Function(StockMovement) _then;

/// Create a copy of StockMovement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? product = null,Object? warehouse = null,Object? stockApplied = null,Object? batch = freezed,Object? isArchived = null,Object? movementType = null,Object? quantity = null,Object? timestamp = null,Object? user = freezed,Object? productName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as int,warehouse: null == warehouse ? _self.warehouse : warehouse // ignore: cast_nullable_to_non_nullable
as int,stockApplied: null == stockApplied ? _self.stockApplied : stockApplied // ignore: cast_nullable_to_non_nullable
as bool,batch: freezed == batch ? _self.batch : batch // ignore: cast_nullable_to_non_nullable
as int?,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,movementType: null == movementType ? _self.movementType : movementType // ignore: cast_nullable_to_non_nullable
as MovementTypeEnum,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as int?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StockMovement].
extension StockMovementPatterns on StockMovement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockMovement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockMovement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockMovement value)  $default,){
final _that = this;
switch (_that) {
case _StockMovement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockMovement value)?  $default,){
final _that = this;
switch (_that) {
case _StockMovement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int product,  int warehouse, @JsonKey(name: 'stock_applied')  bool stockApplied,  int? batch, @JsonKey(name: 'is_archived')  bool isArchived, @JsonKey(name: 'movement_type', fromJson: stringToMovementTypeEnum, toJson: movementTypeEnumToString)  MovementTypeEnum movementType,  int quantity,  DateTime timestamp,  int? user, @JsonKey(name: 'product_name')  String? productName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockMovement() when $default != null:
return $default(_that.id,_that.product,_that.warehouse,_that.stockApplied,_that.batch,_that.isArchived,_that.movementType,_that.quantity,_that.timestamp,_that.user,_that.productName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int product,  int warehouse, @JsonKey(name: 'stock_applied')  bool stockApplied,  int? batch, @JsonKey(name: 'is_archived')  bool isArchived, @JsonKey(name: 'movement_type', fromJson: stringToMovementTypeEnum, toJson: movementTypeEnumToString)  MovementTypeEnum movementType,  int quantity,  DateTime timestamp,  int? user, @JsonKey(name: 'product_name')  String? productName)  $default,) {final _that = this;
switch (_that) {
case _StockMovement():
return $default(_that.id,_that.product,_that.warehouse,_that.stockApplied,_that.batch,_that.isArchived,_that.movementType,_that.quantity,_that.timestamp,_that.user,_that.productName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int product,  int warehouse, @JsonKey(name: 'stock_applied')  bool stockApplied,  int? batch, @JsonKey(name: 'is_archived')  bool isArchived, @JsonKey(name: 'movement_type', fromJson: stringToMovementTypeEnum, toJson: movementTypeEnumToString)  MovementTypeEnum movementType,  int quantity,  DateTime timestamp,  int? user, @JsonKey(name: 'product_name')  String? productName)?  $default,) {final _that = this;
switch (_that) {
case _StockMovement() when $default != null:
return $default(_that.id,_that.product,_that.warehouse,_that.stockApplied,_that.batch,_that.isArchived,_that.movementType,_that.quantity,_that.timestamp,_that.user,_that.productName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockMovement implements StockMovement {
  const _StockMovement({required this.id, required this.product, required this.warehouse, @JsonKey(name: 'stock_applied') this.stockApplied = false, this.batch, @JsonKey(name: 'is_archived') this.isArchived = false, @JsonKey(name: 'movement_type', fromJson: stringToMovementTypeEnum, toJson: movementTypeEnumToString) required this.movementType, required this.quantity, required this.timestamp, this.user, @JsonKey(name: 'product_name') this.productName});
  factory _StockMovement.fromJson(Map<String, dynamic> json) => _$StockMovementFromJson(json);

@override final  int id;
@override final  int product;
@override final  int warehouse;
@override@JsonKey(name: 'stock_applied') final  bool stockApplied;
@override final  int? batch;
@override@JsonKey(name: 'is_archived') final  bool isArchived;
@override@JsonKey(name: 'movement_type', fromJson: stringToMovementTypeEnum, toJson: movementTypeEnumToString) final  MovementTypeEnum movementType;
@override final  int quantity;
@override final  DateTime timestamp;
@override final  int? user;
@override@JsonKey(name: 'product_name') final  String? productName;

/// Create a copy of StockMovement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockMovementCopyWith<_StockMovement> get copyWith => __$StockMovementCopyWithImpl<_StockMovement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockMovementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockMovement&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.warehouse, warehouse) || other.warehouse == warehouse)&&(identical(other.stockApplied, stockApplied) || other.stockApplied == stockApplied)&&(identical(other.batch, batch) || other.batch == batch)&&(identical(other.isArchived, isArchived) || other.isArchived == isArchived)&&(identical(other.movementType, movementType) || other.movementType == movementType)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.user, user) || other.user == user)&&(identical(other.productName, productName) || other.productName == productName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,warehouse,stockApplied,batch,isArchived,movementType,quantity,timestamp,user,productName);

@override
String toString() {
  return 'StockMovement(id: $id, product: $product, warehouse: $warehouse, stockApplied: $stockApplied, batch: $batch, isArchived: $isArchived, movementType: $movementType, quantity: $quantity, timestamp: $timestamp, user: $user, productName: $productName)';
}


}

/// @nodoc
abstract mixin class _$StockMovementCopyWith<$Res> implements $StockMovementCopyWith<$Res> {
  factory _$StockMovementCopyWith(_StockMovement value, $Res Function(_StockMovement) _then) = __$StockMovementCopyWithImpl;
@override @useResult
$Res call({
 int id, int product, int warehouse,@JsonKey(name: 'stock_applied') bool stockApplied, int? batch,@JsonKey(name: 'is_archived') bool isArchived,@JsonKey(name: 'movement_type', fromJson: stringToMovementTypeEnum, toJson: movementTypeEnumToString) MovementTypeEnum movementType, int quantity, DateTime timestamp, int? user,@JsonKey(name: 'product_name') String? productName
});




}
/// @nodoc
class __$StockMovementCopyWithImpl<$Res>
    implements _$StockMovementCopyWith<$Res> {
  __$StockMovementCopyWithImpl(this._self, this._then);

  final _StockMovement _self;
  final $Res Function(_StockMovement) _then;

/// Create a copy of StockMovement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? product = null,Object? warehouse = null,Object? stockApplied = null,Object? batch = freezed,Object? isArchived = null,Object? movementType = null,Object? quantity = null,Object? timestamp = null,Object? user = freezed,Object? productName = freezed,}) {
  return _then(_StockMovement(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as int,warehouse: null == warehouse ? _self.warehouse : warehouse // ignore: cast_nullable_to_non_nullable
as int,stockApplied: null == stockApplied ? _self.stockApplied : stockApplied // ignore: cast_nullable_to_non_nullable
as bool,batch: freezed == batch ? _self.batch : batch // ignore: cast_nullable_to_non_nullable
as int?,isArchived: null == isArchived ? _self.isArchived : isArchived // ignore: cast_nullable_to_non_nullable
as bool,movementType: null == movementType ? _self.movementType : movementType // ignore: cast_nullable_to_non_nullable
as MovementTypeEnum,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as int?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
