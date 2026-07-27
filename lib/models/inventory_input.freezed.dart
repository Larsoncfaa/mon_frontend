// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InventoryInput {

@JsonKey(name: 'product_id') int get productId;@JsonKey(name: 'window_days') int get windowDays;
/// Create a copy of InventoryInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryInputCopyWith<InventoryInput> get copyWith => _$InventoryInputCopyWithImpl<InventoryInput>(this as InventoryInput, _$identity);

  /// Serializes this InventoryInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryInput&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.windowDays, windowDays) || other.windowDays == windowDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,windowDays);

@override
String toString() {
  return 'InventoryInput(productId: $productId, windowDays: $windowDays)';
}


}

/// @nodoc
abstract mixin class $InventoryInputCopyWith<$Res>  {
  factory $InventoryInputCopyWith(InventoryInput value, $Res Function(InventoryInput) _then) = _$InventoryInputCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'product_id') int productId,@JsonKey(name: 'window_days') int windowDays
});




}
/// @nodoc
class _$InventoryInputCopyWithImpl<$Res>
    implements $InventoryInputCopyWith<$Res> {
  _$InventoryInputCopyWithImpl(this._self, this._then);

  final InventoryInput _self;
  final $Res Function(InventoryInput) _then;

/// Create a copy of InventoryInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? windowDays = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,windowDays: null == windowDays ? _self.windowDays : windowDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [InventoryInput].
extension InventoryInputPatterns on InventoryInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InventoryInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InventoryInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InventoryInput value)  $default,){
final _that = this;
switch (_that) {
case _InventoryInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InventoryInput value)?  $default,){
final _that = this;
switch (_that) {
case _InventoryInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'window_days')  int windowDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InventoryInput() when $default != null:
return $default(_that.productId,_that.windowDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'window_days')  int windowDays)  $default,) {final _that = this;
switch (_that) {
case _InventoryInput():
return $default(_that.productId,_that.windowDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'window_days')  int windowDays)?  $default,) {final _that = this;
switch (_that) {
case _InventoryInput() when $default != null:
return $default(_that.productId,_that.windowDays);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InventoryInput implements InventoryInput {
  const _InventoryInput({@JsonKey(name: 'product_id') required this.productId, @JsonKey(name: 'window_days') required this.windowDays});
  factory _InventoryInput.fromJson(Map<String, dynamic> json) => _$InventoryInputFromJson(json);

@override@JsonKey(name: 'product_id') final  int productId;
@override@JsonKey(name: 'window_days') final  int windowDays;

/// Create a copy of InventoryInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventoryInputCopyWith<_InventoryInput> get copyWith => __$InventoryInputCopyWithImpl<_InventoryInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InventoryInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InventoryInput&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.windowDays, windowDays) || other.windowDays == windowDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,windowDays);

@override
String toString() {
  return 'InventoryInput(productId: $productId, windowDays: $windowDays)';
}


}

/// @nodoc
abstract mixin class _$InventoryInputCopyWith<$Res> implements $InventoryInputCopyWith<$Res> {
  factory _$InventoryInputCopyWith(_InventoryInput value, $Res Function(_InventoryInput) _then) = __$InventoryInputCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'product_id') int productId,@JsonKey(name: 'window_days') int windowDays
});




}
/// @nodoc
class __$InventoryInputCopyWithImpl<$Res>
    implements _$InventoryInputCopyWith<$Res> {
  __$InventoryInputCopyWithImpl(this._self, this._then);

  final _InventoryInput _self;
  final $Res Function(_InventoryInput) _then;

/// Create a copy of InventoryInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? windowDays = null,}) {
  return _then(_InventoryInput(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,windowDays: null == windowDays ? _self.windowDays : windowDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
