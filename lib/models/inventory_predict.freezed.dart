// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_predict.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InventoryPredict {

@JsonKey(name: 'product_id') int get productId; int get days;@JsonKey(name: 'predicted_inventory') double get predictedInventory;
/// Create a copy of InventoryPredict
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryPredictCopyWith<InventoryPredict> get copyWith => _$InventoryPredictCopyWithImpl<InventoryPredict>(this as InventoryPredict, _$identity);

  /// Serializes this InventoryPredict to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryPredict&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.days, days) || other.days == days)&&(identical(other.predictedInventory, predictedInventory) || other.predictedInventory == predictedInventory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,days,predictedInventory);

@override
String toString() {
  return 'InventoryPredict(productId: $productId, days: $days, predictedInventory: $predictedInventory)';
}


}

/// @nodoc
abstract mixin class $InventoryPredictCopyWith<$Res>  {
  factory $InventoryPredictCopyWith(InventoryPredict value, $Res Function(InventoryPredict) _then) = _$InventoryPredictCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'product_id') int productId, int days,@JsonKey(name: 'predicted_inventory') double predictedInventory
});




}
/// @nodoc
class _$InventoryPredictCopyWithImpl<$Res>
    implements $InventoryPredictCopyWith<$Res> {
  _$InventoryPredictCopyWithImpl(this._self, this._then);

  final InventoryPredict _self;
  final $Res Function(InventoryPredict) _then;

/// Create a copy of InventoryPredict
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? days = null,Object? predictedInventory = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as int,predictedInventory: null == predictedInventory ? _self.predictedInventory : predictedInventory // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [InventoryPredict].
extension InventoryPredictPatterns on InventoryPredict {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InventoryPredict value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InventoryPredict() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InventoryPredict value)  $default,){
final _that = this;
switch (_that) {
case _InventoryPredict():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InventoryPredict value)?  $default,){
final _that = this;
switch (_that) {
case _InventoryPredict() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id')  int productId,  int days, @JsonKey(name: 'predicted_inventory')  double predictedInventory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InventoryPredict() when $default != null:
return $default(_that.productId,_that.days,_that.predictedInventory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id')  int productId,  int days, @JsonKey(name: 'predicted_inventory')  double predictedInventory)  $default,) {final _that = this;
switch (_that) {
case _InventoryPredict():
return $default(_that.productId,_that.days,_that.predictedInventory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'product_id')  int productId,  int days, @JsonKey(name: 'predicted_inventory')  double predictedInventory)?  $default,) {final _that = this;
switch (_that) {
case _InventoryPredict() when $default != null:
return $default(_that.productId,_that.days,_that.predictedInventory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InventoryPredict implements InventoryPredict {
  const _InventoryPredict({@JsonKey(name: 'product_id') required this.productId, required this.days, @JsonKey(name: 'predicted_inventory') required this.predictedInventory});
  factory _InventoryPredict.fromJson(Map<String, dynamic> json) => _$InventoryPredictFromJson(json);

@override@JsonKey(name: 'product_id') final  int productId;
@override final  int days;
@override@JsonKey(name: 'predicted_inventory') final  double predictedInventory;

/// Create a copy of InventoryPredict
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventoryPredictCopyWith<_InventoryPredict> get copyWith => __$InventoryPredictCopyWithImpl<_InventoryPredict>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InventoryPredictToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InventoryPredict&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.days, days) || other.days == days)&&(identical(other.predictedInventory, predictedInventory) || other.predictedInventory == predictedInventory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,days,predictedInventory);

@override
String toString() {
  return 'InventoryPredict(productId: $productId, days: $days, predictedInventory: $predictedInventory)';
}


}

/// @nodoc
abstract mixin class _$InventoryPredictCopyWith<$Res> implements $InventoryPredictCopyWith<$Res> {
  factory _$InventoryPredictCopyWith(_InventoryPredict value, $Res Function(_InventoryPredict) _then) = __$InventoryPredictCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'product_id') int productId, int days,@JsonKey(name: 'predicted_inventory') double predictedInventory
});




}
/// @nodoc
class __$InventoryPredictCopyWithImpl<$Res>
    implements _$InventoryPredictCopyWith<$Res> {
  __$InventoryPredictCopyWithImpl(this._self, this._then);

  final _InventoryPredict _self;
  final $Res Function(_InventoryPredict) _then;

/// Create a copy of InventoryPredict
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? days = null,Object? predictedInventory = null,}) {
  return _then(_InventoryPredict(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as int,predictedInventory: null == predictedInventory ? _self.predictedInventory : predictedInventory // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
