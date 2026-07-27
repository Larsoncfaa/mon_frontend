// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatchedNotification {

 int? get id; String? get title; String? get message;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'is_read') bool? get isRead; String? get link;
/// Create a copy of PatchedNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatchedNotificationCopyWith<PatchedNotification> get copyWith => _$PatchedNotificationCopyWithImpl<PatchedNotification>(this as PatchedNotification, _$identity);

  /// Serializes this PatchedNotification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatchedNotification&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.link, link) || other.link == link));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,message,createdAt,isRead,link);

@override
String toString() {
  return 'PatchedNotification(id: $id, title: $title, message: $message, createdAt: $createdAt, isRead: $isRead, link: $link)';
}


}

/// @nodoc
abstract mixin class $PatchedNotificationCopyWith<$Res>  {
  factory $PatchedNotificationCopyWith(PatchedNotification value, $Res Function(PatchedNotification) _then) = _$PatchedNotificationCopyWithImpl;
@useResult
$Res call({
 int? id, String? title, String? message,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'is_read') bool? isRead, String? link
});




}
/// @nodoc
class _$PatchedNotificationCopyWithImpl<$Res>
    implements $PatchedNotificationCopyWith<$Res> {
  _$PatchedNotificationCopyWithImpl(this._self, this._then);

  final PatchedNotification _self;
  final $Res Function(PatchedNotification) _then;

/// Create a copy of PatchedNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? message = freezed,Object? createdAt = freezed,Object? isRead = freezed,Object? link = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isRead: freezed == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool?,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PatchedNotification].
extension PatchedNotificationPatterns on PatchedNotification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatchedNotification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatchedNotification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatchedNotification value)  $default,){
final _that = this;
switch (_that) {
case _PatchedNotification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatchedNotification value)?  $default,){
final _that = this;
switch (_that) {
case _PatchedNotification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? title,  String? message, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'is_read')  bool? isRead,  String? link)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatchedNotification() when $default != null:
return $default(_that.id,_that.title,_that.message,_that.createdAt,_that.isRead,_that.link);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? title,  String? message, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'is_read')  bool? isRead,  String? link)  $default,) {final _that = this;
switch (_that) {
case _PatchedNotification():
return $default(_that.id,_that.title,_that.message,_that.createdAt,_that.isRead,_that.link);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? title,  String? message, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'is_read')  bool? isRead,  String? link)?  $default,) {final _that = this;
switch (_that) {
case _PatchedNotification() when $default != null:
return $default(_that.id,_that.title,_that.message,_that.createdAt,_that.isRead,_that.link);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatchedNotification implements PatchedNotification {
  const _PatchedNotification({this.id, this.title, this.message, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'is_read') this.isRead, this.link});
  factory _PatchedNotification.fromJson(Map<String, dynamic> json) => _$PatchedNotificationFromJson(json);

@override final  int? id;
@override final  String? title;
@override final  String? message;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'is_read') final  bool? isRead;
@override final  String? link;

/// Create a copy of PatchedNotification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatchedNotificationCopyWith<_PatchedNotification> get copyWith => __$PatchedNotificationCopyWithImpl<_PatchedNotification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatchedNotificationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatchedNotification&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.link, link) || other.link == link));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,message,createdAt,isRead,link);

@override
String toString() {
  return 'PatchedNotification(id: $id, title: $title, message: $message, createdAt: $createdAt, isRead: $isRead, link: $link)';
}


}

/// @nodoc
abstract mixin class _$PatchedNotificationCopyWith<$Res> implements $PatchedNotificationCopyWith<$Res> {
  factory _$PatchedNotificationCopyWith(_PatchedNotification value, $Res Function(_PatchedNotification) _then) = __$PatchedNotificationCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? title, String? message,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'is_read') bool? isRead, String? link
});




}
/// @nodoc
class __$PatchedNotificationCopyWithImpl<$Res>
    implements _$PatchedNotificationCopyWith<$Res> {
  __$PatchedNotificationCopyWithImpl(this._self, this._then);

  final _PatchedNotification _self;
  final $Res Function(_PatchedNotification) _then;

/// Create a copy of PatchedNotification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? message = freezed,Object? createdAt = freezed,Object? isRead = freezed,Object? link = freezed,}) {
  return _then(_PatchedNotification(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isRead: freezed == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool?,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
