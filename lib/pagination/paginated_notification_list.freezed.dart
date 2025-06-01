// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_notification_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedNotificationList _$PaginatedNotificationListFromJson(
    Map<String, dynamic> json) {
  return _PaginatedNotificationList.fromJson(json);
}

/// @nodoc
mixin _$PaginatedNotificationList {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<Notification> get results => throw _privateConstructorUsedError;

  /// Serializes this PaginatedNotificationList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedNotificationList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedNotificationListCopyWith<PaginatedNotificationList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedNotificationListCopyWith<$Res> {
  factory $PaginatedNotificationListCopyWith(PaginatedNotificationList value,
          $Res Function(PaginatedNotificationList) then) =
      _$PaginatedNotificationListCopyWithImpl<$Res, PaginatedNotificationList>;
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<Notification> results});
}

/// @nodoc
class _$PaginatedNotificationListCopyWithImpl<$Res,
        $Val extends PaginatedNotificationList>
    implements $PaginatedNotificationListCopyWith<$Res> {
  _$PaginatedNotificationListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedNotificationList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Notification>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedNotificationListImplCopyWith<$Res>
    implements $PaginatedNotificationListCopyWith<$Res> {
  factory _$$PaginatedNotificationListImplCopyWith(
          _$PaginatedNotificationListImpl value,
          $Res Function(_$PaginatedNotificationListImpl) then) =
      __$$PaginatedNotificationListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<Notification> results});
}

/// @nodoc
class __$$PaginatedNotificationListImplCopyWithImpl<$Res>
    extends _$PaginatedNotificationListCopyWithImpl<$Res,
        _$PaginatedNotificationListImpl>
    implements _$$PaginatedNotificationListImplCopyWith<$Res> {
  __$$PaginatedNotificationListImplCopyWithImpl(
      _$PaginatedNotificationListImpl _value,
      $Res Function(_$PaginatedNotificationListImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedNotificationList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PaginatedNotificationListImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Notification>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedNotificationListImpl implements _PaginatedNotificationList {
  const _$PaginatedNotificationListImpl(
      {required this.count,
      this.next,
      this.previous,
      required final List<Notification> results})
      : _results = results;

  factory _$PaginatedNotificationListImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedNotificationListImplFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<Notification> _results;
  @override
  List<Notification> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PaginatedNotificationList(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedNotificationListImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, next, previous,
      const DeepCollectionEquality().hash(_results));

  /// Create a copy of PaginatedNotificationList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedNotificationListImplCopyWith<_$PaginatedNotificationListImpl>
      get copyWith => __$$PaginatedNotificationListImplCopyWithImpl<
          _$PaginatedNotificationListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedNotificationListImplToJson(
      this,
    );
  }
}

abstract class _PaginatedNotificationList implements PaginatedNotificationList {
  const factory _PaginatedNotificationList(
          {required final int count,
          final String? next,
          final String? previous,
          required final List<Notification> results}) =
      _$PaginatedNotificationListImpl;

  factory _PaginatedNotificationList.fromJson(Map<String, dynamic> json) =
      _$PaginatedNotificationListImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<Notification> get results;

  /// Create a copy of PaginatedNotificationList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedNotificationListImplCopyWith<_$PaginatedNotificationListImpl>
      get copyWith => throw _privateConstructorUsedError;
}
