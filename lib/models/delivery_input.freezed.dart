// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeliveryInput {

@JsonKey(name: 'delivery_id') int get deliveryId;@JsonKey(name: 'livreur_id') int get livreurId;
/// Create a copy of DeliveryInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryInputCopyWith<DeliveryInput> get copyWith => _$DeliveryInputCopyWithImpl<DeliveryInput>(this as DeliveryInput, _$identity);

  /// Serializes this DeliveryInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryInput&&(identical(other.deliveryId, deliveryId) || other.deliveryId == deliveryId)&&(identical(other.livreurId, livreurId) || other.livreurId == livreurId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deliveryId,livreurId);

@override
String toString() {
  return 'DeliveryInput(deliveryId: $deliveryId, livreurId: $livreurId)';
}


}

/// @nodoc
abstract mixin class $DeliveryInputCopyWith<$Res>  {
  factory $DeliveryInputCopyWith(DeliveryInput value, $Res Function(DeliveryInput) _then) = _$DeliveryInputCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'delivery_id') int deliveryId,@JsonKey(name: 'livreur_id') int livreurId
});




}
/// @nodoc
class _$DeliveryInputCopyWithImpl<$Res>
    implements $DeliveryInputCopyWith<$Res> {
  _$DeliveryInputCopyWithImpl(this._self, this._then);

  final DeliveryInput _self;
  final $Res Function(DeliveryInput) _then;

/// Create a copy of DeliveryInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deliveryId = null,Object? livreurId = null,}) {
  return _then(_self.copyWith(
deliveryId: null == deliveryId ? _self.deliveryId : deliveryId // ignore: cast_nullable_to_non_nullable
as int,livreurId: null == livreurId ? _self.livreurId : livreurId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DeliveryInput].
extension DeliveryInputPatterns on DeliveryInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeliveryInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeliveryInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeliveryInput value)  $default,){
final _that = this;
switch (_that) {
case _DeliveryInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeliveryInput value)?  $default,){
final _that = this;
switch (_that) {
case _DeliveryInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'delivery_id')  int deliveryId, @JsonKey(name: 'livreur_id')  int livreurId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeliveryInput() when $default != null:
return $default(_that.deliveryId,_that.livreurId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'delivery_id')  int deliveryId, @JsonKey(name: 'livreur_id')  int livreurId)  $default,) {final _that = this;
switch (_that) {
case _DeliveryInput():
return $default(_that.deliveryId,_that.livreurId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'delivery_id')  int deliveryId, @JsonKey(name: 'livreur_id')  int livreurId)?  $default,) {final _that = this;
switch (_that) {
case _DeliveryInput() when $default != null:
return $default(_that.deliveryId,_that.livreurId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeliveryInput implements DeliveryInput {
  const _DeliveryInput({@JsonKey(name: 'delivery_id') required this.deliveryId, @JsonKey(name: 'livreur_id') required this.livreurId});
  factory _DeliveryInput.fromJson(Map<String, dynamic> json) => _$DeliveryInputFromJson(json);

@override@JsonKey(name: 'delivery_id') final  int deliveryId;
@override@JsonKey(name: 'livreur_id') final  int livreurId;

/// Create a copy of DeliveryInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryInputCopyWith<_DeliveryInput> get copyWith => __$DeliveryInputCopyWithImpl<_DeliveryInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryInput&&(identical(other.deliveryId, deliveryId) || other.deliveryId == deliveryId)&&(identical(other.livreurId, livreurId) || other.livreurId == livreurId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deliveryId,livreurId);

@override
String toString() {
  return 'DeliveryInput(deliveryId: $deliveryId, livreurId: $livreurId)';
}


}

/// @nodoc
abstract mixin class _$DeliveryInputCopyWith<$Res> implements $DeliveryInputCopyWith<$Res> {
  factory _$DeliveryInputCopyWith(_DeliveryInput value, $Res Function(_DeliveryInput) _then) = __$DeliveryInputCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'delivery_id') int deliveryId,@JsonKey(name: 'livreur_id') int livreurId
});




}
/// @nodoc
class __$DeliveryInputCopyWithImpl<$Res>
    implements _$DeliveryInputCopyWith<$Res> {
  __$DeliveryInputCopyWithImpl(this._self, this._then);

  final _DeliveryInput _self;
  final $Res Function(_DeliveryInput) _then;

/// Create a copy of DeliveryInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deliveryId = null,Object? livreurId = null,}) {
  return _then(_DeliveryInput(
deliveryId: null == deliveryId ? _self.deliveryId : deliveryId // ignore: cast_nullable_to_non_nullable
as int,livreurId: null == livreurId ? _self.livreurId : livreurId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
