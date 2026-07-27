// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Selection {

 int get id; int get product; String? get image; int get quantity; String get name;@JsonKey(name: 'selling_price') String get sellingPrice; String? get description;@JsonKey(name: 'expiration_date') DateTime? get expirationDate; String get category;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of Selection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectionCopyWith<Selection> get copyWith => _$SelectionCopyWithImpl<Selection>(this as Selection, _$identity);

  /// Serializes this Selection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Selection&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.image, image) || other.image == image)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.name, name) || other.name == name)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.description, description) || other.description == description)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.category, category) || other.category == category)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,image,quantity,name,sellingPrice,description,expirationDate,category,createdAt);

@override
String toString() {
  return 'Selection(id: $id, product: $product, image: $image, quantity: $quantity, name: $name, sellingPrice: $sellingPrice, description: $description, expirationDate: $expirationDate, category: $category, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SelectionCopyWith<$Res>  {
  factory $SelectionCopyWith(Selection value, $Res Function(Selection) _then) = _$SelectionCopyWithImpl;
@useResult
$Res call({
 int id, int product, String? image, int quantity, String name,@JsonKey(name: 'selling_price') String sellingPrice, String? description,@JsonKey(name: 'expiration_date') DateTime? expirationDate, String category,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$SelectionCopyWithImpl<$Res>
    implements $SelectionCopyWith<$Res> {
  _$SelectionCopyWithImpl(this._self, this._then);

  final Selection _self;
  final $Res Function(Selection) _then;

/// Create a copy of Selection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? product = null,Object? image = freezed,Object? quantity = null,Object? name = null,Object? sellingPrice = null,Object? description = freezed,Object? expirationDate = freezed,Object? category = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as int,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sellingPrice: null == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Selection].
extension SelectionPatterns on Selection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Selection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Selection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Selection value)  $default,){
final _that = this;
switch (_that) {
case _Selection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Selection value)?  $default,){
final _that = this;
switch (_that) {
case _Selection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int product,  String? image,  int quantity,  String name, @JsonKey(name: 'selling_price')  String sellingPrice,  String? description, @JsonKey(name: 'expiration_date')  DateTime? expirationDate,  String category, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Selection() when $default != null:
return $default(_that.id,_that.product,_that.image,_that.quantity,_that.name,_that.sellingPrice,_that.description,_that.expirationDate,_that.category,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int product,  String? image,  int quantity,  String name, @JsonKey(name: 'selling_price')  String sellingPrice,  String? description, @JsonKey(name: 'expiration_date')  DateTime? expirationDate,  String category, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Selection():
return $default(_that.id,_that.product,_that.image,_that.quantity,_that.name,_that.sellingPrice,_that.description,_that.expirationDate,_that.category,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int product,  String? image,  int quantity,  String name, @JsonKey(name: 'selling_price')  String sellingPrice,  String? description, @JsonKey(name: 'expiration_date')  DateTime? expirationDate,  String category, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Selection() when $default != null:
return $default(_that.id,_that.product,_that.image,_that.quantity,_that.name,_that.sellingPrice,_that.description,_that.expirationDate,_that.category,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Selection implements Selection {
  const _Selection({required this.id, required this.product, this.image, required this.quantity, required this.name, @JsonKey(name: 'selling_price') required this.sellingPrice, this.description, @JsonKey(name: 'expiration_date') this.expirationDate, required this.category, @JsonKey(name: 'created_at') this.createdAt});
  factory _Selection.fromJson(Map<String, dynamic> json) => _$SelectionFromJson(json);

@override final  int id;
@override final  int product;
@override final  String? image;
@override final  int quantity;
@override final  String name;
@override@JsonKey(name: 'selling_price') final  String sellingPrice;
@override final  String? description;
@override@JsonKey(name: 'expiration_date') final  DateTime? expirationDate;
@override final  String category;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of Selection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectionCopyWith<_Selection> get copyWith => __$SelectionCopyWithImpl<_Selection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SelectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Selection&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.image, image) || other.image == image)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.name, name) || other.name == name)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.description, description) || other.description == description)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.category, category) || other.category == category)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,image,quantity,name,sellingPrice,description,expirationDate,category,createdAt);

@override
String toString() {
  return 'Selection(id: $id, product: $product, image: $image, quantity: $quantity, name: $name, sellingPrice: $sellingPrice, description: $description, expirationDate: $expirationDate, category: $category, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SelectionCopyWith<$Res> implements $SelectionCopyWith<$Res> {
  factory _$SelectionCopyWith(_Selection value, $Res Function(_Selection) _then) = __$SelectionCopyWithImpl;
@override @useResult
$Res call({
 int id, int product, String? image, int quantity, String name,@JsonKey(name: 'selling_price') String sellingPrice, String? description,@JsonKey(name: 'expiration_date') DateTime? expirationDate, String category,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$SelectionCopyWithImpl<$Res>
    implements _$SelectionCopyWith<$Res> {
  __$SelectionCopyWithImpl(this._self, this._then);

  final _Selection _self;
  final $Res Function(_Selection) _then;

/// Create a copy of Selection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? product = null,Object? image = freezed,Object? quantity = null,Object? name = null,Object? sellingPrice = null,Object? description = freezed,Object? expirationDate = freezed,Object? category = null,Object? createdAt = freezed,}) {
  return _then(_Selection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as int,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sellingPrice: null == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
