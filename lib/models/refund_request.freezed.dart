// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refund_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RefundRequest {

 int get id; int get order; String get reason;@JsonKey(includeFromJson: false, includeToJson: false) File? get evidence;@JsonKey(name: 'requested_at') DateTime? get requestedAt;@JsonKey(name: 'refund_status') RefundStatusEnum? get refundStatus;@JsonKey(name: 'processed_at') DateTime? get processedAt;@JsonKey(name: 'days_remaining') int get daysRemaining;
/// Create a copy of RefundRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefundRequestCopyWith<RefundRequest> get copyWith => _$RefundRequestCopyWithImpl<RefundRequest>(this as RefundRequest, _$identity);

  /// Serializes this RefundRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefundRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.evidence, evidence) || other.evidence == evidence)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.refundStatus, refundStatus) || other.refundStatus == refundStatus)&&(identical(other.processedAt, processedAt) || other.processedAt == processedAt)&&(identical(other.daysRemaining, daysRemaining) || other.daysRemaining == daysRemaining));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,reason,evidence,requestedAt,refundStatus,processedAt,daysRemaining);

@override
String toString() {
  return 'RefundRequest(id: $id, order: $order, reason: $reason, evidence: $evidence, requestedAt: $requestedAt, refundStatus: $refundStatus, processedAt: $processedAt, daysRemaining: $daysRemaining)';
}


}

/// @nodoc
abstract mixin class $RefundRequestCopyWith<$Res>  {
  factory $RefundRequestCopyWith(RefundRequest value, $Res Function(RefundRequest) _then) = _$RefundRequestCopyWithImpl;
@useResult
$Res call({
 int id, int order, String reason,@JsonKey(includeFromJson: false, includeToJson: false) File? evidence,@JsonKey(name: 'requested_at') DateTime? requestedAt,@JsonKey(name: 'refund_status') RefundStatusEnum? refundStatus,@JsonKey(name: 'processed_at') DateTime? processedAt,@JsonKey(name: 'days_remaining') int daysRemaining
});




}
/// @nodoc
class _$RefundRequestCopyWithImpl<$Res>
    implements $RefundRequestCopyWith<$Res> {
  _$RefundRequestCopyWithImpl(this._self, this._then);

  final RefundRequest _self;
  final $Res Function(RefundRequest) _then;

/// Create a copy of RefundRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? order = null,Object? reason = null,Object? evidence = freezed,Object? requestedAt = freezed,Object? refundStatus = freezed,Object? processedAt = freezed,Object? daysRemaining = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,evidence: freezed == evidence ? _self.evidence : evidence // ignore: cast_nullable_to_non_nullable
as File?,requestedAt: freezed == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,refundStatus: freezed == refundStatus ? _self.refundStatus : refundStatus // ignore: cast_nullable_to_non_nullable
as RefundStatusEnum?,processedAt: freezed == processedAt ? _self.processedAt : processedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,daysRemaining: null == daysRemaining ? _self.daysRemaining : daysRemaining // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RefundRequest].
extension RefundRequestPatterns on RefundRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefundRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefundRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefundRequest value)  $default,){
final _that = this;
switch (_that) {
case _RefundRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefundRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RefundRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int order,  String reason, @JsonKey(includeFromJson: false, includeToJson: false)  File? evidence, @JsonKey(name: 'requested_at')  DateTime? requestedAt, @JsonKey(name: 'refund_status')  RefundStatusEnum? refundStatus, @JsonKey(name: 'processed_at')  DateTime? processedAt, @JsonKey(name: 'days_remaining')  int daysRemaining)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefundRequest() when $default != null:
return $default(_that.id,_that.order,_that.reason,_that.evidence,_that.requestedAt,_that.refundStatus,_that.processedAt,_that.daysRemaining);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int order,  String reason, @JsonKey(includeFromJson: false, includeToJson: false)  File? evidence, @JsonKey(name: 'requested_at')  DateTime? requestedAt, @JsonKey(name: 'refund_status')  RefundStatusEnum? refundStatus, @JsonKey(name: 'processed_at')  DateTime? processedAt, @JsonKey(name: 'days_remaining')  int daysRemaining)  $default,) {final _that = this;
switch (_that) {
case _RefundRequest():
return $default(_that.id,_that.order,_that.reason,_that.evidence,_that.requestedAt,_that.refundStatus,_that.processedAt,_that.daysRemaining);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int order,  String reason, @JsonKey(includeFromJson: false, includeToJson: false)  File? evidence, @JsonKey(name: 'requested_at')  DateTime? requestedAt, @JsonKey(name: 'refund_status')  RefundStatusEnum? refundStatus, @JsonKey(name: 'processed_at')  DateTime? processedAt, @JsonKey(name: 'days_remaining')  int daysRemaining)?  $default,) {final _that = this;
switch (_that) {
case _RefundRequest() when $default != null:
return $default(_that.id,_that.order,_that.reason,_that.evidence,_that.requestedAt,_that.refundStatus,_that.processedAt,_that.daysRemaining);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefundRequest implements RefundRequest {
  const _RefundRequest({required this.id, required this.order, required this.reason, @JsonKey(includeFromJson: false, includeToJson: false) this.evidence, @JsonKey(name: 'requested_at') this.requestedAt, @JsonKey(name: 'refund_status') this.refundStatus, @JsonKey(name: 'processed_at') this.processedAt, @JsonKey(name: 'days_remaining') required this.daysRemaining});
  factory _RefundRequest.fromJson(Map<String, dynamic> json) => _$RefundRequestFromJson(json);

@override final  int id;
@override final  int order;
@override final  String reason;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  File? evidence;
@override@JsonKey(name: 'requested_at') final  DateTime? requestedAt;
@override@JsonKey(name: 'refund_status') final  RefundStatusEnum? refundStatus;
@override@JsonKey(name: 'processed_at') final  DateTime? processedAt;
@override@JsonKey(name: 'days_remaining') final  int daysRemaining;

/// Create a copy of RefundRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefundRequestCopyWith<_RefundRequest> get copyWith => __$RefundRequestCopyWithImpl<_RefundRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefundRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefundRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.evidence, evidence) || other.evidence == evidence)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.refundStatus, refundStatus) || other.refundStatus == refundStatus)&&(identical(other.processedAt, processedAt) || other.processedAt == processedAt)&&(identical(other.daysRemaining, daysRemaining) || other.daysRemaining == daysRemaining));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,reason,evidence,requestedAt,refundStatus,processedAt,daysRemaining);

@override
String toString() {
  return 'RefundRequest(id: $id, order: $order, reason: $reason, evidence: $evidence, requestedAt: $requestedAt, refundStatus: $refundStatus, processedAt: $processedAt, daysRemaining: $daysRemaining)';
}


}

/// @nodoc
abstract mixin class _$RefundRequestCopyWith<$Res> implements $RefundRequestCopyWith<$Res> {
  factory _$RefundRequestCopyWith(_RefundRequest value, $Res Function(_RefundRequest) _then) = __$RefundRequestCopyWithImpl;
@override @useResult
$Res call({
 int id, int order, String reason,@JsonKey(includeFromJson: false, includeToJson: false) File? evidence,@JsonKey(name: 'requested_at') DateTime? requestedAt,@JsonKey(name: 'refund_status') RefundStatusEnum? refundStatus,@JsonKey(name: 'processed_at') DateTime? processedAt,@JsonKey(name: 'days_remaining') int daysRemaining
});




}
/// @nodoc
class __$RefundRequestCopyWithImpl<$Res>
    implements _$RefundRequestCopyWith<$Res> {
  __$RefundRequestCopyWithImpl(this._self, this._then);

  final _RefundRequest _self;
  final $Res Function(_RefundRequest) _then;

/// Create a copy of RefundRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? reason = null,Object? evidence = freezed,Object? requestedAt = freezed,Object? refundStatus = freezed,Object? processedAt = freezed,Object? daysRemaining = null,}) {
  return _then(_RefundRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,evidence: freezed == evidence ? _self.evidence : evidence // ignore: cast_nullable_to_non_nullable
as File?,requestedAt: freezed == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,refundStatus: freezed == refundStatus ? _self.refundStatus : refundStatus // ignore: cast_nullable_to_non_nullable
as RefundStatusEnum?,processedAt: freezed == processedAt ? _self.processedAt : processedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,daysRemaining: null == daysRemaining ? _self.daysRemaining : daysRemaining // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
