// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SalesInput {

@JsonKey(name: 'product_id') int get productId;@JsonKey(name: 'history_days') int get historyDays;@JsonKey(name: 'forecast_days') int get forecastDays;
/// Create a copy of SalesInput
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesInputCopyWith<SalesInput> get copyWith => _$SalesInputCopyWithImpl<SalesInput>(this as SalesInput, _$identity);

  /// Serializes this SalesInput to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesInput&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.historyDays, historyDays) || other.historyDays == historyDays)&&(identical(other.forecastDays, forecastDays) || other.forecastDays == forecastDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,historyDays,forecastDays);

@override
String toString() {
  return 'SalesInput(productId: $productId, historyDays: $historyDays, forecastDays: $forecastDays)';
}


}

/// @nodoc
abstract mixin class $SalesInputCopyWith<$Res>  {
  factory $SalesInputCopyWith(SalesInput value, $Res Function(SalesInput) _then) = _$SalesInputCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'product_id') int productId,@JsonKey(name: 'history_days') int historyDays,@JsonKey(name: 'forecast_days') int forecastDays
});




}
/// @nodoc
class _$SalesInputCopyWithImpl<$Res>
    implements $SalesInputCopyWith<$Res> {
  _$SalesInputCopyWithImpl(this._self, this._then);

  final SalesInput _self;
  final $Res Function(SalesInput) _then;

/// Create a copy of SalesInput
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? historyDays = null,Object? forecastDays = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,historyDays: null == historyDays ? _self.historyDays : historyDays // ignore: cast_nullable_to_non_nullable
as int,forecastDays: null == forecastDays ? _self.forecastDays : forecastDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesInput].
extension SalesInputPatterns on SalesInput {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesInput value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesInput() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesInput value)  $default,){
final _that = this;
switch (_that) {
case _SalesInput():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesInput value)?  $default,){
final _that = this;
switch (_that) {
case _SalesInput() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'history_days')  int historyDays, @JsonKey(name: 'forecast_days')  int forecastDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesInput() when $default != null:
return $default(_that.productId,_that.historyDays,_that.forecastDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'history_days')  int historyDays, @JsonKey(name: 'forecast_days')  int forecastDays)  $default,) {final _that = this;
switch (_that) {
case _SalesInput():
return $default(_that.productId,_that.historyDays,_that.forecastDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'product_id')  int productId, @JsonKey(name: 'history_days')  int historyDays, @JsonKey(name: 'forecast_days')  int forecastDays)?  $default,) {final _that = this;
switch (_that) {
case _SalesInput() when $default != null:
return $default(_that.productId,_that.historyDays,_that.forecastDays);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesInput implements SalesInput {
  const _SalesInput({@JsonKey(name: 'product_id') required this.productId, @JsonKey(name: 'history_days') required this.historyDays, @JsonKey(name: 'forecast_days') required this.forecastDays});
  factory _SalesInput.fromJson(Map<String, dynamic> json) => _$SalesInputFromJson(json);

@override@JsonKey(name: 'product_id') final  int productId;
@override@JsonKey(name: 'history_days') final  int historyDays;
@override@JsonKey(name: 'forecast_days') final  int forecastDays;

/// Create a copy of SalesInput
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesInputCopyWith<_SalesInput> get copyWith => __$SalesInputCopyWithImpl<_SalesInput>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesInputToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesInput&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.historyDays, historyDays) || other.historyDays == historyDays)&&(identical(other.forecastDays, forecastDays) || other.forecastDays == forecastDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,historyDays,forecastDays);

@override
String toString() {
  return 'SalesInput(productId: $productId, historyDays: $historyDays, forecastDays: $forecastDays)';
}


}

/// @nodoc
abstract mixin class _$SalesInputCopyWith<$Res> implements $SalesInputCopyWith<$Res> {
  factory _$SalesInputCopyWith(_SalesInput value, $Res Function(_SalesInput) _then) = __$SalesInputCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'product_id') int productId,@JsonKey(name: 'history_days') int historyDays,@JsonKey(name: 'forecast_days') int forecastDays
});




}
/// @nodoc
class __$SalesInputCopyWithImpl<$Res>
    implements _$SalesInputCopyWith<$Res> {
  __$SalesInputCopyWithImpl(this._self, this._then);

  final _SalesInput _self;
  final $Res Function(_SalesInput) _then;

/// Create a copy of SalesInput
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? historyDays = null,Object? forecastDays = null,}) {
  return _then(_SalesInput(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,historyDays: null == historyDays ? _self.historyDays : historyDays // ignore: cast_nullable_to_non_nullable
as int,forecastDays: null == forecastDays ? _self.forecastDays : forecastDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
