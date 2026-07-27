// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exchange_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExchangeRequest {

 int get id;@JsonKey(name: 'order_id') int get orderId; String get reason;@JsonKey(name: 'requested_at') DateTime get requestedAt;@JsonKey(name: 'exchange_status') ExchangeStatusEnum get exchangeStatus; String? get replacement;
/// Create a copy of ExchangeRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExchangeRequestCopyWith<ExchangeRequest> get copyWith => _$ExchangeRequestCopyWithImpl<ExchangeRequest>(this as ExchangeRequest, _$identity);

  /// Serializes this ExchangeRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExchangeRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.exchangeStatus, exchangeStatus) || other.exchangeStatus == exchangeStatus)&&(identical(other.replacement, replacement) || other.replacement == replacement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,reason,requestedAt,exchangeStatus,replacement);

@override
String toString() {
  return 'ExchangeRequest(id: $id, orderId: $orderId, reason: $reason, requestedAt: $requestedAt, exchangeStatus: $exchangeStatus, replacement: $replacement)';
}


}

/// @nodoc
abstract mixin class $ExchangeRequestCopyWith<$Res>  {
  factory $ExchangeRequestCopyWith(ExchangeRequest value, $Res Function(ExchangeRequest) _then) = _$ExchangeRequestCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'order_id') int orderId, String reason,@JsonKey(name: 'requested_at') DateTime requestedAt,@JsonKey(name: 'exchange_status') ExchangeStatusEnum exchangeStatus, String? replacement
});




}
/// @nodoc
class _$ExchangeRequestCopyWithImpl<$Res>
    implements $ExchangeRequestCopyWith<$Res> {
  _$ExchangeRequestCopyWithImpl(this._self, this._then);

  final ExchangeRequest _self;
  final $Res Function(ExchangeRequest) _then;

/// Create a copy of ExchangeRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderId = null,Object? reason = null,Object? requestedAt = null,Object? exchangeStatus = null,Object? replacement = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,exchangeStatus: null == exchangeStatus ? _self.exchangeStatus : exchangeStatus // ignore: cast_nullable_to_non_nullable
as ExchangeStatusEnum,replacement: freezed == replacement ? _self.replacement : replacement // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExchangeRequest].
extension ExchangeRequestPatterns on ExchangeRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExchangeRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExchangeRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExchangeRequest value)  $default,){
final _that = this;
switch (_that) {
case _ExchangeRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExchangeRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ExchangeRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'order_id')  int orderId,  String reason, @JsonKey(name: 'requested_at')  DateTime requestedAt, @JsonKey(name: 'exchange_status')  ExchangeStatusEnum exchangeStatus,  String? replacement)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExchangeRequest() when $default != null:
return $default(_that.id,_that.orderId,_that.reason,_that.requestedAt,_that.exchangeStatus,_that.replacement);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'order_id')  int orderId,  String reason, @JsonKey(name: 'requested_at')  DateTime requestedAt, @JsonKey(name: 'exchange_status')  ExchangeStatusEnum exchangeStatus,  String? replacement)  $default,) {final _that = this;
switch (_that) {
case _ExchangeRequest():
return $default(_that.id,_that.orderId,_that.reason,_that.requestedAt,_that.exchangeStatus,_that.replacement);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'order_id')  int orderId,  String reason, @JsonKey(name: 'requested_at')  DateTime requestedAt, @JsonKey(name: 'exchange_status')  ExchangeStatusEnum exchangeStatus,  String? replacement)?  $default,) {final _that = this;
switch (_that) {
case _ExchangeRequest() when $default != null:
return $default(_that.id,_that.orderId,_that.reason,_that.requestedAt,_that.exchangeStatus,_that.replacement);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExchangeRequest implements ExchangeRequest {
  const _ExchangeRequest({required this.id, @JsonKey(name: 'order_id') required this.orderId, required this.reason, @JsonKey(name: 'requested_at') required this.requestedAt, @JsonKey(name: 'exchange_status') required this.exchangeStatus, this.replacement});
  factory _ExchangeRequest.fromJson(Map<String, dynamic> json) => _$ExchangeRequestFromJson(json);

@override final  int id;
@override@JsonKey(name: 'order_id') final  int orderId;
@override final  String reason;
@override@JsonKey(name: 'requested_at') final  DateTime requestedAt;
@override@JsonKey(name: 'exchange_status') final  ExchangeStatusEnum exchangeStatus;
@override final  String? replacement;

/// Create a copy of ExchangeRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExchangeRequestCopyWith<_ExchangeRequest> get copyWith => __$ExchangeRequestCopyWithImpl<_ExchangeRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExchangeRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExchangeRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.exchangeStatus, exchangeStatus) || other.exchangeStatus == exchangeStatus)&&(identical(other.replacement, replacement) || other.replacement == replacement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,reason,requestedAt,exchangeStatus,replacement);

@override
String toString() {
  return 'ExchangeRequest(id: $id, orderId: $orderId, reason: $reason, requestedAt: $requestedAt, exchangeStatus: $exchangeStatus, replacement: $replacement)';
}


}

/// @nodoc
abstract mixin class _$ExchangeRequestCopyWith<$Res> implements $ExchangeRequestCopyWith<$Res> {
  factory _$ExchangeRequestCopyWith(_ExchangeRequest value, $Res Function(_ExchangeRequest) _then) = __$ExchangeRequestCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'order_id') int orderId, String reason,@JsonKey(name: 'requested_at') DateTime requestedAt,@JsonKey(name: 'exchange_status') ExchangeStatusEnum exchangeStatus, String? replacement
});




}
/// @nodoc
class __$ExchangeRequestCopyWithImpl<$Res>
    implements _$ExchangeRequestCopyWith<$Res> {
  __$ExchangeRequestCopyWithImpl(this._self, this._then);

  final _ExchangeRequest _self;
  final $Res Function(_ExchangeRequest) _then;

/// Create a copy of ExchangeRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderId = null,Object? reason = null,Object? requestedAt = null,Object? exchangeStatus = null,Object? replacement = freezed,}) {
  return _then(_ExchangeRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,requestedAt: null == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime,exchangeStatus: null == exchangeStatus ? _self.exchangeStatus : exchangeStatus // ignore: cast_nullable_to_non_nullable
as ExchangeStatusEnum,replacement: freezed == replacement ? _self.replacement : replacement // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
