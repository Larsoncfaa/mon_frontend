// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_write.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderWrite {

 int get client;@JsonKey(name: 'order_status') OrderStatusEnum get orderStatus; List<OrderLineWrite> get lines; double get total;
/// Create a copy of OrderWrite
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderWriteCopyWith<OrderWrite> get copyWith => _$OrderWriteCopyWithImpl<OrderWrite>(this as OrderWrite, _$identity);

  /// Serializes this OrderWrite to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderWrite&&(identical(other.client, client) || other.client == client)&&(identical(other.orderStatus, orderStatus) || other.orderStatus == orderStatus)&&const DeepCollectionEquality().equals(other.lines, lines)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,client,orderStatus,const DeepCollectionEquality().hash(lines),total);

@override
String toString() {
  return 'OrderWrite(client: $client, orderStatus: $orderStatus, lines: $lines, total: $total)';
}


}

/// @nodoc
abstract mixin class $OrderWriteCopyWith<$Res>  {
  factory $OrderWriteCopyWith(OrderWrite value, $Res Function(OrderWrite) _then) = _$OrderWriteCopyWithImpl;
@useResult
$Res call({
 int client,@JsonKey(name: 'order_status') OrderStatusEnum orderStatus, List<OrderLineWrite> lines, double total
});




}
/// @nodoc
class _$OrderWriteCopyWithImpl<$Res>
    implements $OrderWriteCopyWith<$Res> {
  _$OrderWriteCopyWithImpl(this._self, this._then);

  final OrderWrite _self;
  final $Res Function(OrderWrite) _then;

/// Create a copy of OrderWrite
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? client = null,Object? orderStatus = null,Object? lines = null,Object? total = null,}) {
  return _then(_self.copyWith(
client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as int,orderStatus: null == orderStatus ? _self.orderStatus : orderStatus // ignore: cast_nullable_to_non_nullable
as OrderStatusEnum,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<OrderLineWrite>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderWrite].
extension OrderWritePatterns on OrderWrite {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderWrite value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderWrite() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderWrite value)  $default,){
final _that = this;
switch (_that) {
case _OrderWrite():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderWrite value)?  $default,){
final _that = this;
switch (_that) {
case _OrderWrite() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int client, @JsonKey(name: 'order_status')  OrderStatusEnum orderStatus,  List<OrderLineWrite> lines,  double total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderWrite() when $default != null:
return $default(_that.client,_that.orderStatus,_that.lines,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int client, @JsonKey(name: 'order_status')  OrderStatusEnum orderStatus,  List<OrderLineWrite> lines,  double total)  $default,) {final _that = this;
switch (_that) {
case _OrderWrite():
return $default(_that.client,_that.orderStatus,_that.lines,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int client, @JsonKey(name: 'order_status')  OrderStatusEnum orderStatus,  List<OrderLineWrite> lines,  double total)?  $default,) {final _that = this;
switch (_that) {
case _OrderWrite() when $default != null:
return $default(_that.client,_that.orderStatus,_that.lines,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderWrite implements OrderWrite {
  const _OrderWrite({required this.client, @JsonKey(name: 'order_status') required this.orderStatus, required final  List<OrderLineWrite> lines, required this.total}): _lines = lines;
  factory _OrderWrite.fromJson(Map<String, dynamic> json) => _$OrderWriteFromJson(json);

@override final  int client;
@override@JsonKey(name: 'order_status') final  OrderStatusEnum orderStatus;
 final  List<OrderLineWrite> _lines;
@override List<OrderLineWrite> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

@override final  double total;

/// Create a copy of OrderWrite
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderWriteCopyWith<_OrderWrite> get copyWith => __$OrderWriteCopyWithImpl<_OrderWrite>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderWriteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderWrite&&(identical(other.client, client) || other.client == client)&&(identical(other.orderStatus, orderStatus) || other.orderStatus == orderStatus)&&const DeepCollectionEquality().equals(other._lines, _lines)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,client,orderStatus,const DeepCollectionEquality().hash(_lines),total);

@override
String toString() {
  return 'OrderWrite(client: $client, orderStatus: $orderStatus, lines: $lines, total: $total)';
}


}

/// @nodoc
abstract mixin class _$OrderWriteCopyWith<$Res> implements $OrderWriteCopyWith<$Res> {
  factory _$OrderWriteCopyWith(_OrderWrite value, $Res Function(_OrderWrite) _then) = __$OrderWriteCopyWithImpl;
@override @useResult
$Res call({
 int client,@JsonKey(name: 'order_status') OrderStatusEnum orderStatus, List<OrderLineWrite> lines, double total
});




}
/// @nodoc
class __$OrderWriteCopyWithImpl<$Res>
    implements _$OrderWriteCopyWith<$Res> {
  __$OrderWriteCopyWithImpl(this._self, this._then);

  final _OrderWrite _self;
  final $Res Function(_OrderWrite) _then;

/// Create a copy of OrderWrite
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? client = null,Object? orderStatus = null,Object? lines = null,Object? total = null,}) {
  return _then(_OrderWrite(
client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as int,orderStatus: null == orderStatus ? _self.orderStatus : orderStatus // ignore: cast_nullable_to_non_nullable
as OrderStatusEnum,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<OrderLineWrite>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
