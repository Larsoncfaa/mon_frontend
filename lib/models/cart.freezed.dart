// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Cart {

 int get id; List<CartItem> get items;@JsonKey(name: 'total_price') double get totalPrice;@JsonKey(name: 'item_count') int get itemCount;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartCopyWith<Cart> get copyWith => _$CartCopyWithImpl<Cart>(this as Cart, _$identity);

  /// Serializes this Cart to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cart&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(items),totalPrice,itemCount,createdAt,updatedAt);

@override
String toString() {
  return 'Cart(id: $id, items: $items, totalPrice: $totalPrice, itemCount: $itemCount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CartCopyWith<$Res>  {
  factory $CartCopyWith(Cart value, $Res Function(Cart) _then) = _$CartCopyWithImpl;
@useResult
$Res call({
 int id, List<CartItem> items,@JsonKey(name: 'total_price') double totalPrice,@JsonKey(name: 'item_count') int itemCount,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$CartCopyWithImpl<$Res>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._self, this._then);

  final Cart _self;
  final $Res Function(Cart) _then;

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? items = null,Object? totalPrice = null,Object? itemCount = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CartItem>,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Cart].
extension CartPatterns on Cart {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Cart value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Cart() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Cart value)  $default,){
final _that = this;
switch (_that) {
case _Cart():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Cart value)?  $default,){
final _that = this;
switch (_that) {
case _Cart() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  List<CartItem> items, @JsonKey(name: 'total_price')  double totalPrice, @JsonKey(name: 'item_count')  int itemCount, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Cart() when $default != null:
return $default(_that.id,_that.items,_that.totalPrice,_that.itemCount,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  List<CartItem> items, @JsonKey(name: 'total_price')  double totalPrice, @JsonKey(name: 'item_count')  int itemCount, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Cart():
return $default(_that.id,_that.items,_that.totalPrice,_that.itemCount,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  List<CartItem> items, @JsonKey(name: 'total_price')  double totalPrice, @JsonKey(name: 'item_count')  int itemCount, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Cart() when $default != null:
return $default(_that.id,_that.items,_that.totalPrice,_that.itemCount,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Cart implements Cart {
  const _Cart({required this.id, required final  List<CartItem> items, @JsonKey(name: 'total_price') required this.totalPrice, @JsonKey(name: 'item_count') required this.itemCount, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt}): _items = items;
  factory _Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

@override final  int id;
 final  List<CartItem> _items;
@override List<CartItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey(name: 'total_price') final  double totalPrice;
@override@JsonKey(name: 'item_count') final  int itemCount;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartCopyWith<_Cart> get copyWith => __$CartCopyWithImpl<_Cart>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cart&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_items),totalPrice,itemCount,createdAt,updatedAt);

@override
String toString() {
  return 'Cart(id: $id, items: $items, totalPrice: $totalPrice, itemCount: $itemCount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CartCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$CartCopyWith(_Cart value, $Res Function(_Cart) _then) = __$CartCopyWithImpl;
@override @useResult
$Res call({
 int id, List<CartItem> items,@JsonKey(name: 'total_price') double totalPrice,@JsonKey(name: 'item_count') int itemCount,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$CartCopyWithImpl<$Res>
    implements _$CartCopyWith<$Res> {
  __$CartCopyWithImpl(this._self, this._then);

  final _Cart _self;
  final $Res Function(_Cart) _then;

/// Create a copy of Cart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? items = null,Object? totalPrice = null,Object? itemCount = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Cart(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CartItem>,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
