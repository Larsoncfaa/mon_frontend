// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_proof.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatchedProof {

 int? get id; int? get delivery; String? get image;@JsonKey(name: 'uploaded_at') DateTime? get uploadedAt;
/// Create a copy of PatchedProof
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatchedProofCopyWith<PatchedProof> get copyWith => _$PatchedProofCopyWithImpl<PatchedProof>(this as PatchedProof, _$identity);

  /// Serializes this PatchedProof to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatchedProof&&(identical(other.id, id) || other.id == id)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.image, image) || other.image == image)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,delivery,image,uploadedAt);

@override
String toString() {
  return 'PatchedProof(id: $id, delivery: $delivery, image: $image, uploadedAt: $uploadedAt)';
}


}

/// @nodoc
abstract mixin class $PatchedProofCopyWith<$Res>  {
  factory $PatchedProofCopyWith(PatchedProof value, $Res Function(PatchedProof) _then) = _$PatchedProofCopyWithImpl;
@useResult
$Res call({
 int? id, int? delivery, String? image,@JsonKey(name: 'uploaded_at') DateTime? uploadedAt
});




}
/// @nodoc
class _$PatchedProofCopyWithImpl<$Res>
    implements $PatchedProofCopyWith<$Res> {
  _$PatchedProofCopyWithImpl(this._self, this._then);

  final PatchedProof _self;
  final $Res Function(PatchedProof) _then;

/// Create a copy of PatchedProof
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? delivery = freezed,Object? image = freezed,Object? uploadedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,delivery: freezed == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as int?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,uploadedAt: freezed == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PatchedProof].
extension PatchedProofPatterns on PatchedProof {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatchedProof value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatchedProof() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatchedProof value)  $default,){
final _that = this;
switch (_that) {
case _PatchedProof():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatchedProof value)?  $default,){
final _that = this;
switch (_that) {
case _PatchedProof() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? delivery,  String? image, @JsonKey(name: 'uploaded_at')  DateTime? uploadedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatchedProof() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? delivery,  String? image, @JsonKey(name: 'uploaded_at')  DateTime? uploadedAt)  $default,) {final _that = this;
switch (_that) {
case _PatchedProof():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? delivery,  String? image, @JsonKey(name: 'uploaded_at')  DateTime? uploadedAt)?  $default,) {final _that = this;
switch (_that) {
case _PatchedProof() when $default != null:
return $default(_that.id,_that.delivery,_that.image,_that.uploadedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatchedProof implements PatchedProof {
  const _PatchedProof({this.id, this.delivery, this.image, @JsonKey(name: 'uploaded_at') this.uploadedAt});
  factory _PatchedProof.fromJson(Map<String, dynamic> json) => _$PatchedProofFromJson(json);

@override final  int? id;
@override final  int? delivery;
@override final  String? image;
@override@JsonKey(name: 'uploaded_at') final  DateTime? uploadedAt;

/// Create a copy of PatchedProof
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatchedProofCopyWith<_PatchedProof> get copyWith => __$PatchedProofCopyWithImpl<_PatchedProof>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatchedProofToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatchedProof&&(identical(other.id, id) || other.id == id)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.image, image) || other.image == image)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,delivery,image,uploadedAt);

@override
String toString() {
  return 'PatchedProof(id: $id, delivery: $delivery, image: $image, uploadedAt: $uploadedAt)';
}


}

/// @nodoc
abstract mixin class _$PatchedProofCopyWith<$Res> implements $PatchedProofCopyWith<$Res> {
  factory _$PatchedProofCopyWith(_PatchedProof value, $Res Function(_PatchedProof) _then) = __$PatchedProofCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? delivery, String? image,@JsonKey(name: 'uploaded_at') DateTime? uploadedAt
});




}
/// @nodoc
class __$PatchedProofCopyWithImpl<$Res>
    implements _$PatchedProofCopyWith<$Res> {
  __$PatchedProofCopyWithImpl(this._self, this._then);

  final _PatchedProof _self;
  final $Res Function(_PatchedProof) _then;

/// Create a copy of PatchedProof
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? delivery = freezed,Object? image = freezed,Object? uploadedAt = freezed,}) {
  return _then(_PatchedProof(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,delivery: freezed == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as int?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,uploadedAt: freezed == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
