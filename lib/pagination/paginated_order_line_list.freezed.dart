// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_order_line_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedOrderLineList _$PaginatedOrderLineListFromJson(
    Map<String, dynamic> json) {
  return _PaginatedOrderLineList.fromJson(json);
}

/// @nodoc
mixin _$PaginatedOrderLineList {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<OrderLine> get results => throw _privateConstructorUsedError;

  /// Serializes this PaginatedOrderLineList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedOrderLineList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedOrderLineListCopyWith<PaginatedOrderLineList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedOrderLineListCopyWith<$Res> {
  factory $PaginatedOrderLineListCopyWith(PaginatedOrderLineList value,
          $Res Function(PaginatedOrderLineList) then) =
      _$PaginatedOrderLineListCopyWithImpl<$Res, PaginatedOrderLineList>;
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<OrderLine> results});
}

/// @nodoc
class _$PaginatedOrderLineListCopyWithImpl<$Res,
        $Val extends PaginatedOrderLineList>
    implements $PaginatedOrderLineListCopyWith<$Res> {
  _$PaginatedOrderLineListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedOrderLineList
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
              as List<OrderLine>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedOrderLineListImplCopyWith<$Res>
    implements $PaginatedOrderLineListCopyWith<$Res> {
  factory _$$PaginatedOrderLineListImplCopyWith(
          _$PaginatedOrderLineListImpl value,
          $Res Function(_$PaginatedOrderLineListImpl) then) =
      __$$PaginatedOrderLineListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<OrderLine> results});
}

/// @nodoc
class __$$PaginatedOrderLineListImplCopyWithImpl<$Res>
    extends _$PaginatedOrderLineListCopyWithImpl<$Res,
        _$PaginatedOrderLineListImpl>
    implements _$$PaginatedOrderLineListImplCopyWith<$Res> {
  __$$PaginatedOrderLineListImplCopyWithImpl(
      _$PaginatedOrderLineListImpl _value,
      $Res Function(_$PaginatedOrderLineListImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedOrderLineList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PaginatedOrderLineListImpl(
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
              as List<OrderLine>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedOrderLineListImpl implements _PaginatedOrderLineList {
  const _$PaginatedOrderLineListImpl(
      {required this.count,
      this.next,
      this.previous,
      required final List<OrderLine> results})
      : _results = results;

  factory _$PaginatedOrderLineListImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedOrderLineListImplFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<OrderLine> _results;
  @override
  List<OrderLine> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PaginatedOrderLineList(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedOrderLineListImpl &&
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

  /// Create a copy of PaginatedOrderLineList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedOrderLineListImplCopyWith<_$PaginatedOrderLineListImpl>
      get copyWith => __$$PaginatedOrderLineListImplCopyWithImpl<
          _$PaginatedOrderLineListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedOrderLineListImplToJson(
      this,
    );
  }
}

abstract class _PaginatedOrderLineList implements PaginatedOrderLineList {
  const factory _PaginatedOrderLineList(
      {required final int count,
      final String? next,
      final String? previous,
      required final List<OrderLine> results}) = _$PaginatedOrderLineListImpl;

  factory _PaginatedOrderLineList.fromJson(Map<String, dynamic> json) =
      _$PaginatedOrderLineListImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<OrderLine> get results;

  /// Create a copy of PaginatedOrderLineList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedOrderLineListImplCopyWith<_$PaginatedOrderLineListImpl>
      get copyWith => throw _privateConstructorUsedError;
}
