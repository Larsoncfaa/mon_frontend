// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Product {

 int get id; String get category; String? get image; String get name; String? get description;@JsonKey(name: 'quantity_in_stock', includeIfNull: true) int? get quantityInStock;@JsonKey(fromJson: unitFromJson, toJson: unitToJson) UnitEnum get unit;@StringToDoubleConverter() double? get purchasePrice;@StringToDoubleConverter() double? get sellingPrice; DateTime? get expirationDate; String? get qrCodeImage;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.image, image) || other.image == image)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.quantityInStock, quantityInStock) || other.quantityInStock == quantityInStock)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.purchasePrice, purchasePrice) || other.purchasePrice == purchasePrice)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.qrCodeImage, qrCodeImage) || other.qrCodeImage == qrCodeImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,image,name,description,quantityInStock,unit,purchasePrice,sellingPrice,expirationDate,qrCodeImage);

@override
String toString() {
  return 'Product(id: $id, category: $category, image: $image, name: $name, description: $description, quantityInStock: $quantityInStock, unit: $unit, purchasePrice: $purchasePrice, sellingPrice: $sellingPrice, expirationDate: $expirationDate, qrCodeImage: $qrCodeImage)';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
 int id, String category, String? image, String name, String? description,@JsonKey(name: 'quantity_in_stock', includeIfNull: true) int? quantityInStock,@JsonKey(fromJson: unitFromJson, toJson: unitToJson) UnitEnum unit,@StringToDoubleConverter() double? purchasePrice,@StringToDoubleConverter() double? sellingPrice, DateTime? expirationDate, String? qrCodeImage
});




}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? category = null,Object? image = freezed,Object? name = null,Object? description = freezed,Object? quantityInStock = freezed,Object? unit = null,Object? purchasePrice = freezed,Object? sellingPrice = freezed,Object? expirationDate = freezed,Object? qrCodeImage = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,quantityInStock: freezed == quantityInStock ? _self.quantityInStock : quantityInStock // ignore: cast_nullable_to_non_nullable
as int?,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitEnum,purchasePrice: freezed == purchasePrice ? _self.purchasePrice : purchasePrice // ignore: cast_nullable_to_non_nullable
as double?,sellingPrice: freezed == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as double?,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,qrCodeImage: freezed == qrCodeImage ? _self.qrCodeImage : qrCodeImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Product value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Product value)  $default,){
final _that = this;
switch (_that) {
case _Product():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Product value)?  $default,){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String category,  String? image,  String name,  String? description, @JsonKey(name: 'quantity_in_stock', includeIfNull: true)  int? quantityInStock, @JsonKey(fromJson: unitFromJson, toJson: unitToJson)  UnitEnum unit, @StringToDoubleConverter()  double? purchasePrice, @StringToDoubleConverter()  double? sellingPrice,  DateTime? expirationDate,  String? qrCodeImage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.category,_that.image,_that.name,_that.description,_that.quantityInStock,_that.unit,_that.purchasePrice,_that.sellingPrice,_that.expirationDate,_that.qrCodeImage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String category,  String? image,  String name,  String? description, @JsonKey(name: 'quantity_in_stock', includeIfNull: true)  int? quantityInStock, @JsonKey(fromJson: unitFromJson, toJson: unitToJson)  UnitEnum unit, @StringToDoubleConverter()  double? purchasePrice, @StringToDoubleConverter()  double? sellingPrice,  DateTime? expirationDate,  String? qrCodeImage)  $default,) {final _that = this;
switch (_that) {
case _Product():
return $default(_that.id,_that.category,_that.image,_that.name,_that.description,_that.quantityInStock,_that.unit,_that.purchasePrice,_that.sellingPrice,_that.expirationDate,_that.qrCodeImage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String category,  String? image,  String name,  String? description, @JsonKey(name: 'quantity_in_stock', includeIfNull: true)  int? quantityInStock, @JsonKey(fromJson: unitFromJson, toJson: unitToJson)  UnitEnum unit, @StringToDoubleConverter()  double? purchasePrice, @StringToDoubleConverter()  double? sellingPrice,  DateTime? expirationDate,  String? qrCodeImage)?  $default,) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.category,_that.image,_that.name,_that.description,_that.quantityInStock,_that.unit,_that.purchasePrice,_that.sellingPrice,_that.expirationDate,_that.qrCodeImage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Product implements Product {
  const _Product({required this.id, required this.category, this.image, required this.name, this.description, @JsonKey(name: 'quantity_in_stock', includeIfNull: true) this.quantityInStock, @JsonKey(fromJson: unitFromJson, toJson: unitToJson) required this.unit, @StringToDoubleConverter() required this.purchasePrice, @StringToDoubleConverter() required this.sellingPrice, this.expirationDate, this.qrCodeImage});
  factory _Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

@override final  int id;
@override final  String category;
@override final  String? image;
@override final  String name;
@override final  String? description;
@override@JsonKey(name: 'quantity_in_stock', includeIfNull: true) final  int? quantityInStock;
@override@JsonKey(fromJson: unitFromJson, toJson: unitToJson) final  UnitEnum unit;
@override@StringToDoubleConverter() final  double? purchasePrice;
@override@StringToDoubleConverter() final  double? sellingPrice;
@override final  DateTime? expirationDate;
@override final  String? qrCodeImage;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCopyWith<_Product> get copyWith => __$ProductCopyWithImpl<_Product>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.image, image) || other.image == image)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.quantityInStock, quantityInStock) || other.quantityInStock == quantityInStock)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.purchasePrice, purchasePrice) || other.purchasePrice == purchasePrice)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.qrCodeImage, qrCodeImage) || other.qrCodeImage == qrCodeImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,image,name,description,quantityInStock,unit,purchasePrice,sellingPrice,expirationDate,qrCodeImage);

@override
String toString() {
  return 'Product(id: $id, category: $category, image: $image, name: $name, description: $description, quantityInStock: $quantityInStock, unit: $unit, purchasePrice: $purchasePrice, sellingPrice: $sellingPrice, expirationDate: $expirationDate, qrCodeImage: $qrCodeImage)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
 int id, String category, String? image, String name, String? description,@JsonKey(name: 'quantity_in_stock', includeIfNull: true) int? quantityInStock,@JsonKey(fromJson: unitFromJson, toJson: unitToJson) UnitEnum unit,@StringToDoubleConverter() double? purchasePrice,@StringToDoubleConverter() double? sellingPrice, DateTime? expirationDate, String? qrCodeImage
});




}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? category = null,Object? image = freezed,Object? name = null,Object? description = freezed,Object? quantityInStock = freezed,Object? unit = null,Object? purchasePrice = freezed,Object? sellingPrice = freezed,Object? expirationDate = freezed,Object? qrCodeImage = freezed,}) {
  return _then(_Product(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,quantityInStock: freezed == quantityInStock ? _self.quantityInStock : quantityInStock // ignore: cast_nullable_to_non_nullable
as int?,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitEnum,purchasePrice: freezed == purchasePrice ? _self.purchasePrice : purchasePrice // ignore: cast_nullable_to_non_nullable
as double?,sellingPrice: freezed == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as double?,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,qrCodeImage: freezed == qrCodeImage ? _self.qrCodeImage : qrCodeImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
