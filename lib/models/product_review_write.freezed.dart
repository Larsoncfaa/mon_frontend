// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_review_write.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductReviewWrite {

 int get product; int get rating; String? get comment; int get client; bool get verifiedPurchase;
/// Create a copy of ProductReviewWrite
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductReviewWriteCopyWith<ProductReviewWrite> get copyWith => _$ProductReviewWriteCopyWithImpl<ProductReviewWrite>(this as ProductReviewWrite, _$identity);

  /// Serializes this ProductReviewWrite to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductReviewWrite&&(identical(other.product, product) || other.product == product)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.client, client) || other.client == client)&&(identical(other.verifiedPurchase, verifiedPurchase) || other.verifiedPurchase == verifiedPurchase));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,product,rating,comment,client,verifiedPurchase);

@override
String toString() {
  return 'ProductReviewWrite(product: $product, rating: $rating, comment: $comment, client: $client, verifiedPurchase: $verifiedPurchase)';
}


}

/// @nodoc
abstract mixin class $ProductReviewWriteCopyWith<$Res>  {
  factory $ProductReviewWriteCopyWith(ProductReviewWrite value, $Res Function(ProductReviewWrite) _then) = _$ProductReviewWriteCopyWithImpl;
@useResult
$Res call({
 int product, int rating, String? comment, int client, bool verifiedPurchase
});




}
/// @nodoc
class _$ProductReviewWriteCopyWithImpl<$Res>
    implements $ProductReviewWriteCopyWith<$Res> {
  _$ProductReviewWriteCopyWithImpl(this._self, this._then);

  final ProductReviewWrite _self;
  final $Res Function(ProductReviewWrite) _then;

/// Create a copy of ProductReviewWrite
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? product = null,Object? rating = null,Object? comment = freezed,Object? client = null,Object? verifiedPurchase = null,}) {
  return _then(_self.copyWith(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as int,verifiedPurchase: null == verifiedPurchase ? _self.verifiedPurchase : verifiedPurchase // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductReviewWrite].
extension ProductReviewWritePatterns on ProductReviewWrite {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductReviewWrite value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductReviewWrite() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductReviewWrite value)  $default,){
final _that = this;
switch (_that) {
case _ProductReviewWrite():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductReviewWrite value)?  $default,){
final _that = this;
switch (_that) {
case _ProductReviewWrite() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int product,  int rating,  String? comment,  int client,  bool verifiedPurchase)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductReviewWrite() when $default != null:
return $default(_that.product,_that.rating,_that.comment,_that.client,_that.verifiedPurchase);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int product,  int rating,  String? comment,  int client,  bool verifiedPurchase)  $default,) {final _that = this;
switch (_that) {
case _ProductReviewWrite():
return $default(_that.product,_that.rating,_that.comment,_that.client,_that.verifiedPurchase);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int product,  int rating,  String? comment,  int client,  bool verifiedPurchase)?  $default,) {final _that = this;
switch (_that) {
case _ProductReviewWrite() when $default != null:
return $default(_that.product,_that.rating,_that.comment,_that.client,_that.verifiedPurchase);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductReviewWrite implements ProductReviewWrite {
  const _ProductReviewWrite({required this.product, required this.rating, this.comment, required this.client, this.verifiedPurchase = false});
  factory _ProductReviewWrite.fromJson(Map<String, dynamic> json) => _$ProductReviewWriteFromJson(json);

@override final  int product;
@override final  int rating;
@override final  String? comment;
@override final  int client;
@override@JsonKey() final  bool verifiedPurchase;

/// Create a copy of ProductReviewWrite
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductReviewWriteCopyWith<_ProductReviewWrite> get copyWith => __$ProductReviewWriteCopyWithImpl<_ProductReviewWrite>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductReviewWriteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductReviewWrite&&(identical(other.product, product) || other.product == product)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.client, client) || other.client == client)&&(identical(other.verifiedPurchase, verifiedPurchase) || other.verifiedPurchase == verifiedPurchase));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,product,rating,comment,client,verifiedPurchase);

@override
String toString() {
  return 'ProductReviewWrite(product: $product, rating: $rating, comment: $comment, client: $client, verifiedPurchase: $verifiedPurchase)';
}


}

/// @nodoc
abstract mixin class _$ProductReviewWriteCopyWith<$Res> implements $ProductReviewWriteCopyWith<$Res> {
  factory _$ProductReviewWriteCopyWith(_ProductReviewWrite value, $Res Function(_ProductReviewWrite) _then) = __$ProductReviewWriteCopyWithImpl;
@override @useResult
$Res call({
 int product, int rating, String? comment, int client, bool verifiedPurchase
});




}
/// @nodoc
class __$ProductReviewWriteCopyWithImpl<$Res>
    implements _$ProductReviewWriteCopyWith<$Res> {
  __$ProductReviewWriteCopyWithImpl(this._self, this._then);

  final _ProductReviewWrite _self;
  final $Res Function(_ProductReviewWrite) _then;

/// Create a copy of ProductReviewWrite
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? product = null,Object? rating = null,Object? comment = freezed,Object? client = null,Object? verifiedPurchase = null,}) {
  return _then(_ProductReviewWrite(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as int,verifiedPurchase: null == verifiedPurchase ? _self.verifiedPurchase : verifiedPurchase // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
