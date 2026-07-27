// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loyalty_program.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoyaltyProgram {

 int get id; int get client; int get points;@JsonKey(name: 'last_updated') DateTime get lastUpdated; Map<String, dynamic> get transactions;
/// Create a copy of LoyaltyProgram
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoyaltyProgramCopyWith<LoyaltyProgram> get copyWith => _$LoyaltyProgramCopyWithImpl<LoyaltyProgram>(this as LoyaltyProgram, _$identity);

  /// Serializes this LoyaltyProgram to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoyaltyProgram&&(identical(other.id, id) || other.id == id)&&(identical(other.client, client) || other.client == client)&&(identical(other.points, points) || other.points == points)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&const DeepCollectionEquality().equals(other.transactions, transactions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,client,points,lastUpdated,const DeepCollectionEquality().hash(transactions));

@override
String toString() {
  return 'LoyaltyProgram(id: $id, client: $client, points: $points, lastUpdated: $lastUpdated, transactions: $transactions)';
}


}

/// @nodoc
abstract mixin class $LoyaltyProgramCopyWith<$Res>  {
  factory $LoyaltyProgramCopyWith(LoyaltyProgram value, $Res Function(LoyaltyProgram) _then) = _$LoyaltyProgramCopyWithImpl;
@useResult
$Res call({
 int id, int client, int points,@JsonKey(name: 'last_updated') DateTime lastUpdated, Map<String, dynamic> transactions
});




}
/// @nodoc
class _$LoyaltyProgramCopyWithImpl<$Res>
    implements $LoyaltyProgramCopyWith<$Res> {
  _$LoyaltyProgramCopyWithImpl(this._self, this._then);

  final LoyaltyProgram _self;
  final $Res Function(LoyaltyProgram) _then;

/// Create a copy of LoyaltyProgram
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? client = null,Object? points = null,Object? lastUpdated = null,Object? transactions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as int,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [LoyaltyProgram].
extension LoyaltyProgramPatterns on LoyaltyProgram {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoyaltyProgram value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoyaltyProgram() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoyaltyProgram value)  $default,){
final _that = this;
switch (_that) {
case _LoyaltyProgram():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoyaltyProgram value)?  $default,){
final _that = this;
switch (_that) {
case _LoyaltyProgram() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int client,  int points, @JsonKey(name: 'last_updated')  DateTime lastUpdated,  Map<String, dynamic> transactions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoyaltyProgram() when $default != null:
return $default(_that.id,_that.client,_that.points,_that.lastUpdated,_that.transactions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int client,  int points, @JsonKey(name: 'last_updated')  DateTime lastUpdated,  Map<String, dynamic> transactions)  $default,) {final _that = this;
switch (_that) {
case _LoyaltyProgram():
return $default(_that.id,_that.client,_that.points,_that.lastUpdated,_that.transactions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int client,  int points, @JsonKey(name: 'last_updated')  DateTime lastUpdated,  Map<String, dynamic> transactions)?  $default,) {final _that = this;
switch (_that) {
case _LoyaltyProgram() when $default != null:
return $default(_that.id,_that.client,_that.points,_that.lastUpdated,_that.transactions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoyaltyProgram implements LoyaltyProgram {
  const _LoyaltyProgram({required this.id, required this.client, required this.points, @JsonKey(name: 'last_updated') required this.lastUpdated, final  Map<String, dynamic> transactions = const {}}): _transactions = transactions;
  factory _LoyaltyProgram.fromJson(Map<String, dynamic> json) => _$LoyaltyProgramFromJson(json);

@override final  int id;
@override final  int client;
@override final  int points;
@override@JsonKey(name: 'last_updated') final  DateTime lastUpdated;
 final  Map<String, dynamic> _transactions;
@override@JsonKey() Map<String, dynamic> get transactions {
  if (_transactions is EqualUnmodifiableMapView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_transactions);
}


/// Create a copy of LoyaltyProgram
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoyaltyProgramCopyWith<_LoyaltyProgram> get copyWith => __$LoyaltyProgramCopyWithImpl<_LoyaltyProgram>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoyaltyProgramToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoyaltyProgram&&(identical(other.id, id) || other.id == id)&&(identical(other.client, client) || other.client == client)&&(identical(other.points, points) || other.points == points)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&const DeepCollectionEquality().equals(other._transactions, _transactions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,client,points,lastUpdated,const DeepCollectionEquality().hash(_transactions));

@override
String toString() {
  return 'LoyaltyProgram(id: $id, client: $client, points: $points, lastUpdated: $lastUpdated, transactions: $transactions)';
}


}

/// @nodoc
abstract mixin class _$LoyaltyProgramCopyWith<$Res> implements $LoyaltyProgramCopyWith<$Res> {
  factory _$LoyaltyProgramCopyWith(_LoyaltyProgram value, $Res Function(_LoyaltyProgram) _then) = __$LoyaltyProgramCopyWithImpl;
@override @useResult
$Res call({
 int id, int client, int points,@JsonKey(name: 'last_updated') DateTime lastUpdated, Map<String, dynamic> transactions
});




}
/// @nodoc
class __$LoyaltyProgramCopyWithImpl<$Res>
    implements _$LoyaltyProgramCopyWith<$Res> {
  __$LoyaltyProgramCopyWithImpl(this._self, this._then);

  final _LoyaltyProgram _self;
  final $Res Function(_LoyaltyProgram) _then;

/// Create a copy of LoyaltyProgram
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? client = null,Object? points = null,Object? lastUpdated = null,Object? transactions = null,}) {
  return _then(_LoyaltyProgram(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as int,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
