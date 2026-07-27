// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StockAlert {

 int get id; Product get product; int get threshold;@JsonKey(name: 'is_active') bool? get isActive; Warehouse? get warehouse;
/// Create a copy of StockAlert
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StockAlertCopyWith<StockAlert> get copyWith => _$StockAlertCopyWithImpl<StockAlert>(this as StockAlert, _$identity);

  /// Serializes this StockAlert to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StockAlert&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.threshold, threshold) || other.threshold == threshold)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.warehouse, warehouse) || other.warehouse == warehouse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,threshold,isActive,warehouse);

@override
String toString() {
  return 'StockAlert(id: $id, product: $product, threshold: $threshold, isActive: $isActive, warehouse: $warehouse)';
}


}

/// @nodoc
abstract mixin class $StockAlertCopyWith<$Res>  {
  factory $StockAlertCopyWith(StockAlert value, $Res Function(StockAlert) _then) = _$StockAlertCopyWithImpl;
@useResult
$Res call({
 int id, Product product, int threshold,@JsonKey(name: 'is_active') bool? isActive, Warehouse? warehouse
});


$ProductCopyWith<$Res> get product;$WarehouseCopyWith<$Res>? get warehouse;

}
/// @nodoc
class _$StockAlertCopyWithImpl<$Res>
    implements $StockAlertCopyWith<$Res> {
  _$StockAlertCopyWithImpl(this._self, this._then);

  final StockAlert _self;
  final $Res Function(StockAlert) _then;

/// Create a copy of StockAlert
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? product = null,Object? threshold = null,Object? isActive = freezed,Object? warehouse = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product,threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as int,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,warehouse: freezed == warehouse ? _self.warehouse : warehouse // ignore: cast_nullable_to_non_nullable
as Warehouse?,
  ));
}
/// Create a copy of StockAlert
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCopyWith<$Res> get product {
  
  return $ProductCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}/// Create a copy of StockAlert
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WarehouseCopyWith<$Res>? get warehouse {
    if (_self.warehouse == null) {
    return null;
  }

  return $WarehouseCopyWith<$Res>(_self.warehouse!, (value) {
    return _then(_self.copyWith(warehouse: value));
  });
}
}


/// Adds pattern-matching-related methods to [StockAlert].
extension StockAlertPatterns on StockAlert {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StockAlert value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StockAlert() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StockAlert value)  $default,){
final _that = this;
switch (_that) {
case _StockAlert():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StockAlert value)?  $default,){
final _that = this;
switch (_that) {
case _StockAlert() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  Product product,  int threshold, @JsonKey(name: 'is_active')  bool? isActive,  Warehouse? warehouse)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StockAlert() when $default != null:
return $default(_that.id,_that.product,_that.threshold,_that.isActive,_that.warehouse);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  Product product,  int threshold, @JsonKey(name: 'is_active')  bool? isActive,  Warehouse? warehouse)  $default,) {final _that = this;
switch (_that) {
case _StockAlert():
return $default(_that.id,_that.product,_that.threshold,_that.isActive,_that.warehouse);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  Product product,  int threshold, @JsonKey(name: 'is_active')  bool? isActive,  Warehouse? warehouse)?  $default,) {final _that = this;
switch (_that) {
case _StockAlert() when $default != null:
return $default(_that.id,_that.product,_that.threshold,_that.isActive,_that.warehouse);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StockAlert implements StockAlert {
  const _StockAlert({required this.id, required this.product, required this.threshold, @JsonKey(name: 'is_active') this.isActive, this.warehouse});
  factory _StockAlert.fromJson(Map<String, dynamic> json) => _$StockAlertFromJson(json);

@override final  int id;
@override final  Product product;
@override final  int threshold;
@override@JsonKey(name: 'is_active') final  bool? isActive;
@override final  Warehouse? warehouse;

/// Create a copy of StockAlert
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StockAlertCopyWith<_StockAlert> get copyWith => __$StockAlertCopyWithImpl<_StockAlert>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StockAlertToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StockAlert&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.threshold, threshold) || other.threshold == threshold)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.warehouse, warehouse) || other.warehouse == warehouse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,threshold,isActive,warehouse);

@override
String toString() {
  return 'StockAlert(id: $id, product: $product, threshold: $threshold, isActive: $isActive, warehouse: $warehouse)';
}


}

/// @nodoc
abstract mixin class _$StockAlertCopyWith<$Res> implements $StockAlertCopyWith<$Res> {
  factory _$StockAlertCopyWith(_StockAlert value, $Res Function(_StockAlert) _then) = __$StockAlertCopyWithImpl;
@override @useResult
$Res call({
 int id, Product product, int threshold,@JsonKey(name: 'is_active') bool? isActive, Warehouse? warehouse
});


@override $ProductCopyWith<$Res> get product;@override $WarehouseCopyWith<$Res>? get warehouse;

}
/// @nodoc
class __$StockAlertCopyWithImpl<$Res>
    implements _$StockAlertCopyWith<$Res> {
  __$StockAlertCopyWithImpl(this._self, this._then);

  final _StockAlert _self;
  final $Res Function(_StockAlert) _then;

/// Create a copy of StockAlert
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? product = null,Object? threshold = null,Object? isActive = freezed,Object? warehouse = freezed,}) {
  return _then(_StockAlert(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product,threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as int,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,warehouse: freezed == warehouse ? _self.warehouse : warehouse // ignore: cast_nullable_to_non_nullable
as Warehouse?,
  ));
}

/// Create a copy of StockAlert
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCopyWith<$Res> get product {
  
  return $ProductCopyWith<$Res>(_self.product, (value) {
    return _then(_self.copyWith(product: value));
  });
}/// Create a copy of StockAlert
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WarehouseCopyWith<$Res>? get warehouse {
    if (_self.warehouse == null) {
    return null;
  }

  return $WarehouseCopyWith<$Res>(_self.warehouse!, (value) {
    return _then(_self.copyWith(warehouse: value));
  });
}
}

// dart format on
