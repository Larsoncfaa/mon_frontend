// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatchedNotification _$PatchedNotificationFromJson(Map<String, dynamic> json) {
  return _PatchedNotification.fromJson(json);
}

/// @nodoc
mixin _$PatchedNotification {
  int? get id => throw _privateConstructorUsedError;
  int? get user => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;
  bool? get read => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this PatchedNotification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatchedNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatchedNotificationCopyWith<PatchedNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatchedNotificationCopyWith<$Res> {
  factory $PatchedNotificationCopyWith(
          PatchedNotification value, $Res Function(PatchedNotification) then) =
      _$PatchedNotificationCopyWithImpl<$Res, PatchedNotification>;
  @useResult
  $Res call(
      {int? id,
      int? user,
      String? message,
      String? link,
      bool? read,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$PatchedNotificationCopyWithImpl<$Res, $Val extends PatchedNotification>
    implements $PatchedNotificationCopyWith<$Res> {
  _$PatchedNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatchedNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? message = freezed,
    Object? link = freezed,
    Object? read = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      read: freezed == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatchedNotificationImplCopyWith<$Res>
    implements $PatchedNotificationCopyWith<$Res> {
  factory _$$PatchedNotificationImplCopyWith(_$PatchedNotificationImpl value,
          $Res Function(_$PatchedNotificationImpl) then) =
      __$$PatchedNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? user,
      String? message,
      String? link,
      bool? read,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$PatchedNotificationImplCopyWithImpl<$Res>
    extends _$PatchedNotificationCopyWithImpl<$Res, _$PatchedNotificationImpl>
    implements _$$PatchedNotificationImplCopyWith<$Res> {
  __$$PatchedNotificationImplCopyWithImpl(_$PatchedNotificationImpl _value,
      $Res Function(_$PatchedNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatchedNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? message = freezed,
    Object? link = freezed,
    Object? read = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$PatchedNotificationImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      read: freezed == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatchedNotificationImpl implements _PatchedNotification {
  const _$PatchedNotificationImpl(
      {this.id,
      this.user,
      this.message,
      this.link,
      this.read,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$PatchedNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatchedNotificationImplFromJson(json);

  @override
  final int? id;
  @override
  final int? user;
  @override
  final String? message;
  @override
  final String? link;
  @override
  final bool? read;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'PatchedNotification(id: $id, user: $user, message: $message, link: $link, read: $read, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatchedNotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.read, read) || other.read == read) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, user, message, link, read, createdAt);

  /// Create a copy of PatchedNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchedNotificationImplCopyWith<_$PatchedNotificationImpl> get copyWith =>
      __$$PatchedNotificationImplCopyWithImpl<_$PatchedNotificationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatchedNotificationImplToJson(
      this,
    );
  }
}

abstract class _PatchedNotification implements PatchedNotification {
  const factory _PatchedNotification(
          {final int? id,
          final int? user,
          final String? message,
          final String? link,
          final bool? read,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$PatchedNotificationImpl;

  factory _PatchedNotification.fromJson(Map<String, dynamic> json) =
      _$PatchedNotificationImpl.fromJson;

  @override
  int? get id;
  @override
  int? get user;
  @override
  String? get message;
  @override
  String? get link;
  @override
  bool? get read;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of PatchedNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchedNotificationImplCopyWith<_$PatchedNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
