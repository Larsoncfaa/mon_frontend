// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'batch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Batch {

 int get id;/// Identifiant du produit (clé JSON = "product", OK en camelCase)
 int get product;/// Numéro de lot (clé JSON = "lot_number" : CHARFIELD dans Django)
@JsonKey(name: 'lot_number') String get lotNumber;/// Date d'expiration (clé JSON = "expiration_date" : DATEFIELD dans Django)
@JsonKey(name: 'expiration_date') DateTime get expirationDate;
/// Create a copy of Batch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BatchCopyWith<Batch> get copyWith => _$BatchCopyWithImpl<Batch>(this as Batch, _$identity);

  /// Serializes this Batch to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Batch&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.lotNumber, lotNumber) || other.lotNumber == lotNumber)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,lotNumber,expirationDate);

@override
String toString() {
  return 'Batch(id: $id, product: $product, lotNumber: $lotNumber, expirationDate: $expirationDate)';
}


}

/// @nodoc
abstract mixin class $BatchCopyWith<$Res>  {
  factory $BatchCopyWith(Batch value, $Res Function(Batch) _then) = _$BatchCopyWithImpl;
@useResult
$Res call({
 int id, int product,@JsonKey(name: 'lot_number') String lotNumber,@JsonKey(name: 'expiration_date') DateTime expirationDate
});




}
/// @nodoc
class _$BatchCopyWithImpl<$Res>
    implements $BatchCopyWith<$Res> {
  _$BatchCopyWithImpl(this._self, this._then);

  final Batch _self;
  final $Res Function(Batch) _then;

/// Create a copy of Batch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? product = null,Object? lotNumber = null,Object? expirationDate = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as int,lotNumber: null == lotNumber ? _self.lotNumber : lotNumber // ignore: cast_nullable_to_non_nullable
as String,expirationDate: null == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Batch].
extension BatchPatterns on Batch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Batch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Batch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Batch value)  $default,){
final _that = this;
switch (_that) {
case _Batch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Batch value)?  $default,){
final _that = this;
switch (_that) {
case _Batch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int product, @JsonKey(name: 'lot_number')  String lotNumber, @JsonKey(name: 'expiration_date')  DateTime expirationDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Batch() when $default != null:
return $default(_that.id,_that.product,_that.lotNumber,_that.expirationDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int product, @JsonKey(name: 'lot_number')  String lotNumber, @JsonKey(name: 'expiration_date')  DateTime expirationDate)  $default,) {final _that = this;
switch (_that) {
case _Batch():
return $default(_that.id,_that.product,_that.lotNumber,_that.expirationDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int product, @JsonKey(name: 'lot_number')  String lotNumber, @JsonKey(name: 'expiration_date')  DateTime expirationDate)?  $default,) {final _that = this;
switch (_that) {
case _Batch() when $default != null:
return $default(_that.id,_that.product,_that.lotNumber,_that.expirationDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Batch implements Batch {
  const _Batch({required this.id, required this.product, @JsonKey(name: 'lot_number') required this.lotNumber, @JsonKey(name: 'expiration_date') required this.expirationDate});
  factory _Batch.fromJson(Map<String, dynamic> json) => _$BatchFromJson(json);

@override final  int id;
/// Identifiant du produit (clé JSON = "product", OK en camelCase)
@override final  int product;
/// Numéro de lot (clé JSON = "lot_number" : CHARFIELD dans Django)
@override@JsonKey(name: 'lot_number') final  String lotNumber;
/// Date d'expiration (clé JSON = "expiration_date" : DATEFIELD dans Django)
@override@JsonKey(name: 'expiration_date') final  DateTime expirationDate;

/// Create a copy of Batch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BatchCopyWith<_Batch> get copyWith => __$BatchCopyWithImpl<_Batch>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BatchToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Batch&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.lotNumber, lotNumber) || other.lotNumber == lotNumber)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,lotNumber,expirationDate);

@override
String toString() {
  return 'Batch(id: $id, product: $product, lotNumber: $lotNumber, expirationDate: $expirationDate)';
}


}

/// @nodoc
abstract mixin class _$BatchCopyWith<$Res> implements $BatchCopyWith<$Res> {
  factory _$BatchCopyWith(_Batch value, $Res Function(_Batch) _then) = __$BatchCopyWithImpl;
@override @useResult
$Res call({
 int id, int product,@JsonKey(name: 'lot_number') String lotNumber,@JsonKey(name: 'expiration_date') DateTime expirationDate
});




}
/// @nodoc
class __$BatchCopyWithImpl<$Res>
    implements _$BatchCopyWith<$Res> {
  __$BatchCopyWithImpl(this._self, this._then);

  final _Batch _self;
  final $Res Function(_Batch) _then;

/// Create a copy of Batch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? product = null,Object? lotNumber = null,Object? expirationDate = null,}) {
  return _then(_Batch(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as int,lotNumber: null == lotNumber ? _self.lotNumber : lotNumber // ignore: cast_nullable_to_non_nullable
as String,expirationDate: null == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
