// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_stock_level.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatchedStockLevel {

 int? get id;@JsonKey(name: 'product_id') int? get productId; int? get quantity; int? get threshold;
/// Create a copy of PatchedStockLevel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatchedStockLevelCopyWith<PatchedStockLevel> get copyWith => _$PatchedStockLevelCopyWithImpl<PatchedStockLevel>(this as PatchedStockLevel, _$identity);

  /// Serializes this PatchedStockLevel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatchedStockLevel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.threshold, threshold) || other.threshold == threshold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,quantity,threshold);

@override
String toString() {
  return 'PatchedStockLevel(id: $id, productId: $productId, quantity: $quantity, threshold: $threshold)';
}


}

/// @nodoc
abstract mixin class $PatchedStockLevelCopyWith<$Res>  {
  factory $PatchedStockLevelCopyWith(PatchedStockLevel value, $Res Function(PatchedStockLevel) _then) = _$PatchedStockLevelCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'product_id') int? productId, int? quantity, int? threshold
});




}
/// @nodoc
class _$PatchedStockLevelCopyWithImpl<$Res>
    implements $PatchedStockLevelCopyWith<$Res> {
  _$PatchedStockLevelCopyWithImpl(this._self, this._then);

  final PatchedStockLevel _self;
  final $Res Function(PatchedStockLevel) _then;

/// Create a copy of PatchedStockLevel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? productId = freezed,Object? quantity = freezed,Object? threshold = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,threshold: freezed == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PatchedStockLevel].
extension PatchedStockLevelPatterns on PatchedStockLevel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatchedStockLevel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatchedStockLevel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatchedStockLevel value)  $default,){
final _that = this;
switch (_that) {
case _PatchedStockLevel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatchedStockLevel value)?  $default,){
final _that = this;
switch (_that) {
case _PatchedStockLevel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'product_id')  int? productId,  int? quantity,  int? threshold)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatchedStockLevel() when $default != null:
return $default(_that.id,_that.productId,_that.quantity,_that.threshold);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'product_id')  int? productId,  int? quantity,  int? threshold)  $default,) {final _that = this;
switch (_that) {
case _PatchedStockLevel():
return $default(_that.id,_that.productId,_that.quantity,_that.threshold);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'product_id')  int? productId,  int? quantity,  int? threshold)?  $default,) {final _that = this;
switch (_that) {
case _PatchedStockLevel() when $default != null:
return $default(_that.id,_that.productId,_that.quantity,_that.threshold);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatchedStockLevel implements PatchedStockLevel {
  const _PatchedStockLevel({this.id, @JsonKey(name: 'product_id') this.productId, this.quantity, this.threshold});
  factory _PatchedStockLevel.fromJson(Map<String, dynamic> json) => _$PatchedStockLevelFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'product_id') final  int? productId;
@override final  int? quantity;
@override final  int? threshold;

/// Create a copy of PatchedStockLevel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatchedStockLevelCopyWith<_PatchedStockLevel> get copyWith => __$PatchedStockLevelCopyWithImpl<_PatchedStockLevel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatchedStockLevelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatchedStockLevel&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.threshold, threshold) || other.threshold == threshold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,productId,quantity,threshold);

@override
String toString() {
  return 'PatchedStockLevel(id: $id, productId: $productId, quantity: $quantity, threshold: $threshold)';
}


}

/// @nodoc
abstract mixin class _$PatchedStockLevelCopyWith<$Res> implements $PatchedStockLevelCopyWith<$Res> {
  factory _$PatchedStockLevelCopyWith(_PatchedStockLevel value, $Res Function(_PatchedStockLevel) _then) = __$PatchedStockLevelCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'product_id') int? productId, int? quantity, int? threshold
});




}
/// @nodoc
class __$PatchedStockLevelCopyWithImpl<$Res>
    implements _$PatchedStockLevelCopyWith<$Res> {
  __$PatchedStockLevelCopyWithImpl(this._self, this._then);

  final _PatchedStockLevel _self;
  final $Res Function(_PatchedStockLevel) _then;

/// Create a copy of PatchedStockLevel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? productId = freezed,Object? quantity = freezed,Object? threshold = freezed,}) {
  return _then(_PatchedStockLevel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,threshold: freezed == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
