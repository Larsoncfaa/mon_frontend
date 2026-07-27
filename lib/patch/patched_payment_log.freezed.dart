// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_payment_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatchedPaymentLog {

 int? get id; int? get order; double? get amount; String? get status;@JsonKey(name: 'attempt_time') DateTime? get attemptTime;@JsonKey(name: 'response_message') String? get responseMessage;
/// Create a copy of PatchedPaymentLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatchedPaymentLogCopyWith<PatchedPaymentLog> get copyWith => _$PatchedPaymentLogCopyWithImpl<PatchedPaymentLog>(this as PatchedPaymentLog, _$identity);

  /// Serializes this PatchedPaymentLog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatchedPaymentLog&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.attemptTime, attemptTime) || other.attemptTime == attemptTime)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,amount,status,attemptTime,responseMessage);

@override
String toString() {
  return 'PatchedPaymentLog(id: $id, order: $order, amount: $amount, status: $status, attemptTime: $attemptTime, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class $PatchedPaymentLogCopyWith<$Res>  {
  factory $PatchedPaymentLogCopyWith(PatchedPaymentLog value, $Res Function(PatchedPaymentLog) _then) = _$PatchedPaymentLogCopyWithImpl;
@useResult
$Res call({
 int? id, int? order, double? amount, String? status,@JsonKey(name: 'attempt_time') DateTime? attemptTime,@JsonKey(name: 'response_message') String? responseMessage
});




}
/// @nodoc
class _$PatchedPaymentLogCopyWithImpl<$Res>
    implements $PatchedPaymentLogCopyWith<$Res> {
  _$PatchedPaymentLogCopyWithImpl(this._self, this._then);

  final PatchedPaymentLog _self;
  final $Res Function(PatchedPaymentLog) _then;

/// Create a copy of PatchedPaymentLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? order = freezed,Object? amount = freezed,Object? status = freezed,Object? attemptTime = freezed,Object? responseMessage = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,attemptTime: freezed == attemptTime ? _self.attemptTime : attemptTime // ignore: cast_nullable_to_non_nullable
as DateTime?,responseMessage: freezed == responseMessage ? _self.responseMessage : responseMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PatchedPaymentLog].
extension PatchedPaymentLogPatterns on PatchedPaymentLog {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatchedPaymentLog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatchedPaymentLog() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatchedPaymentLog value)  $default,){
final _that = this;
switch (_that) {
case _PatchedPaymentLog():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatchedPaymentLog value)?  $default,){
final _that = this;
switch (_that) {
case _PatchedPaymentLog() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? order,  double? amount,  String? status, @JsonKey(name: 'attempt_time')  DateTime? attemptTime, @JsonKey(name: 'response_message')  String? responseMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatchedPaymentLog() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? order,  double? amount,  String? status, @JsonKey(name: 'attempt_time')  DateTime? attemptTime, @JsonKey(name: 'response_message')  String? responseMessage)  $default,) {final _that = this;
switch (_that) {
case _PatchedPaymentLog():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? order,  double? amount,  String? status, @JsonKey(name: 'attempt_time')  DateTime? attemptTime, @JsonKey(name: 'response_message')  String? responseMessage)?  $default,) {final _that = this;
switch (_that) {
case _PatchedPaymentLog() when $default != null:
return $default(_that.id,_that.order,_that.amount,_that.status,_that.attemptTime,_that.responseMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatchedPaymentLog implements PatchedPaymentLog {
  const _PatchedPaymentLog({this.id, this.order, this.amount, this.status, @JsonKey(name: 'attempt_time') this.attemptTime, @JsonKey(name: 'response_message') this.responseMessage});
  factory _PatchedPaymentLog.fromJson(Map<String, dynamic> json) => _$PatchedPaymentLogFromJson(json);

@override final  int? id;
@override final  int? order;
@override final  double? amount;
@override final  String? status;
@override@JsonKey(name: 'attempt_time') final  DateTime? attemptTime;
@override@JsonKey(name: 'response_message') final  String? responseMessage;

/// Create a copy of PatchedPaymentLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatchedPaymentLogCopyWith<_PatchedPaymentLog> get copyWith => __$PatchedPaymentLogCopyWithImpl<_PatchedPaymentLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatchedPaymentLogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatchedPaymentLog&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.attemptTime, attemptTime) || other.attemptTime == attemptTime)&&(identical(other.responseMessage, responseMessage) || other.responseMessage == responseMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,amount,status,attemptTime,responseMessage);

@override
String toString() {
  return 'PatchedPaymentLog(id: $id, order: $order, amount: $amount, status: $status, attemptTime: $attemptTime, responseMessage: $responseMessage)';
}


}

/// @nodoc
abstract mixin class _$PatchedPaymentLogCopyWith<$Res> implements $PatchedPaymentLogCopyWith<$Res> {
  factory _$PatchedPaymentLogCopyWith(_PatchedPaymentLog value, $Res Function(_PatchedPaymentLog) _then) = __$PatchedPaymentLogCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? order, double? amount, String? status,@JsonKey(name: 'attempt_time') DateTime? attemptTime,@JsonKey(name: 'response_message') String? responseMessage
});




}
/// @nodoc
class __$PatchedPaymentLogCopyWithImpl<$Res>
    implements _$PatchedPaymentLogCopyWith<$Res> {
  __$PatchedPaymentLogCopyWithImpl(this._self, this._then);

  final _PatchedPaymentLog _self;
  final $Res Function(_PatchedPaymentLog) _then;

/// Create a copy of PatchedPaymentLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? order = freezed,Object? amount = freezed,Object? status = freezed,Object? attemptTime = freezed,Object? responseMessage = freezed,}) {
  return _then(_PatchedPaymentLog(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,attemptTime: freezed == attemptTime ? _self.attemptTime : attemptTime // ignore: cast_nullable_to_non_nullable
as DateTime?,responseMessage: freezed == responseMessage ? _self.responseMessage : responseMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
