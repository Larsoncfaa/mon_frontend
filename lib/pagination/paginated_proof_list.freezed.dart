// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_proof_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginatedProofList {

 int get count; String? get next; String? get previous; List<Proof> get results;
/// Create a copy of PaginatedProofList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedProofListCopyWith<PaginatedProofList> get copyWith => _$PaginatedProofListCopyWithImpl<PaginatedProofList>(this as PaginatedProofList, _$identity);

  /// Serializes this PaginatedProofList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedProofList&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'PaginatedProofList(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class $PaginatedProofListCopyWith<$Res>  {
  factory $PaginatedProofListCopyWith(PaginatedProofList value, $Res Function(PaginatedProofList) _then) = _$PaginatedProofListCopyWithImpl;
@useResult
$Res call({
 int count, String? next, String? previous, List<Proof> results
});




}
/// @nodoc
class _$PaginatedProofListCopyWithImpl<$Res>
    implements $PaginatedProofListCopyWith<$Res> {
  _$PaginatedProofListCopyWithImpl(this._self, this._then);

  final PaginatedProofList _self;
  final $Res Function(PaginatedProofList) _then;

/// Create a copy of PaginatedProofList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<Proof>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedProofList].
extension PaginatedProofListPatterns on PaginatedProofList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedProofList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedProofList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedProofList value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedProofList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedProofList value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedProofList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<Proof> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedProofList() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count,  String? next,  String? previous,  List<Proof> results)  $default,) {final _that = this;
switch (_that) {
case _PaginatedProofList():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count,  String? next,  String? previous,  List<Proof> results)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedProofList() when $default != null:
return $default(_that.count,_that.next,_that.previous,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginatedProofList implements PaginatedProofList {
  const _PaginatedProofList({required this.count, this.next, this.previous, required final  List<Proof> results}): _results = results;
  factory _PaginatedProofList.fromJson(Map<String, dynamic> json) => _$PaginatedProofListFromJson(json);

@override final  int count;
@override final  String? next;
@override final  String? previous;
 final  List<Proof> _results;
@override List<Proof> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of PaginatedProofList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedProofListCopyWith<_PaginatedProofList> get copyWith => __$PaginatedProofListCopyWithImpl<_PaginatedProofList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedProofListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedProofList&&(identical(other.count, count) || other.count == count)&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count,next,previous,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'PaginatedProofList(count: $count, next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class _$PaginatedProofListCopyWith<$Res> implements $PaginatedProofListCopyWith<$Res> {
  factory _$PaginatedProofListCopyWith(_PaginatedProofList value, $Res Function(_PaginatedProofList) _then) = __$PaginatedProofListCopyWithImpl;
@override @useResult
$Res call({
 int count, String? next, String? previous, List<Proof> results
});




}
/// @nodoc
class __$PaginatedProofListCopyWithImpl<$Res>
    implements _$PaginatedProofListCopyWith<$Res> {
  __$PaginatedProofListCopyWithImpl(this._self, this._then);

  final _PaginatedProofList _self;
  final $Res Function(_PaginatedProofList) _then;

/// Create a copy of PaginatedProofList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_PaginatedProofList(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<Proof>,
  ));
}


}

// dart format on
