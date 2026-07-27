// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_discount.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductDiscount {

 int get id; int get product;@JsonKey(name: 'discount_percent') double get discountPercent;@JsonKey(name: 'start_date') DateTime get startDate;@JsonKey(name: 'end_date') DateTime get endDate;
/// Create a copy of ProductDiscount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDiscountCopyWith<ProductDiscount> get copyWith => _$ProductDiscountCopyWithImpl<ProductDiscount>(this as ProductDiscount, _$identity);

  /// Serializes this ProductDiscount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDiscount&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,discountPercent,startDate,endDate);

@override
String toString() {
  return 'ProductDiscount(id: $id, product: $product, discountPercent: $discountPercent, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $ProductDiscountCopyWith<$Res>  {
  factory $ProductDiscountCopyWith(ProductDiscount value, $Res Function(ProductDiscount) _then) = _$ProductDiscountCopyWithImpl;
@useResult
$Res call({
 int id, int product,@JsonKey(name: 'discount_percent') double discountPercent,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime endDate
});




}
/// @nodoc
class _$ProductDiscountCopyWithImpl<$Res>
    implements $ProductDiscountCopyWith<$Res> {
  _$ProductDiscountCopyWithImpl(this._self, this._then);

  final ProductDiscount _self;
  final $Res Function(ProductDiscount) _then;

/// Create a copy of ProductDiscount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? product = null,Object? discountPercent = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as int,discountPercent: null == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as double,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductDiscount].
extension ProductDiscountPatterns on ProductDiscount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductDiscount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductDiscount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductDiscount value)  $default,){
final _that = this;
switch (_that) {
case _ProductDiscount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductDiscount value)?  $default,){
final _that = this;
switch (_that) {
case _ProductDiscount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int product, @JsonKey(name: 'discount_percent')  double discountPercent, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductDiscount() when $default != null:
return $default(_that.id,_that.product,_that.discountPercent,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int product, @JsonKey(name: 'discount_percent')  double discountPercent, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate)  $default,) {final _that = this;
switch (_that) {
case _ProductDiscount():
return $default(_that.id,_that.product,_that.discountPercent,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int product, @JsonKey(name: 'discount_percent')  double discountPercent, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate)?  $default,) {final _that = this;
switch (_that) {
case _ProductDiscount() when $default != null:
return $default(_that.id,_that.product,_that.discountPercent,_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductDiscount implements ProductDiscount {
  const _ProductDiscount({required this.id, required this.product, @JsonKey(name: 'discount_percent') required this.discountPercent, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') required this.endDate});
  factory _ProductDiscount.fromJson(Map<String, dynamic> json) => _$ProductDiscountFromJson(json);

@override final  int id;
@override final  int product;
@override@JsonKey(name: 'discount_percent') final  double discountPercent;
@override@JsonKey(name: 'start_date') final  DateTime startDate;
@override@JsonKey(name: 'end_date') final  DateTime endDate;

/// Create a copy of ProductDiscount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDiscountCopyWith<_ProductDiscount> get copyWith => __$ProductDiscountCopyWithImpl<_ProductDiscount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductDiscountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDiscount&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,discountPercent,startDate,endDate);

@override
String toString() {
  return 'ProductDiscount(id: $id, product: $product, discountPercent: $discountPercent, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$ProductDiscountCopyWith<$Res> implements $ProductDiscountCopyWith<$Res> {
  factory _$ProductDiscountCopyWith(_ProductDiscount value, $Res Function(_ProductDiscount) _then) = __$ProductDiscountCopyWithImpl;
@override @useResult
$Res call({
 int id, int product,@JsonKey(name: 'discount_percent') double discountPercent,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime endDate
});




}
/// @nodoc
class __$ProductDiscountCopyWithImpl<$Res>
    implements _$ProductDiscountCopyWith<$Res> {
  __$ProductDiscountCopyWithImpl(this._self, this._then);

  final _ProductDiscount _self;
  final $Res Function(_ProductDiscount) _then;

/// Create a copy of ProductDiscount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? product = null,Object? discountPercent = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_ProductDiscount(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as int,discountPercent: null == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as double,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
