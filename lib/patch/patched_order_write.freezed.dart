// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_order_write.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatchedOrderWrite {

 int? get client;@JsonKey(name: 'order_status') String? get orderStatus; List<dynamic>? get lines; double? get total;
/// Create a copy of PatchedOrderWrite
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatchedOrderWriteCopyWith<PatchedOrderWrite> get copyWith => _$PatchedOrderWriteCopyWithImpl<PatchedOrderWrite>(this as PatchedOrderWrite, _$identity);

  /// Serializes this PatchedOrderWrite to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatchedOrderWrite&&(identical(other.client, client) || other.client == client)&&(identical(other.orderStatus, orderStatus) || other.orderStatus == orderStatus)&&const DeepCollectionEquality().equals(other.lines, lines)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,client,orderStatus,const DeepCollectionEquality().hash(lines),total);

@override
String toString() {
  return 'PatchedOrderWrite(client: $client, orderStatus: $orderStatus, lines: $lines, total: $total)';
}


}

/// @nodoc
abstract mixin class $PatchedOrderWriteCopyWith<$Res>  {
  factory $PatchedOrderWriteCopyWith(PatchedOrderWrite value, $Res Function(PatchedOrderWrite) _then) = _$PatchedOrderWriteCopyWithImpl;
@useResult
$Res call({
 int? client,@JsonKey(name: 'order_status') String? orderStatus, List<dynamic>? lines, double? total
});




}
/// @nodoc
class _$PatchedOrderWriteCopyWithImpl<$Res>
    implements $PatchedOrderWriteCopyWith<$Res> {
  _$PatchedOrderWriteCopyWithImpl(this._self, this._then);

  final PatchedOrderWrite _self;
  final $Res Function(PatchedOrderWrite) _then;

/// Create a copy of PatchedOrderWrite
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? client = freezed,Object? orderStatus = freezed,Object? lines = freezed,Object? total = freezed,}) {
  return _then(_self.copyWith(
client: freezed == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as int?,orderStatus: freezed == orderStatus ? _self.orderStatus : orderStatus // ignore: cast_nullable_to_non_nullable
as String?,lines: freezed == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [PatchedOrderWrite].
extension PatchedOrderWritePatterns on PatchedOrderWrite {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatchedOrderWrite value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatchedOrderWrite() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatchedOrderWrite value)  $default,){
final _that = this;
switch (_that) {
case _PatchedOrderWrite():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatchedOrderWrite value)?  $default,){
final _that = this;
switch (_that) {
case _PatchedOrderWrite() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? client, @JsonKey(name: 'order_status')  String? orderStatus,  List<dynamic>? lines,  double? total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatchedOrderWrite() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? client, @JsonKey(name: 'order_status')  String? orderStatus,  List<dynamic>? lines,  double? total)  $default,) {final _that = this;
switch (_that) {
case _PatchedOrderWrite():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? client, @JsonKey(name: 'order_status')  String? orderStatus,  List<dynamic>? lines,  double? total)?  $default,) {final _that = this;
switch (_that) {
case _PatchedOrderWrite() when $default != null:
return $default(_that.client,_that.orderStatus,_that.lines,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatchedOrderWrite implements PatchedOrderWrite {
  const _PatchedOrderWrite({this.client, @JsonKey(name: 'order_status') this.orderStatus, final  List<dynamic>? lines, this.total}): _lines = lines;
  factory _PatchedOrderWrite.fromJson(Map<String, dynamic> json) => _$PatchedOrderWriteFromJson(json);

@override final  int? client;
@override@JsonKey(name: 'order_status') final  String? orderStatus;
 final  List<dynamic>? _lines;
@override List<dynamic>? get lines {
  final value = _lines;
  if (value == null) return null;
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  double? total;

/// Create a copy of PatchedOrderWrite
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatchedOrderWriteCopyWith<_PatchedOrderWrite> get copyWith => __$PatchedOrderWriteCopyWithImpl<_PatchedOrderWrite>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatchedOrderWriteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatchedOrderWrite&&(identical(other.client, client) || other.client == client)&&(identical(other.orderStatus, orderStatus) || other.orderStatus == orderStatus)&&const DeepCollectionEquality().equals(other._lines, _lines)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,client,orderStatus,const DeepCollectionEquality().hash(_lines),total);

@override
String toString() {
  return 'PatchedOrderWrite(client: $client, orderStatus: $orderStatus, lines: $lines, total: $total)';
}


}

/// @nodoc
abstract mixin class _$PatchedOrderWriteCopyWith<$Res> implements $PatchedOrderWriteCopyWith<$Res> {
  factory _$PatchedOrderWriteCopyWith(_PatchedOrderWrite value, $Res Function(_PatchedOrderWrite) _then) = __$PatchedOrderWriteCopyWithImpl;
@override @useResult
$Res call({
 int? client,@JsonKey(name: 'order_status') String? orderStatus, List<dynamic>? lines, double? total
});




}
/// @nodoc
class __$PatchedOrderWriteCopyWithImpl<$Res>
    implements _$PatchedOrderWriteCopyWith<$Res> {
  __$PatchedOrderWriteCopyWithImpl(this._self, this._then);

  final _PatchedOrderWrite _self;
  final $Res Function(_PatchedOrderWrite) _then;

/// Create a copy of PatchedOrderWrite
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? client = freezed,Object? orderStatus = freezed,Object? lines = freezed,Object? total = freezed,}) {
  return _then(_PatchedOrderWrite(
client: freezed == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as int?,orderStatus: freezed == orderStatus ? _self.orderStatus : orderStatus // ignore: cast_nullable_to_non_nullable
as String?,lines: freezed == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
