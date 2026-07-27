// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_product_discount.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatchedProductDiscount {

 int? get id; int? get product;@JsonKey(name: 'discount_percent') double? get discountPercent;@JsonKey(name: 'start_date') DateTime? get startDate;@JsonKey(name: 'end_date') DateTime? get endDate;
/// Create a copy of PatchedProductDiscount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatchedProductDiscountCopyWith<PatchedProductDiscount> get copyWith => _$PatchedProductDiscountCopyWithImpl<PatchedProductDiscount>(this as PatchedProductDiscount, _$identity);

  /// Serializes this PatchedProductDiscount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatchedProductDiscount&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,discountPercent,startDate,endDate);

@override
String toString() {
  return 'PatchedProductDiscount(id: $id, product: $product, discountPercent: $discountPercent, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $PatchedProductDiscountCopyWith<$Res>  {
  factory $PatchedProductDiscountCopyWith(PatchedProductDiscount value, $Res Function(PatchedProductDiscount) _then) = _$PatchedProductDiscountCopyWithImpl;
@useResult
$Res call({
 int? id, int? product,@JsonKey(name: 'discount_percent') double? discountPercent,@JsonKey(name: 'start_date') DateTime? startDate,@JsonKey(name: 'end_date') DateTime? endDate
});




}
/// @nodoc
class _$PatchedProductDiscountCopyWithImpl<$Res>
    implements $PatchedProductDiscountCopyWith<$Res> {
  _$PatchedProductDiscountCopyWithImpl(this._self, this._then);

  final PatchedProductDiscount _self;
  final $Res Function(PatchedProductDiscount) _then;

/// Create a copy of PatchedProductDiscount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? product = freezed,Object? discountPercent = freezed,Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as int?,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as double?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PatchedProductDiscount].
extension PatchedProductDiscountPatterns on PatchedProductDiscount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatchedProductDiscount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatchedProductDiscount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatchedProductDiscount value)  $default,){
final _that = this;
switch (_that) {
case _PatchedProductDiscount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatchedProductDiscount value)?  $default,){
final _that = this;
switch (_that) {
case _PatchedProductDiscount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? product, @JsonKey(name: 'discount_percent')  double? discountPercent, @JsonKey(name: 'start_date')  DateTime? startDate, @JsonKey(name: 'end_date')  DateTime? endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatchedProductDiscount() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? product, @JsonKey(name: 'discount_percent')  double? discountPercent, @JsonKey(name: 'start_date')  DateTime? startDate, @JsonKey(name: 'end_date')  DateTime? endDate)  $default,) {final _that = this;
switch (_that) {
case _PatchedProductDiscount():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? product, @JsonKey(name: 'discount_percent')  double? discountPercent, @JsonKey(name: 'start_date')  DateTime? startDate, @JsonKey(name: 'end_date')  DateTime? endDate)?  $default,) {final _that = this;
switch (_that) {
case _PatchedProductDiscount() when $default != null:
return $default(_that.id,_that.product,_that.discountPercent,_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatchedProductDiscount implements PatchedProductDiscount {
  const _PatchedProductDiscount({this.id, this.product, @JsonKey(name: 'discount_percent') this.discountPercent, @JsonKey(name: 'start_date') this.startDate, @JsonKey(name: 'end_date') this.endDate});
  factory _PatchedProductDiscount.fromJson(Map<String, dynamic> json) => _$PatchedProductDiscountFromJson(json);

@override final  int? id;
@override final  int? product;
@override@JsonKey(name: 'discount_percent') final  double? discountPercent;
@override@JsonKey(name: 'start_date') final  DateTime? startDate;
@override@JsonKey(name: 'end_date') final  DateTime? endDate;

/// Create a copy of PatchedProductDiscount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatchedProductDiscountCopyWith<_PatchedProductDiscount> get copyWith => __$PatchedProductDiscountCopyWithImpl<_PatchedProductDiscount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatchedProductDiscountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatchedProductDiscount&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,discountPercent,startDate,endDate);

@override
String toString() {
  return 'PatchedProductDiscount(id: $id, product: $product, discountPercent: $discountPercent, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$PatchedProductDiscountCopyWith<$Res> implements $PatchedProductDiscountCopyWith<$Res> {
  factory _$PatchedProductDiscountCopyWith(_PatchedProductDiscount value, $Res Function(_PatchedProductDiscount) _then) = __$PatchedProductDiscountCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? product,@JsonKey(name: 'discount_percent') double? discountPercent,@JsonKey(name: 'start_date') DateTime? startDate,@JsonKey(name: 'end_date') DateTime? endDate
});




}
/// @nodoc
class __$PatchedProductDiscountCopyWithImpl<$Res>
    implements _$PatchedProductDiscountCopyWith<$Res> {
  __$PatchedProductDiscountCopyWithImpl(this._self, this._then);

  final _PatchedProductDiscount _self;
  final $Res Function(_PatchedProductDiscount) _then;

/// Create a copy of PatchedProductDiscount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? product = freezed,Object? discountPercent = freezed,Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_PatchedProductDiscount(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as int?,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as double?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
