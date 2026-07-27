// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'proof.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Proof {

 int get id; int get delivery; String get image;@JsonKey(name: 'uploaded_at') DateTime get uploadedAt;
/// Create a copy of Proof
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProofCopyWith<Proof> get copyWith => _$ProofCopyWithImpl<Proof>(this as Proof, _$identity);

  /// Serializes this Proof to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Proof&&(identical(other.id, id) || other.id == id)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.image, image) || other.image == image)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,delivery,image,uploadedAt);

@override
String toString() {
  return 'Proof(id: $id, delivery: $delivery, image: $image, uploadedAt: $uploadedAt)';
}


}

/// @nodoc
abstract mixin class $ProofCopyWith<$Res>  {
  factory $ProofCopyWith(Proof value, $Res Function(Proof) _then) = _$ProofCopyWithImpl;
@useResult
$Res call({
 int id, int delivery, String image,@JsonKey(name: 'uploaded_at') DateTime uploadedAt
});




}
/// @nodoc
class _$ProofCopyWithImpl<$Res>
    implements $ProofCopyWith<$Res> {
  _$ProofCopyWithImpl(this._self, this._then);

  final Proof _self;
  final $Res Function(Proof) _then;

/// Create a copy of Proof
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? delivery = null,Object? image = null,Object? uploadedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,delivery: null == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,uploadedAt: null == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Proof].
extension ProofPatterns on Proof {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Proof value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Proof() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Proof value)  $default,){
final _that = this;
switch (_that) {
case _Proof():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Proof value)?  $default,){
final _that = this;
switch (_that) {
case _Proof() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int delivery,  String image, @JsonKey(name: 'uploaded_at')  DateTime uploadedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Proof() when $default != null:
return $default(_that.id,_that.delivery,_that.image,_that.uploadedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int delivery,  String image, @JsonKey(name: 'uploaded_at')  DateTime uploadedAt)  $default,) {final _that = this;
switch (_that) {
case _Proof():
return $default(_that.id,_that.delivery,_that.image,_that.uploadedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int delivery,  String image, @JsonKey(name: 'uploaded_at')  DateTime uploadedAt)?  $default,) {final _that = this;
switch (_that) {
case _Proof() when $default != null:
return $default(_that.id,_that.delivery,_that.image,_that.uploadedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Proof implements Proof {
  const _Proof({required this.id, required this.delivery, required this.image, @JsonKey(name: 'uploaded_at') required this.uploadedAt});
  factory _Proof.fromJson(Map<String, dynamic> json) => _$ProofFromJson(json);

@override final  int id;
@override final  int delivery;
@override final  String image;
@override@JsonKey(name: 'uploaded_at') final  DateTime uploadedAt;

/// Create a copy of Proof
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProofCopyWith<_Proof> get copyWith => __$ProofCopyWithImpl<_Proof>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProofToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Proof&&(identical(other.id, id) || other.id == id)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.image, image) || other.image == image)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,delivery,image,uploadedAt);

@override
String toString() {
  return 'Proof(id: $id, delivery: $delivery, image: $image, uploadedAt: $uploadedAt)';
}


}

/// @nodoc
abstract mixin class _$ProofCopyWith<$Res> implements $ProofCopyWith<$Res> {
  factory _$ProofCopyWith(_Proof value, $Res Function(_Proof) _then) = __$ProofCopyWithImpl;
@override @useResult
$Res call({
 int id, int delivery, String image,@JsonKey(name: 'uploaded_at') DateTime uploadedAt
});




}
/// @nodoc
class __$ProofCopyWithImpl<$Res>
    implements _$ProofCopyWith<$Res> {
  __$ProofCopyWithImpl(this._self, this._then);

  final _Proof _self;
  final $Res Function(_Proof) _then;

/// Create a copy of Proof
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? delivery = null,Object? image = null,Object? uploadedAt = null,}) {
  return _then(_Proof(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,delivery: null == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,uploadedAt: null == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
