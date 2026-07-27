// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductReview {

 int get id; int get product; int get client; int get rating; String? get comment;@JsonKey(name: 'created_at') DateTime get createdAt; bool get verifiedPurchase;
/// Create a copy of ProductReview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductReviewCopyWith<ProductReview> get copyWith => _$ProductReviewCopyWithImpl<ProductReview>(this as ProductReview, _$identity);

  /// Serializes this ProductReview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductReview&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.client, client) || other.client == client)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.verifiedPurchase, verifiedPurchase) || other.verifiedPurchase == verifiedPurchase));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,client,rating,comment,createdAt,verifiedPurchase);

@override
String toString() {
  return 'ProductReview(id: $id, product: $product, client: $client, rating: $rating, comment: $comment, createdAt: $createdAt, verifiedPurchase: $verifiedPurchase)';
}


}

/// @nodoc
abstract mixin class $ProductReviewCopyWith<$Res>  {
  factory $ProductReviewCopyWith(ProductReview value, $Res Function(ProductReview) _then) = _$ProductReviewCopyWithImpl;
@useResult
$Res call({
 int id, int product, int client, int rating, String? comment,@JsonKey(name: 'created_at') DateTime createdAt, bool verifiedPurchase
});




}
/// @nodoc
class _$ProductReviewCopyWithImpl<$Res>
    implements $ProductReviewCopyWith<$Res> {
  _$ProductReviewCopyWithImpl(this._self, this._then);

  final ProductReview _self;
  final $Res Function(ProductReview) _then;

/// Create a copy of ProductReview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? product = null,Object? client = null,Object? rating = null,Object? comment = freezed,Object? createdAt = null,Object? verifiedPurchase = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as int,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,verifiedPurchase: null == verifiedPurchase ? _self.verifiedPurchase : verifiedPurchase // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductReview].
extension ProductReviewPatterns on ProductReview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductReview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductReview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductReview value)  $default,){
final _that = this;
switch (_that) {
case _ProductReview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductReview value)?  $default,){
final _that = this;
switch (_that) {
case _ProductReview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int product,  int client,  int rating,  String? comment, @JsonKey(name: 'created_at')  DateTime createdAt,  bool verifiedPurchase)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductReview() when $default != null:
return $default(_that.id,_that.product,_that.client,_that.rating,_that.comment,_that.createdAt,_that.verifiedPurchase);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int product,  int client,  int rating,  String? comment, @JsonKey(name: 'created_at')  DateTime createdAt,  bool verifiedPurchase)  $default,) {final _that = this;
switch (_that) {
case _ProductReview():
return $default(_that.id,_that.product,_that.client,_that.rating,_that.comment,_that.createdAt,_that.verifiedPurchase);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int product,  int client,  int rating,  String? comment, @JsonKey(name: 'created_at')  DateTime createdAt,  bool verifiedPurchase)?  $default,) {final _that = this;
switch (_that) {
case _ProductReview() when $default != null:
return $default(_that.id,_that.product,_that.client,_that.rating,_that.comment,_that.createdAt,_that.verifiedPurchase);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductReview implements ProductReview {
  const _ProductReview({required this.id, required this.product, required this.client, required this.rating, this.comment, @JsonKey(name: 'created_at') required this.createdAt, this.verifiedPurchase = false});
  factory _ProductReview.fromJson(Map<String, dynamic> json) => _$ProductReviewFromJson(json);

@override final  int id;
@override final  int product;
@override final  int client;
@override final  int rating;
@override final  String? comment;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey() final  bool verifiedPurchase;

/// Create a copy of ProductReview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductReviewCopyWith<_ProductReview> get copyWith => __$ProductReviewCopyWithImpl<_ProductReview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductReviewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductReview&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.client, client) || other.client == client)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.verifiedPurchase, verifiedPurchase) || other.verifiedPurchase == verifiedPurchase));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,client,rating,comment,createdAt,verifiedPurchase);

@override
String toString() {
  return 'ProductReview(id: $id, product: $product, client: $client, rating: $rating, comment: $comment, createdAt: $createdAt, verifiedPurchase: $verifiedPurchase)';
}


}

/// @nodoc
abstract mixin class _$ProductReviewCopyWith<$Res> implements $ProductReviewCopyWith<$Res> {
  factory _$ProductReviewCopyWith(_ProductReview value, $Res Function(_ProductReview) _then) = __$ProductReviewCopyWithImpl;
@override @useResult
$Res call({
 int id, int product, int client, int rating, String? comment,@JsonKey(name: 'created_at') DateTime createdAt, bool verifiedPurchase
});




}
/// @nodoc
class __$ProductReviewCopyWithImpl<$Res>
    implements _$ProductReviewCopyWith<$Res> {
  __$ProductReviewCopyWithImpl(this._self, this._then);

  final _ProductReview _self;
  final $Res Function(_ProductReview) _then;

/// Create a copy of ProductReview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? product = null,Object? client = null,Object? rating = null,Object? comment = freezed,Object? createdAt = null,Object? verifiedPurchase = null,}) {
  return _then(_ProductReview(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as int,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,verifiedPurchase: null == verifiedPurchase ? _self.verifiedPurchase : verifiedPurchase // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
