// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_exchange_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatchedExchangeRequest {

 int? get id;@JsonKey(name: 'order_id') int? get orderId; String? get reason;@JsonKey(name: 'requested_at') DateTime? get requestedAt;@JsonKey(name: 'exchange_status') String? get exchangeStatus; String? get replacement;
/// Create a copy of PatchedExchangeRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatchedExchangeRequestCopyWith<PatchedExchangeRequest> get copyWith => _$PatchedExchangeRequestCopyWithImpl<PatchedExchangeRequest>(this as PatchedExchangeRequest, _$identity);

  /// Serializes this PatchedExchangeRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatchedExchangeRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.exchangeStatus, exchangeStatus) || other.exchangeStatus == exchangeStatus)&&(identical(other.replacement, replacement) || other.replacement == replacement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,reason,requestedAt,exchangeStatus,replacement);

@override
String toString() {
  return 'PatchedExchangeRequest(id: $id, orderId: $orderId, reason: $reason, requestedAt: $requestedAt, exchangeStatus: $exchangeStatus, replacement: $replacement)';
}


}

/// @nodoc
abstract mixin class $PatchedExchangeRequestCopyWith<$Res>  {
  factory $PatchedExchangeRequestCopyWith(PatchedExchangeRequest value, $Res Function(PatchedExchangeRequest) _then) = _$PatchedExchangeRequestCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'order_id') int? orderId, String? reason,@JsonKey(name: 'requested_at') DateTime? requestedAt,@JsonKey(name: 'exchange_status') String? exchangeStatus, String? replacement
});




}
/// @nodoc
class _$PatchedExchangeRequestCopyWithImpl<$Res>
    implements $PatchedExchangeRequestCopyWith<$Res> {
  _$PatchedExchangeRequestCopyWithImpl(this._self, this._then);

  final PatchedExchangeRequest _self;
  final $Res Function(PatchedExchangeRequest) _then;

/// Create a copy of PatchedExchangeRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? orderId = freezed,Object? reason = freezed,Object? requestedAt = freezed,Object? exchangeStatus = freezed,Object? replacement = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,requestedAt: freezed == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,exchangeStatus: freezed == exchangeStatus ? _self.exchangeStatus : exchangeStatus // ignore: cast_nullable_to_non_nullable
as String?,replacement: freezed == replacement ? _self.replacement : replacement // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PatchedExchangeRequest].
extension PatchedExchangeRequestPatterns on PatchedExchangeRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatchedExchangeRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatchedExchangeRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatchedExchangeRequest value)  $default,){
final _that = this;
switch (_that) {
case _PatchedExchangeRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatchedExchangeRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PatchedExchangeRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'order_id')  int? orderId,  String? reason, @JsonKey(name: 'requested_at')  DateTime? requestedAt, @JsonKey(name: 'exchange_status')  String? exchangeStatus,  String? replacement)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatchedExchangeRequest() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'order_id')  int? orderId,  String? reason, @JsonKey(name: 'requested_at')  DateTime? requestedAt, @JsonKey(name: 'exchange_status')  String? exchangeStatus,  String? replacement)  $default,) {final _that = this;
switch (_that) {
case _PatchedExchangeRequest():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'order_id')  int? orderId,  String? reason, @JsonKey(name: 'requested_at')  DateTime? requestedAt, @JsonKey(name: 'exchange_status')  String? exchangeStatus,  String? replacement)?  $default,) {final _that = this;
switch (_that) {
case _PatchedExchangeRequest() when $default != null:
return $default(_that.id,_that.orderId,_that.reason,_that.requestedAt,_that.exchangeStatus,_that.replacement);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatchedExchangeRequest implements PatchedExchangeRequest {
  const _PatchedExchangeRequest({this.id, @JsonKey(name: 'order_id') this.orderId, this.reason, @JsonKey(name: 'requested_at') this.requestedAt, @JsonKey(name: 'exchange_status') this.exchangeStatus, this.replacement});
  factory _PatchedExchangeRequest.fromJson(Map<String, dynamic> json) => _$PatchedExchangeRequestFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'order_id') final  int? orderId;
@override final  String? reason;
@override@JsonKey(name: 'requested_at') final  DateTime? requestedAt;
@override@JsonKey(name: 'exchange_status') final  String? exchangeStatus;
@override final  String? replacement;

/// Create a copy of PatchedExchangeRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatchedExchangeRequestCopyWith<_PatchedExchangeRequest> get copyWith => __$PatchedExchangeRequestCopyWithImpl<_PatchedExchangeRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatchedExchangeRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatchedExchangeRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.exchangeStatus, exchangeStatus) || other.exchangeStatus == exchangeStatus)&&(identical(other.replacement, replacement) || other.replacement == replacement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,reason,requestedAt,exchangeStatus,replacement);

@override
String toString() {
  return 'PatchedExchangeRequest(id: $id, orderId: $orderId, reason: $reason, requestedAt: $requestedAt, exchangeStatus: $exchangeStatus, replacement: $replacement)';
}


}

/// @nodoc
abstract mixin class _$PatchedExchangeRequestCopyWith<$Res> implements $PatchedExchangeRequestCopyWith<$Res> {
  factory _$PatchedExchangeRequestCopyWith(_PatchedExchangeRequest value, $Res Function(_PatchedExchangeRequest) _then) = __$PatchedExchangeRequestCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'order_id') int? orderId, String? reason,@JsonKey(name: 'requested_at') DateTime? requestedAt,@JsonKey(name: 'exchange_status') String? exchangeStatus, String? replacement
});




}
/// @nodoc
class __$PatchedExchangeRequestCopyWithImpl<$Res>
    implements _$PatchedExchangeRequestCopyWith<$Res> {
  __$PatchedExchangeRequestCopyWithImpl(this._self, this._then);

  final _PatchedExchangeRequest _self;
  final $Res Function(_PatchedExchangeRequest) _then;

/// Create a copy of PatchedExchangeRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? orderId = freezed,Object? reason = freezed,Object? requestedAt = freezed,Object? exchangeStatus = freezed,Object? replacement = freezed,}) {
  return _then(_PatchedExchangeRequest(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,requestedAt: freezed == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,exchangeStatus: freezed == exchangeStatus ? _self.exchangeStatus : exchangeStatus // ignore: cast_nullable_to_non_nullable
as String?,replacement: freezed == replacement ? _self.replacement : replacement // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
