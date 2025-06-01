// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_proof_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedProofList _$PaginatedProofListFromJson(Map<String, dynamic> json) {
  return _PaginatedProofList.fromJson(json);
}

/// @nodoc
mixin _$PaginatedProofList {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<Proof> get results => throw _privateConstructorUsedError;

  /// Serializes this PaginatedProofList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedProofList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedProofListCopyWith<PaginatedProofList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedProofListCopyWith<$Res> {
  factory $PaginatedProofListCopyWith(
          PaginatedProofList value, $Res Function(PaginatedProofList) then) =
      _$PaginatedProofListCopyWithImpl<$Res, PaginatedProofList>;
  @useResult
  $Res call({int count, String? next, String? previous, List<Proof> results});
}

/// @nodoc
class _$PaginatedProofListCopyWithImpl<$Res, $Val extends PaginatedProofList>
    implements $PaginatedProofListCopyWith<$Res> {
  _$PaginatedProofListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedProofList
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
              as List<Proof>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedProofListImplCopyWith<$Res>
    implements $PaginatedProofListCopyWith<$Res> {
  factory _$$PaginatedProofListImplCopyWith(_$PaginatedProofListImpl value,
          $Res Function(_$PaginatedProofListImpl) then) =
      __$$PaginatedProofListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, String? next, String? previous, List<Proof> results});
}

/// @nodoc
class __$$PaginatedProofListImplCopyWithImpl<$Res>
    extends _$PaginatedProofListCopyWithImpl<$Res, _$PaginatedProofListImpl>
    implements _$$PaginatedProofListImplCopyWith<$Res> {
  __$$PaginatedProofListImplCopyWithImpl(_$PaginatedProofListImpl _value,
      $Res Function(_$PaginatedProofListImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedProofList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PaginatedProofListImpl(
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
              as List<Proof>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedProofListImpl implements _PaginatedProofList {
  const _$PaginatedProofListImpl(
      {required this.count,
      this.next,
      this.previous,
      required final List<Proof> results})
      : _results = results;

  factory _$PaginatedProofListImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedProofListImplFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<Proof> _results;
  @override
  List<Proof> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PaginatedProofList(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedProofListImpl &&
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

  /// Create a copy of PaginatedProofList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedProofListImplCopyWith<_$PaginatedProofListImpl> get copyWith =>
      __$$PaginatedProofListImplCopyWithImpl<_$PaginatedProofListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedProofListImplToJson(
      this,
    );
  }
}

abstract class _PaginatedProofList implements PaginatedProofList {
  const factory _PaginatedProofList(
      {required final int count,
      final String? next,
      final String? previous,
      required final List<Proof> results}) = _$PaginatedProofListImpl;

  factory _PaginatedProofList.fromJson(Map<String, dynamic> json) =
      _$PaginatedProofListImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<Proof> get results;

  /// Create a copy of PaginatedProofList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedProofListImplCopyWith<_$PaginatedProofListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
