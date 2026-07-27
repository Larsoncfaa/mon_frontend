// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_line_write.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderLineWrite {

 int get product; int get quantity;@JsonKey(name: 'unit_price') double get unitPrice;
/// Create a copy of OrderLineWrite
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderLineWriteCopyWith<OrderLineWrite> get copyWith => _$OrderLineWriteCopyWithImpl<OrderLineWrite>(this as OrderLineWrite, _$identity);

  /// Serializes this OrderLineWrite to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderLineWrite&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,product,quantity,unitPrice);

@override
String toString() {
  return 'OrderLineWrite(product: $product, quantity: $quantity, unitPrice: $unitPrice)';
}


}

/// @nodoc
abstract mixin class $OrderLineWriteCopyWith<$Res>  {
  factory $OrderLineWriteCopyWith(OrderLineWrite value, $Res Function(OrderLineWrite) _then) = _$OrderLineWriteCopyWithImpl;
@useResult
$Res call({
 int product, int quantity,@JsonKey(name: 'unit_price') double unitPrice
});




}
/// @nodoc
class _$OrderLineWriteCopyWithImpl<$Res>
    implements $OrderLineWriteCopyWith<$Res> {
  _$OrderLineWriteCopyWithImpl(this._self, this._then);

  final OrderLineWrite _self;
  final $Res Function(OrderLineWrite) _then;

/// Create a copy of OrderLineWrite
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? product = null,Object? quantity = null,Object? unitPrice = null,}) {
  return _then(_self.copyWith(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderLineWrite].
extension OrderLineWritePatterns on OrderLineWrite {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderLineWrite value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderLineWrite() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderLineWrite value)  $default,){
final _that = this;
switch (_that) {
case _OrderLineWrite():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderLineWrite value)?  $default,){
final _that = this;
switch (_that) {
case _OrderLineWrite() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int product,  int quantity, @JsonKey(name: 'unit_price')  double unitPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderLineWrite() when $default != null:
return $default(_that.product,_that.quantity,_that.unitPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int product,  int quantity, @JsonKey(name: 'unit_price')  double unitPrice)  $default,) {final _that = this;
switch (_that) {
case _OrderLineWrite():
return $default(_that.product,_that.quantity,_that.unitPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int product,  int quantity, @JsonKey(name: 'unit_price')  double unitPrice)?  $default,) {final _that = this;
switch (_that) {
case _OrderLineWrite() when $default != null:
return $default(_that.product,_that.quantity,_that.unitPrice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderLineWrite implements OrderLineWrite {
  const _OrderLineWrite({required this.product, required this.quantity, @JsonKey(name: 'unit_price') required this.unitPrice});
  factory _OrderLineWrite.fromJson(Map<String, dynamic> json) => _$OrderLineWriteFromJson(json);

@override final  int product;
@override final  int quantity;
@override@JsonKey(name: 'unit_price') final  double unitPrice;

/// Create a copy of OrderLineWrite
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderLineWriteCopyWith<_OrderLineWrite> get copyWith => __$OrderLineWriteCopyWithImpl<_OrderLineWrite>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderLineWriteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderLineWrite&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,product,quantity,unitPrice);

@override
String toString() {
  return 'OrderLineWrite(product: $product, quantity: $quantity, unitPrice: $unitPrice)';
}


}

/// @nodoc
abstract mixin class _$OrderLineWriteCopyWith<$Res> implements $OrderLineWriteCopyWith<$Res> {
  factory _$OrderLineWriteCopyWith(_OrderLineWrite value, $Res Function(_OrderLineWrite) _then) = __$OrderLineWriteCopyWithImpl;
@override @useResult
$Res call({
 int product, int quantity,@JsonKey(name: 'unit_price') double unitPrice
});




}
/// @nodoc
class __$OrderLineWriteCopyWithImpl<$Res>
    implements _$OrderLineWriteCopyWith<$Res> {
  __$OrderLineWriteCopyWithImpl(this._self, this._then);

  final _OrderLineWrite _self;
  final $Res Function(_OrderLineWrite) _then;

/// Create a copy of OrderLineWrite
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? product = null,Object? quantity = null,Object? unitPrice = null,}) {
  return _then(_OrderLineWrite(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
