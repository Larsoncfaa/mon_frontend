// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_tracking_info_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedTrackingInfoList _$PaginatedTrackingInfoListFromJson(
    Map<String, dynamic> json) {
  return _PaginatedTrackingInfoList.fromJson(json);
}

/// @nodoc
mixin _$PaginatedTrackingInfoList {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<TrackingInfo> get results => throw _privateConstructorUsedError;

  /// Serializes this PaginatedTrackingInfoList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedTrackingInfoList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedTrackingInfoListCopyWith<PaginatedTrackingInfoList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedTrackingInfoListCopyWith<$Res> {
  factory $PaginatedTrackingInfoListCopyWith(PaginatedTrackingInfoList value,
          $Res Function(PaginatedTrackingInfoList) then) =
      _$PaginatedTrackingInfoListCopyWithImpl<$Res, PaginatedTrackingInfoList>;
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<TrackingInfo> results});
}

/// @nodoc
class _$PaginatedTrackingInfoListCopyWithImpl<$Res,
        $Val extends PaginatedTrackingInfoList>
    implements $PaginatedTrackingInfoListCopyWith<$Res> {
  _$PaginatedTrackingInfoListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedTrackingInfoList
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
              as List<TrackingInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedTrackingInfoListImplCopyWith<$Res>
    implements $PaginatedTrackingInfoListCopyWith<$Res> {
  factory _$$PaginatedTrackingInfoListImplCopyWith(
          _$PaginatedTrackingInfoListImpl value,
          $Res Function(_$PaginatedTrackingInfoListImpl) then) =
      __$$PaginatedTrackingInfoListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<TrackingInfo> results});
}

/// @nodoc
class __$$PaginatedTrackingInfoListImplCopyWithImpl<$Res>
    extends _$PaginatedTrackingInfoListCopyWithImpl<$Res,
        _$PaginatedTrackingInfoListImpl>
    implements _$$PaginatedTrackingInfoListImplCopyWith<$Res> {
  __$$PaginatedTrackingInfoListImplCopyWithImpl(
      _$PaginatedTrackingInfoListImpl _value,
      $Res Function(_$PaginatedTrackingInfoListImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedTrackingInfoList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PaginatedTrackingInfoListImpl(
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
              as List<TrackingInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedTrackingInfoListImpl implements _PaginatedTrackingInfoList {
  const _$PaginatedTrackingInfoListImpl(
      {required this.count,
      this.next,
      this.previous,
      required final List<TrackingInfo> results})
      : _results = results;

  factory _$PaginatedTrackingInfoListImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedTrackingInfoListImplFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<TrackingInfo> _results;
  @override
  List<TrackingInfo> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PaginatedTrackingInfoList(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedTrackingInfoListImpl &&
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

  /// Create a copy of PaginatedTrackingInfoList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedTrackingInfoListImplCopyWith<_$PaginatedTrackingInfoListImpl>
      get copyWith => __$$PaginatedTrackingInfoListImplCopyWithImpl<
          _$PaginatedTrackingInfoListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedTrackingInfoListImplToJson(
      this,
    );
  }
}

abstract class _PaginatedTrackingInfoList implements PaginatedTrackingInfoList {
  const factory _PaginatedTrackingInfoList(
          {required final int count,
          final String? next,
          final String? previous,
          required final List<TrackingInfo> results}) =
      _$PaginatedTrackingInfoListImpl;

  factory _PaginatedTrackingInfoList.fromJson(Map<String, dynamic> json) =
      _$PaginatedTrackingInfoListImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<TrackingInfo> get results;

  /// Create a copy of PaginatedTrackingInfoList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedTrackingInfoListImplCopyWith<_$PaginatedTrackingInfoListImpl>
      get copyWith => throw _privateConstructorUsedError;
}
