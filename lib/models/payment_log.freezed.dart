// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentLog {

 int get id; int get order; double get amount; String get status;@JsonKey(name: 'attempt_time') DateTime get attemptTime;@JsonKey(name: 'response_message') String? get responseMessage;
/// Create a copy of PaymentLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentLogCopyWith<PaymentLog> get copyWith => _$PaymentLogCopyWithImpl<PaymentLog>(this as PaymentLog, _$identity);

  /// Serializes this PaymentLog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentLog&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.attemptTime, attemptTime) || other.attemptTime == attemptTime)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,amount,status,attemptTime,responseMessage);

@override
String toString() {
  return 'PaymentLog(id: $id, order: $order, amount: $amount, status: $status, attemptTime: $attemptTime, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $PaymentLogCopyWith<$Res>  {
  factory $PaymentLogCopyWith(PaymentLog value, $Res Function(PaymentLog) _then) = _$PaymentLogCopyWithImpl;
@useResult
$Res call({
 int id, int order, double amount, String status,@JsonKey(name: 'attempt_time') DateTime attemptTime,@JsonKey(name: 'response_message') String? responseMessage
});




}
/// @nodoc
class _$PaymentLogCopyWithImpl<$Res>
    implements $PaymentLogCopyWith<$Res> {
  _$PaymentLogCopyWithImpl(this._self, this._then);

  final PaymentLog _self;
  final $Res Function(PaymentLog) _then;

/// Create a copy of PaymentLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? order = null,Object? amount = null,Object? status = null,Object? attemptTime = null,Object? responseMessage = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,attemptTime: null == attemptTime ? _self.attemptTime : attemptTime // ignore: cast_nullable_to_non_nullable
as DateTime,responseMessage: freezed == responseMessage ? _self.responseMessage : responseMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentLog].
extension PaymentLogPatterns on PaymentLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentLog value)  $default,){
final _that = this;
switch (_that) {
case _PaymentLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentLog value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int order,  double amount,  String status, @JsonKey(name: 'attempt_time')  DateTime attemptTime, @JsonKey(name: 'response_message')  String? responseMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentLog() when $default != null:
return $default(_that.id,_that.order,_that.amount,_that.status,_that.attemptTime,_that.responseMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int order,  double amount,  String status, @JsonKey(name: 'attempt_time')  DateTime attemptTime, @JsonKey(name: 'response_message')  String? responseMessage)  $default,) {final _that = this;
switch (_that) {
case _PaymentLog():
return $default(_that.id,_that.order,_that.amount,_that.status,_that.attemptTime,_that.responseMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int order,  double amount,  String status, @JsonKey(name: 'attempt_time')  DateTime attemptTime, @JsonKey(name: 'response_message')  String? responseMessage)?  $default,) {final _that = this;
switch (_that) {
case _PaymentLog() when $default != null:
return $default(_that.id,_that.order,_that.amount,_that.status,_that.attemptTime,_that.responseMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentLog implements PaymentLog {
  const _PaymentLog({required this.id, required this.order, required this.amount, required this.status, @JsonKey(name: 'attempt_time') required this.attemptTime, @JsonKey(name: 'response_message') this.responseMessage});
  factory _PaymentLog.fromJson(Map<String, dynamic> json) => _$PaymentLogFromJson(json);

@override final  int id;
@override final  int order;
@override final  double amount;
@override final  String status;
@override@JsonKey(name: 'attempt_time') final  DateTime attemptTime;
@override@JsonKey(name: 'response_message') final  String? responseMessage;

/// Create a copy of PaymentLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentLogCopyWith<_PaymentLog> get copyWith => __$PaymentLogCopyWithImpl<_PaymentLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentLogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentLog&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.attemptTime, attemptTime) || other.attemptTime == attemptTime)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,amount,status,attemptTime,responseMessage);

@override
String toString() {
  return 'PaymentLog(id: $id, order: $order, amount: $amount, status: $status, attemptTime: $attemptTime, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class _$PaymentLogCopyWith<$Res> implements $PaymentLogCopyWith<$Res> {
  factory _$PaymentLogCopyWith(_PaymentLog value, $Res Function(_PaymentLog) _then) = __$PaymentLogCopyWithImpl;
@override @useResult
$Res call({
 int id, int order, double amount, String status,@JsonKey(name: 'attempt_time') DateTime attemptTime,@JsonKey(name: 'response_message') String? responseMessage
});




}
/// @nodoc
class __$PaymentLogCopyWithImpl<$Res>
    implements _$PaymentLogCopyWith<$Res> {
  __$PaymentLogCopyWithImpl(this._self, this._then);

  final _PaymentLog _self;
  final $Res Function(_PaymentLog) _then;

/// Create a copy of PaymentLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? amount = null,Object? status = null,Object? attemptTime = null,Object? responseMessage = freezed,}) {
  return _then(_PaymentLog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,attemptTime: null == attemptTime ? _self.attemptTime : attemptTime // ignore: cast_nullable_to_non_nullable
as DateTime,responseMessage: freezed == responseMessage ? _self.responseMessage : responseMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
