// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_order_line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatchedOrderLine {

 int? get id; Product? get product; int? get quantity;@JsonKey(name: 'unit_price') double? get unitPrice;
/// Create a copy of PatchedOrderLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatchedOrderLineCopyWith<PatchedOrderLine> get copyWith => _$PatchedOrderLineCopyWithImpl<PatchedOrderLine>(this as PatchedOrderLine, _$identity);

  /// Serializes this PatchedOrderLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatchedOrderLine&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,quantity,unitPrice);

@override
String toString() {
  return 'PatchedOrderLine(id: $id, product: $product, quantity: $quantity, unitPrice: $unitPrice)';
}


}

/// @nodoc
abstract mixin class $PatchedOrderLineCopyWith<$Res>  {
  factory $PatchedOrderLineCopyWith(PatchedOrderLine value, $Res Function(PatchedOrderLine) _then) = _$PatchedOrderLineCopyWithImpl;
@useResult
$Res call({
 int? id, Product? product, int? quantity,@JsonKey(name: 'unit_price') double? unitPrice
});


$ProductCopyWith<$Res>? get product;

}
/// @nodoc
class _$PatchedOrderLineCopyWithImpl<$Res>
    implements $PatchedOrderLineCopyWith<$Res> {
  _$PatchedOrderLineCopyWithImpl(this._self, this._then);

  final PatchedOrderLine _self;
  final $Res Function(PatchedOrderLine) _then;

/// Create a copy of PatchedOrderLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? product = freezed,Object? quantity = freezed,Object? unitPrice = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of PatchedOrderLine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}


/// Adds pattern-matching-related methods to [PatchedOrderLine].
extension PatchedOrderLinePatterns on PatchedOrderLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatchedOrderLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatchedOrderLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatchedOrderLine value)  $default,){
final _that = this;
switch (_that) {
case _PatchedOrderLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatchedOrderLine value)?  $default,){
final _that = this;
switch (_that) {
case _PatchedOrderLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  Product? product,  int? quantity, @JsonKey(name: 'unit_price')  double? unitPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatchedOrderLine() when $default != null:
return $default(_that.id,_that.product,_that.quantity,_that.unitPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  Product? product,  int? quantity, @JsonKey(name: 'unit_price')  double? unitPrice)  $default,) {final _that = this;
switch (_that) {
case _PatchedOrderLine():
return $default(_that.id,_that.product,_that.quantity,_that.unitPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  Product? product,  int? quantity, @JsonKey(name: 'unit_price')  double? unitPrice)?  $default,) {final _that = this;
switch (_that) {
case _PatchedOrderLine() when $default != null:
return $default(_that.id,_that.product,_that.quantity,_that.unitPrice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatchedOrderLine implements PatchedOrderLine {
  const _PatchedOrderLine({this.id, this.product, this.quantity, @JsonKey(name: 'unit_price') this.unitPrice});
  factory _PatchedOrderLine.fromJson(Map<String, dynamic> json) => _$PatchedOrderLineFromJson(json);

@override final  int? id;
@override final  Product? product;
@override final  int? quantity;
@override@JsonKey(name: 'unit_price') final  double? unitPrice;

/// Create a copy of PatchedOrderLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatchedOrderLineCopyWith<_PatchedOrderLine> get copyWith => __$PatchedOrderLineCopyWithImpl<_PatchedOrderLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatchedOrderLineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatchedOrderLine&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,quantity,unitPrice);

@override
String toString() {
  return 'PatchedOrderLine(id: $id, product: $product, quantity: $quantity, unitPrice: $unitPrice)';
}


}

/// @nodoc
abstract mixin class _$PatchedOrderLineCopyWith<$Res> implements $PatchedOrderLineCopyWith<$Res> {
  factory _$PatchedOrderLineCopyWith(_PatchedOrderLine value, $Res Function(_PatchedOrderLine) _then) = __$PatchedOrderLineCopyWithImpl;
@override @useResult
$Res call({
 int? id, Product? product, int? quantity,@JsonKey(name: 'unit_price') double? unitPrice
});


@override $ProductCopyWith<$Res>? get product;

}
/// @nodoc
class __$PatchedOrderLineCopyWithImpl<$Res>
    implements _$PatchedOrderLineCopyWith<$Res> {
  __$PatchedOrderLineCopyWithImpl(this._self, this._then);

  final _PatchedOrderLine _self;
  final $Res Function(_PatchedOrderLine) _then;

/// Create a copy of PatchedOrderLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? product = freezed,Object? quantity = freezed,Object? unitPrice = freezed,}) {
  return _then(_PatchedOrderLine(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of PatchedOrderLine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCopyWith<$Res>? get product {
    if (_self.product == null) {
    return null;
  }

  return $ProductCopyWith<$Res>(_self.product!, (value) {
    return _then(_self.copyWith(product: value));
  });
}
}

// dart format on
