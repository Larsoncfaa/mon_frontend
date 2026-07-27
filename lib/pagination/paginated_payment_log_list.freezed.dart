// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_payment_log_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginatedPaymentLogList {

 int get count; String? get next; String? get previous; List<PaymentLog> get results;
/// Create a copy of PaginatedPaymentLogList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedPaymentLogListCopyWith<PaginatedPaymentLogList> get copyWith => _$PaginatedPaymentLogListCopyWithImpl<PaginatedPaymentLogList>(this as PaginatedPaymentLogList, _$identity);

  /// Serializes this PaginatedPaymentLogList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedPaymentLogList&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'PaginatedPaymentLogList(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class $PaginatedPaymentLogListCopyWith<$Res>  {
  factory $PaginatedPaymentLogListCopyWith(PaginatedPaymentLogList value, $Res Function(PaginatedPaymentLogList) _then) = _$PaginatedPaymentLogListCopyWithImpl;
@useResult
$Res call({
 int count, String? next, String? previous, List<PaymentLog> results
});




}
/// @nodoc
class _$PaginatedPaymentLogListCopyWithImpl<$Res>
    implements $PaginatedPaymentLogListCopyWith<$Res> {
  _$PaginatedPaymentLogListCopyWithImpl(this._self, this._then);

  final PaginatedPaymentLogList _self;
  final $Res Function(PaginatedPaymentLogList) _then;

/// Create a copy of PaginatedPaymentLogList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<PaymentLog>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedPaymentLogList].
extension PaginatedPaymentLogListPatterns on PaginatedPaymentLogList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedPaymentLogList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedPaymentLogList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedPaymentLogList value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedPaymentLogList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedPaymentLogList value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedPaymentLogList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<PaymentLog> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedPaymentLogList() when $default != null:
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<PaymentLog> results)  $default,) {final _that = this;
switch (_that) {
case _PaginatedPaymentLogList():
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  String? next,  String? previous,  List<PaymentLog> results)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedPaymentLogList() when $default != null:
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginatedPaymentLogList implements PaginatedPaymentLogList {
  const _PaginatedPaymentLogList({required this.count, this.next, this.previous, required final  List<PaymentLog> results}): _results = results;
  factory _PaginatedPaymentLogList.fromJson(Map<String, dynamic> json) => _$PaginatedPaymentLogListFromJson(json);

@override final  int count;
@override final  String? next;
@override final  String? previous;
 final  List<PaymentLog> _results;
@override List<PaymentLog> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of PaginatedPaymentLogList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedPaymentLogListCopyWith<_PaginatedPaymentLogList> get copyWith => __$PaginatedPaymentLogListCopyWithImpl<_PaginatedPaymentLogList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedPaymentLogListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedPaymentLogList&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'PaginatedPaymentLogList(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class _$PaginatedPaymentLogListCopyWith<$Res> implements $PaginatedPaymentLogListCopyWith<$Res> {
  factory _$PaginatedPaymentLogListCopyWith(_PaginatedPaymentLogList value, $Res Function(_PaginatedPaymentLogList) _then) = __$PaginatedPaymentLogListCopyWithImpl;
@override @useResult
$Res call({
 int count, String? next, String? previous, List<PaymentLog> results
});




}
/// @nodoc
class __$PaginatedPaymentLogListCopyWithImpl<$Res>
    implements _$PaginatedPaymentLogListCopyWith<$Res> {
  __$PaginatedPaymentLogListCopyWithImpl(this._self, this._then);

  final _PaginatedPaymentLogList _self;
  final $Res Function(_PaginatedPaymentLogList) _then;

/// Create a copy of PaginatedPaymentLogList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_PaginatedPaymentLogList(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<PaymentLog>,
  ));
}


}

// dart format on
