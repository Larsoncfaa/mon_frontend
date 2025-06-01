// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_registration_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedRegistrationList _$PaginatedRegistrationListFromJson(
    Map<String, dynamic> json) {
  return _PaginatedRegistrationList.fromJson(json);
}

/// @nodoc
mixin _$PaginatedRegistrationList {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<Registration> get results => throw _privateConstructorUsedError;

  /// Serializes this PaginatedRegistrationList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedRegistrationList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedRegistrationListCopyWith<PaginatedRegistrationList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedRegistrationListCopyWith<$Res> {
  factory $PaginatedRegistrationListCopyWith(PaginatedRegistrationList value,
          $Res Function(PaginatedRegistrationList) then) =
      _$PaginatedRegistrationListCopyWithImpl<$Res, PaginatedRegistrationList>;
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<Registration> results});
}

/// @nodoc
class _$PaginatedRegistrationListCopyWithImpl<$Res,
        $Val extends PaginatedRegistrationList>
    implements $PaginatedRegistrationListCopyWith<$Res> {
  _$PaginatedRegistrationListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedRegistrationList
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
              as List<Registration>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedRegistrationListImplCopyWith<$Res>
    implements $PaginatedRegistrationListCopyWith<$Res> {
  factory _$$PaginatedRegistrationListImplCopyWith(
          _$PaginatedRegistrationListImpl value,
          $Res Function(_$PaginatedRegistrationListImpl) then) =
      __$$PaginatedRegistrationListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<Registration> results});
}

/// @nodoc
class __$$PaginatedRegistrationListImplCopyWithImpl<$Res>
    extends _$PaginatedRegistrationListCopyWithImpl<$Res,
        _$PaginatedRegistrationListImpl>
    implements _$$PaginatedRegistrationListImplCopyWith<$Res> {
  __$$PaginatedRegistrationListImplCopyWithImpl(
      _$PaginatedRegistrationListImpl _value,
      $Res Function(_$PaginatedRegistrationListImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedRegistrationList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PaginatedRegistrationListImpl(
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
              as List<Registration>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedRegistrationListImpl implements _PaginatedRegistrationList {
  const _$PaginatedRegistrationListImpl(
      {required this.count,
      this.next,
      this.previous,
      required final List<Registration> results})
      : _results = results;

  factory _$PaginatedRegistrationListImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedRegistrationListImplFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<Registration> _results;
  @override
  List<Registration> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PaginatedRegistrationList(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedRegistrationListImpl &&
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

  /// Create a copy of PaginatedRegistrationList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedRegistrationListImplCopyWith<_$PaginatedRegistrationListImpl>
      get copyWith => __$$PaginatedRegistrationListImplCopyWithImpl<
          _$PaginatedRegistrationListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedRegistrationListImplToJson(
      this,
    );
  }
}

abstract class _PaginatedRegistrationList implements PaginatedRegistrationList {
  const factory _PaginatedRegistrationList(
          {required final int count,
          final String? next,
          final String? previous,
          required final List<Registration> results}) =
      _$PaginatedRegistrationListImpl;

  factory _PaginatedRegistrationList.fromJson(Map<String, dynamic> json) =
      _$PaginatedRegistrationListImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<Registration> get results;

  /// Create a copy of PaginatedRegistrationList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedRegistrationListImplCopyWith<_$PaginatedRegistrationListImpl>
      get copyWith => throw _privateConstructorUsedError;
}
