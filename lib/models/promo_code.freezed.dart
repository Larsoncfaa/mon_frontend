// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promo_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PromoCode {

 int get id; String get code;@JsonKey(name: 'discount_percent') double get discountPercent;@JsonKey(name: 'valid_from') DateTime get validFrom;@JsonKey(name: 'valid_until') DateTime get validUntil;@JsonKey(name: 'is_active') bool get isActive;
/// Create a copy of PromoCode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromoCodeCopyWith<PromoCode> get copyWith => _$PromoCodeCopyWithImpl<PromoCode>(this as PromoCode, _$identity);

  /// Serializes this PromoCode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PromoCode&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.validFrom, validFrom) || other.validFrom == validFrom)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,discountPercent,validFrom,validUntil,isActive);

@override
String toString() {
  return 'PromoCode(id: $id, code: $code, discountPercent: $discountPercent, validFrom: $validFrom, validUntil: $validUntil, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $PromoCodeCopyWith<$Res>  {
  factory $PromoCodeCopyWith(PromoCode value, $Res Function(PromoCode) _then) = _$PromoCodeCopyWithImpl;
@useResult
$Res call({
 int id, String code,@JsonKey(name: 'discount_percent') double discountPercent,@JsonKey(name: 'valid_from') DateTime validFrom,@JsonKey(name: 'valid_until') DateTime validUntil,@JsonKey(name: 'is_active') bool isActive
});




}
/// @nodoc
class _$PromoCodeCopyWithImpl<$Res>
    implements $PromoCodeCopyWith<$Res> {
  _$PromoCodeCopyWithImpl(this._self, this._then);

  final PromoCode _self;
  final $Res Function(PromoCode) _then;

/// Create a copy of PromoCode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? discountPercent = null,Object? validFrom = null,Object? validUntil = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,discountPercent: null == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as double,validFrom: null == validFrom ? _self.validFrom : validFrom // ignore: cast_nullable_to_non_nullable
as DateTime,validUntil: null == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as DateTime,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PromoCode].
extension PromoCodePatterns on PromoCode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PromoCode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromoCode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PromoCode value)  $default,){
final _that = this;
switch (_that) {
case _PromoCode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PromoCode value)?  $default,){
final _that = this;
switch (_that) {
case _PromoCode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String code, @JsonKey(name: 'discount_percent')  double discountPercent, @JsonKey(name: 'valid_from')  DateTime validFrom, @JsonKey(name: 'valid_until')  DateTime validUntil, @JsonKey(name: 'is_active')  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromoCode() when $default != null:
return $default(_that.id,_that.code,_that.discountPercent,_that.validFrom,_that.validUntil,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String code, @JsonKey(name: 'discount_percent')  double discountPercent, @JsonKey(name: 'valid_from')  DateTime validFrom, @JsonKey(name: 'valid_until')  DateTime validUntil, @JsonKey(name: 'is_active')  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _PromoCode():
return $default(_that.id,_that.code,_that.discountPercent,_that.validFrom,_that.validUntil,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String code, @JsonKey(name: 'discount_percent')  double discountPercent, @JsonKey(name: 'valid_from')  DateTime validFrom, @JsonKey(name: 'valid_until')  DateTime validUntil, @JsonKey(name: 'is_active')  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _PromoCode() when $default != null:
return $default(_that.id,_that.code,_that.discountPercent,_that.validFrom,_that.validUntil,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PromoCode implements PromoCode {
  const _PromoCode({required this.id, required this.code, @JsonKey(name: 'discount_percent') required this.discountPercent, @JsonKey(name: 'valid_from') required this.validFrom, @JsonKey(name: 'valid_until') required this.validUntil, @JsonKey(name: 'is_active') required this.isActive});
  factory _PromoCode.fromJson(Map<String, dynamic> json) => _$PromoCodeFromJson(json);

@override final  int id;
@override final  String code;
@override@JsonKey(name: 'discount_percent') final  double discountPercent;
@override@JsonKey(name: 'valid_from') final  DateTime validFrom;
@override@JsonKey(name: 'valid_until') final  DateTime validUntil;
@override@JsonKey(name: 'is_active') final  bool isActive;

/// Create a copy of PromoCode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromoCodeCopyWith<_PromoCode> get copyWith => __$PromoCodeCopyWithImpl<_PromoCode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PromoCodeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromoCode&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.validFrom, validFrom) || other.validFrom == validFrom)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,discountPercent,validFrom,validUntil,isActive);

@override
String toString() {
  return 'PromoCode(id: $id, code: $code, discountPercent: $discountPercent, validFrom: $validFrom, validUntil: $validUntil, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$PromoCodeCopyWith<$Res> implements $PromoCodeCopyWith<$Res> {
  factory _$PromoCodeCopyWith(_PromoCode value, $Res Function(_PromoCode) _then) = __$PromoCodeCopyWithImpl;
@override @useResult
$Res call({
 int id, String code,@JsonKey(name: 'discount_percent') double discountPercent,@JsonKey(name: 'valid_from') DateTime validFrom,@JsonKey(name: 'valid_until') DateTime validUntil,@JsonKey(name: 'is_active') bool isActive
});




}
/// @nodoc
class __$PromoCodeCopyWithImpl<$Res>
    implements _$PromoCodeCopyWith<$Res> {
  __$PromoCodeCopyWithImpl(this._self, this._then);

  final _PromoCode _self;
  final $Res Function(_PromoCode) _then;

/// Create a copy of PromoCode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? discountPercent = null,Object? validFrom = null,Object? validUntil = null,Object? isActive = null,}) {
  return _then(_PromoCode(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,discountPercent: null == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as double,validFrom: null == validFrom ? _self.validFrom : validFrom // ignore: cast_nullable_to_non_nullable
as DateTime,validUntil: null == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as DateTime,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
