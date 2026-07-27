// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Payment {

 int get id; int get order; double get amount; MethodEnum get method;@JsonKey(name: 'payment_status') PaymentStatusEnum get paymentStatus;@JsonKey(name: 'transaction_id') String? get transactionId;@JsonKey(name: 'paid_at') DateTime? get paidAt;
/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentCopyWith<Payment> get copyWith => _$PaymentCopyWithImpl<Payment>(this as Payment, _$identity);

  /// Serializes this Payment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Payment&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.method, method) || other.method == method)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,amount,method,paymentStatus,transactionId,paidAt);

@override
String toString() {
  return 'Payment(id: $id, order: $order, amount: $amount, method: $method, paymentStatus: $paymentStatus, transactionId: $transactionId, paidAt: $paidAt)';
}


}

/// @nodoc
abstract mixin class $PaymentCopyWith<$Res>  {
  factory $PaymentCopyWith(Payment value, $Res Function(Payment) _then) = _$PaymentCopyWithImpl;
@useResult
$Res call({
 int id, int order, double amount, MethodEnum method,@JsonKey(name: 'payment_status') PaymentStatusEnum paymentStatus,@JsonKey(name: 'transaction_id') String? transactionId,@JsonKey(name: 'paid_at') DateTime? paidAt
});




}
/// @nodoc
class _$PaymentCopyWithImpl<$Res>
    implements $PaymentCopyWith<$Res> {
  _$PaymentCopyWithImpl(this._self, this._then);

  final Payment _self;
  final $Res Function(Payment) _then;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? order = null,Object? amount = null,Object? method = null,Object? paymentStatus = null,Object? transactionId = freezed,Object? paidAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as MethodEnum,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatusEnum,transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Payment].
extension PaymentPatterns on Payment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Payment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Payment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Payment value)  $default,){
final _that = this;
switch (_that) {
case _Payment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Payment value)?  $default,){
final _that = this;
switch (_that) {
case _Payment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int order,  double amount,  MethodEnum method, @JsonKey(name: 'payment_status')  PaymentStatusEnum paymentStatus, @JsonKey(name: 'transaction_id')  String? transactionId, @JsonKey(name: 'paid_at')  DateTime? paidAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Payment() when $default != null:
return $default(_that.id,_that.order,_that.amount,_that.method,_that.paymentStatus,_that.transactionId,_that.paidAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int order,  double amount,  MethodEnum method, @JsonKey(name: 'payment_status')  PaymentStatusEnum paymentStatus, @JsonKey(name: 'transaction_id')  String? transactionId, @JsonKey(name: 'paid_at')  DateTime? paidAt)  $default,) {final _that = this;
switch (_that) {
case _Payment():
return $default(_that.id,_that.order,_that.amount,_that.method,_that.paymentStatus,_that.transactionId,_that.paidAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int order,  double amount,  MethodEnum method, @JsonKey(name: 'payment_status')  PaymentStatusEnum paymentStatus, @JsonKey(name: 'transaction_id')  String? transactionId, @JsonKey(name: 'paid_at')  DateTime? paidAt)?  $default,) {final _that = this;
switch (_that) {
case _Payment() when $default != null:
return $default(_that.id,_that.order,_that.amount,_that.method,_that.paymentStatus,_that.transactionId,_that.paidAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Payment implements Payment {
  const _Payment({required this.id, required this.order, required this.amount, required this.method, @JsonKey(name: 'payment_status') required this.paymentStatus, @JsonKey(name: 'transaction_id') this.transactionId, @JsonKey(name: 'paid_at') this.paidAt});
  factory _Payment.fromJson(Map<String, dynamic> json) => _$PaymentFromJson(json);

@override final  int id;
@override final  int order;
@override final  double amount;
@override final  MethodEnum method;
@override@JsonKey(name: 'payment_status') final  PaymentStatusEnum paymentStatus;
@override@JsonKey(name: 'transaction_id') final  String? transactionId;
@override@JsonKey(name: 'paid_at') final  DateTime? paidAt;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentCopyWith<_Payment> get copyWith => __$PaymentCopyWithImpl<_Payment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Payment&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.method, method) || other.method == method)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,amount,method,paymentStatus,transactionId,paidAt);

@override
String toString() {
  return 'Payment(id: $id, order: $order, amount: $amount, method: $method, paymentStatus: $paymentStatus, transactionId: $transactionId, paidAt: $paidAt)';
}


}

/// @nodoc
abstract mixin class _$PaymentCopyWith<$Res> implements $PaymentCopyWith<$Res> {
  factory _$PaymentCopyWith(_Payment value, $Res Function(_Payment) _then) = __$PaymentCopyWithImpl;
@override @useResult
$Res call({
 int id, int order, double amount, MethodEnum method,@JsonKey(name: 'payment_status') PaymentStatusEnum paymentStatus,@JsonKey(name: 'transaction_id') String? transactionId,@JsonKey(name: 'paid_at') DateTime? paidAt
});




}
/// @nodoc
class __$PaymentCopyWithImpl<$Res>
    implements _$PaymentCopyWith<$Res> {
  __$PaymentCopyWithImpl(this._self, this._then);

  final _Payment _self;
  final $Res Function(_Payment) _then;

/// Create a copy of Payment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? amount = null,Object? method = null,Object? paymentStatus = null,Object? transactionId = freezed,Object? paidAt = freezed,}) {
  return _then(_Payment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as MethodEnum,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatusEnum,transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
