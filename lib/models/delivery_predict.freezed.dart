// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_predict.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeliveryPredict {

@JsonKey(name: 'product_id') int get productId; int get quantity; String get prediction;
/// Create a copy of DeliveryPredict
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryPredictCopyWith<DeliveryPredict> get copyWith => _$DeliveryPredictCopyWithImpl<DeliveryPredict>(this as DeliveryPredict, _$identity);

  /// Serializes this DeliveryPredict to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryPredict&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.prediction, prediction) || other.prediction == prediction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,quantity,prediction);

@override
String toString() {
  return 'DeliveryPredict(productId: $productId, quantity: $quantity, prediction: $prediction)';
}


}

/// @nodoc
abstract mixin class $DeliveryPredictCopyWith<$Res>  {
  factory $DeliveryPredictCopyWith(DeliveryPredict value, $Res Function(DeliveryPredict) _then) = _$DeliveryPredictCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'product_id') int productId, int quantity, String prediction
});




}
/// @nodoc
class _$DeliveryPredictCopyWithImpl<$Res>
    implements $DeliveryPredictCopyWith<$Res> {
  _$DeliveryPredictCopyWithImpl(this._self, this._then);

  final DeliveryPredict _self;
  final $Res Function(DeliveryPredict) _then;

/// Create a copy of DeliveryPredict
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? quantity = null,Object? prediction = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,prediction: null == prediction ? _self.prediction : prediction // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeliveryPredict].
extension DeliveryPredictPatterns on DeliveryPredict {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliveryPredict value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliveryPredict() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliveryPredict value)  $default,){
final _that = this;
switch (_that) {
case _DeliveryPredict():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliveryPredict value)?  $default,){
final _that = this;
switch (_that) {
case _DeliveryPredict() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id')  int productId,  int quantity,  String prediction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliveryPredict() when $default != null:
return $default(_that.productId,_that.quantity,_that.prediction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id')  int productId,  int quantity,  String prediction)  $default,) {final _that = this;
switch (_that) {
case _DeliveryPredict():
return $default(_that.productId,_that.quantity,_that.prediction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'product_id')  int productId,  int quantity,  String prediction)?  $default,) {final _that = this;
switch (_that) {
case _DeliveryPredict() when $default != null:
return $default(_that.productId,_that.quantity,_that.prediction);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeliveryPredict implements DeliveryPredict {
  const _DeliveryPredict({@JsonKey(name: 'product_id') required this.productId, required this.quantity, required this.prediction});
  factory _DeliveryPredict.fromJson(Map<String, dynamic> json) => _$DeliveryPredictFromJson(json);

@override@JsonKey(name: 'product_id') final  int productId;
@override final  int quantity;
@override final  String prediction;

/// Create a copy of DeliveryPredict
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryPredictCopyWith<_DeliveryPredict> get copyWith => __$DeliveryPredictCopyWithImpl<_DeliveryPredict>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryPredictToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryPredict&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.prediction, prediction) || other.prediction == prediction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,quantity,prediction);

@override
String toString() {
  return 'DeliveryPredict(productId: $productId, quantity: $quantity, prediction: $prediction)';
}


}

/// @nodoc
abstract mixin class _$DeliveryPredictCopyWith<$Res> implements $DeliveryPredictCopyWith<$Res> {
  factory _$DeliveryPredictCopyWith(_DeliveryPredict value, $Res Function(_DeliveryPredict) _then) = __$DeliveryPredictCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'product_id') int productId, int quantity, String prediction
});




}
/// @nodoc
class __$DeliveryPredictCopyWithImpl<$Res>
    implements _$DeliveryPredictCopyWith<$Res> {
  __$DeliveryPredictCopyWithImpl(this._self, this._then);

  final _DeliveryPredict _self;
  final $Res Function(_DeliveryPredict) _then;

/// Create a copy of DeliveryPredict
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? quantity = null,Object? prediction = null,}) {
  return _then(_DeliveryPredict(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,prediction: null == prediction ? _self.prediction : prediction // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
