// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_stock_alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatchedStockAlert {

 int? get id; int? get product; int? get threshold;@JsonKey(name: 'is_active') bool? get isActive; int? get warehouse; String? get message;
/// Create a copy of PatchedStockAlert
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatchedStockAlertCopyWith<PatchedStockAlert> get copyWith => _$PatchedStockAlertCopyWithImpl<PatchedStockAlert>(this as PatchedStockAlert, _$identity);

  /// Serializes this PatchedStockAlert to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatchedStockAlert&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.threshold, threshold) || other.threshold == threshold)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.warehouse, warehouse) || other.warehouse == warehouse)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,threshold,isActive,warehouse,message);

@override
String toString() {
  return 'PatchedStockAlert(id: $id, product: $product, threshold: $threshold, isActive: $isActive, warehouse: $warehouse, message: $message)';
}


}

/// @nodoc
abstract mixin class $PatchedStockAlertCopyWith<$Res>  {
  factory $PatchedStockAlertCopyWith(PatchedStockAlert value, $Res Function(PatchedStockAlert) _then) = _$PatchedStockAlertCopyWithImpl;
@useResult
$Res call({
 int? id, int? product, int? threshold,@JsonKey(name: 'is_active') bool? isActive, int? warehouse, String? message
});




}
/// @nodoc
class _$PatchedStockAlertCopyWithImpl<$Res>
    implements $PatchedStockAlertCopyWith<$Res> {
  _$PatchedStockAlertCopyWithImpl(this._self, this._then);

  final PatchedStockAlert _self;
  final $Res Function(PatchedStockAlert) _then;

/// Create a copy of PatchedStockAlert
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? product = freezed,Object? threshold = freezed,Object? isActive = freezed,Object? warehouse = freezed,Object? message = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as int?,threshold: freezed == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as int?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,warehouse: freezed == warehouse ? _self.warehouse : warehouse // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PatchedStockAlert].
extension PatchedStockAlertPatterns on PatchedStockAlert {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatchedStockAlert value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatchedStockAlert() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatchedStockAlert value)  $default,){
final _that = this;
switch (_that) {
case _PatchedStockAlert():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatchedStockAlert value)?  $default,){
final _that = this;
switch (_that) {
case _PatchedStockAlert() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? product,  int? threshold, @JsonKey(name: 'is_active')  bool? isActive,  int? warehouse,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatchedStockAlert() when $default != null:
return $default(_that.id,_that.product,_that.threshold,_that.isActive,_that.warehouse,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? product,  int? threshold, @JsonKey(name: 'is_active')  bool? isActive,  int? warehouse,  String? message)  $default,) {final _that = this;
switch (_that) {
case _PatchedStockAlert():
return $default(_that.id,_that.product,_that.threshold,_that.isActive,_that.warehouse,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? product,  int? threshold, @JsonKey(name: 'is_active')  bool? isActive,  int? warehouse,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _PatchedStockAlert() when $default != null:
return $default(_that.id,_that.product,_that.threshold,_that.isActive,_that.warehouse,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatchedStockAlert implements PatchedStockAlert {
  const _PatchedStockAlert({this.id, this.product, this.threshold, @JsonKey(name: 'is_active') this.isActive, this.warehouse, this.message});
  factory _PatchedStockAlert.fromJson(Map<String, dynamic> json) => _$PatchedStockAlertFromJson(json);

@override final  int? id;
@override final  int? product;
@override final  int? threshold;
@override@JsonKey(name: 'is_active') final  bool? isActive;
@override final  int? warehouse;
@override final  String? message;

/// Create a copy of PatchedStockAlert
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatchedStockAlertCopyWith<_PatchedStockAlert> get copyWith => __$PatchedStockAlertCopyWithImpl<_PatchedStockAlert>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatchedStockAlertToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatchedStockAlert&&(identical(other.id, id) || other.id == id)&&(identical(other.product, product) || other.product == product)&&(identical(other.threshold, threshold) || other.threshold == threshold)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.warehouse, warehouse) || other.warehouse == warehouse)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,product,threshold,isActive,warehouse,message);

@override
String toString() {
  return 'PatchedStockAlert(id: $id, product: $product, threshold: $threshold, isActive: $isActive, warehouse: $warehouse, message: $message)';
}


}

/// @nodoc
abstract mixin class _$PatchedStockAlertCopyWith<$Res> implements $PatchedStockAlertCopyWith<$Res> {
  factory _$PatchedStockAlertCopyWith(_PatchedStockAlert value, $Res Function(_PatchedStockAlert) _then) = __$PatchedStockAlertCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? product, int? threshold,@JsonKey(name: 'is_active') bool? isActive, int? warehouse, String? message
});




}
/// @nodoc
class __$PatchedStockAlertCopyWithImpl<$Res>
    implements _$PatchedStockAlertCopyWith<$Res> {
  __$PatchedStockAlertCopyWithImpl(this._self, this._then);

  final _PatchedStockAlert _self;
  final $Res Function(_PatchedStockAlert) _then;

/// Create a copy of PatchedStockAlert
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? product = freezed,Object? threshold = freezed,Object? isActive = freezed,Object? warehouse = freezed,Object? message = freezed,}) {
  return _then(_PatchedStockAlert(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as int?,threshold: freezed == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as int?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,warehouse: freezed == warehouse ? _self.warehouse : warehouse // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
