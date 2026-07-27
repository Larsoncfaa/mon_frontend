// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_predict.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SalesPredict {

@JsonKey(name: 'product_id') int get productId; String get period;@JsonKey(name: 'predicted_sales') double get predictedSales;
/// Create a copy of SalesPredict
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesPredictCopyWith<SalesPredict> get copyWith => _$SalesPredictCopyWithImpl<SalesPredict>(this as SalesPredict, _$identity);

  /// Serializes this SalesPredict to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesPredict&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.period, period) || other.period == period)&&(identical(other.predictedSales, predictedSales) || other.predictedSales == predictedSales));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,period,predictedSales);

@override
String toString() {
  return 'SalesPredict(productId: $productId, period: $period, predictedSales: $predictedSales)';
}


}

/// @nodoc
abstract mixin class $SalesPredictCopyWith<$Res>  {
  factory $SalesPredictCopyWith(SalesPredict value, $Res Function(SalesPredict) _then) = _$SalesPredictCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'product_id') int productId, String period,@JsonKey(name: 'predicted_sales') double predictedSales
});




}
/// @nodoc
class _$SalesPredictCopyWithImpl<$Res>
    implements $SalesPredictCopyWith<$Res> {
  _$SalesPredictCopyWithImpl(this._self, this._then);

  final SalesPredict _self;
  final $Res Function(SalesPredict) _then;

/// Create a copy of SalesPredict
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? period = null,Object? predictedSales = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,predictedSales: null == predictedSales ? _self.predictedSales : predictedSales // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesPredict].
extension SalesPredictPatterns on SalesPredict {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesPredict value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesPredict() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesPredict value)  $default,){
final _that = this;
switch (_that) {
case _SalesPredict():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesPredict value)?  $default,){
final _that = this;
switch (_that) {
case _SalesPredict() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id')  int productId,  String period, @JsonKey(name: 'predicted_sales')  double predictedSales)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesPredict() when $default != null:
return $default(_that.productId,_that.period,_that.predictedSales);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'product_id')  int productId,  String period, @JsonKey(name: 'predicted_sales')  double predictedSales)  $default,) {final _that = this;
switch (_that) {
case _SalesPredict():
return $default(_that.productId,_that.period,_that.predictedSales);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'product_id')  int productId,  String period, @JsonKey(name: 'predicted_sales')  double predictedSales)?  $default,) {final _that = this;
switch (_that) {
case _SalesPredict() when $default != null:
return $default(_that.productId,_that.period,_that.predictedSales);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesPredict implements SalesPredict {
  const _SalesPredict({@JsonKey(name: 'product_id') required this.productId, required this.period, @JsonKey(name: 'predicted_sales') required this.predictedSales});
  factory _SalesPredict.fromJson(Map<String, dynamic> json) => _$SalesPredictFromJson(json);

@override@JsonKey(name: 'product_id') final  int productId;
@override final  String period;
@override@JsonKey(name: 'predicted_sales') final  double predictedSales;

/// Create a copy of SalesPredict
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesPredictCopyWith<_SalesPredict> get copyWith => __$SalesPredictCopyWithImpl<_SalesPredict>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesPredictToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesPredict&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.period, period) || other.period == period)&&(identical(other.predictedSales, predictedSales) || other.predictedSales == predictedSales));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,period,predictedSales);

@override
String toString() {
  return 'SalesPredict(productId: $productId, period: $period, predictedSales: $predictedSales)';
}


}

/// @nodoc
abstract mixin class _$SalesPredictCopyWith<$Res> implements $SalesPredictCopyWith<$Res> {
  factory _$SalesPredictCopyWith(_SalesPredict value, $Res Function(_SalesPredict) _then) = __$SalesPredictCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'product_id') int productId, String period,@JsonKey(name: 'predicted_sales') double predictedSales
});




}
/// @nodoc
class __$SalesPredictCopyWithImpl<$Res>
    implements _$SalesPredictCopyWith<$Res> {
  __$SalesPredictCopyWithImpl(this._self, this._then);

  final _SalesPredict _self;
  final $Res Function(_SalesPredict) _then;

/// Create a copy of SalesPredict
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? period = null,Object? predictedSales = null,}) {
  return _then(_SalesPredict(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as String,predictedSales: null == predictedSales ? _self.predictedSales : predictedSales // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
