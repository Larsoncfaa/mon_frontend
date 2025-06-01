// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_warehouse_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedWarehouseList _$PaginatedWarehouseListFromJson(
    Map<String, dynamic> json) {
  return _PaginatedWarehouseList.fromJson(json);
}

/// @nodoc
mixin _$PaginatedWarehouseList {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<Warehouse> get results => throw _privateConstructorUsedError;

  /// Serializes this PaginatedWarehouseList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedWarehouseList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedWarehouseListCopyWith<PaginatedWarehouseList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedWarehouseListCopyWith<$Res> {
  factory $PaginatedWarehouseListCopyWith(PaginatedWarehouseList value,
          $Res Function(PaginatedWarehouseList) then) =
      _$PaginatedWarehouseListCopyWithImpl<$Res, PaginatedWarehouseList>;
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<Warehouse> results});
}

/// @nodoc
class _$PaginatedWarehouseListCopyWithImpl<$Res,
        $Val extends PaginatedWarehouseList>
    implements $PaginatedWarehouseListCopyWith<$Res> {
  _$PaginatedWarehouseListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedWarehouseList
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
              as List<Warehouse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedWarehouseListImplCopyWith<$Res>
    implements $PaginatedWarehouseListCopyWith<$Res> {
  factory _$$PaginatedWarehouseListImplCopyWith(
          _$PaginatedWarehouseListImpl value,
          $Res Function(_$PaginatedWarehouseListImpl) then) =
      __$$PaginatedWarehouseListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<Warehouse> results});
}

/// @nodoc
class __$$PaginatedWarehouseListImplCopyWithImpl<$Res>
    extends _$PaginatedWarehouseListCopyWithImpl<$Res,
        _$PaginatedWarehouseListImpl>
    implements _$$PaginatedWarehouseListImplCopyWith<$Res> {
  __$$PaginatedWarehouseListImplCopyWithImpl(
      _$PaginatedWarehouseListImpl _value,
      $Res Function(_$PaginatedWarehouseListImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedWarehouseList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PaginatedWarehouseListImpl(
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
              as List<Warehouse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedWarehouseListImpl implements _PaginatedWarehouseList {
  const _$PaginatedWarehouseListImpl(
      {required this.count,
      this.next,
      this.previous,
      required final List<Warehouse> results})
      : _results = results;

  factory _$PaginatedWarehouseListImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedWarehouseListImplFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<Warehouse> _results;
  @override
  List<Warehouse> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PaginatedWarehouseList(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedWarehouseListImpl &&
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

  /// Create a copy of PaginatedWarehouseList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedWarehouseListImplCopyWith<_$PaginatedWarehouseListImpl>
      get copyWith => __$$PaginatedWarehouseListImplCopyWithImpl<
          _$PaginatedWarehouseListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedWarehouseListImplToJson(
      this,
    );
  }
}

abstract class _PaginatedWarehouseList implements PaginatedWarehouseList {
  const factory _PaginatedWarehouseList(
      {required final int count,
      final String? next,
      final String? previous,
      required final List<Warehouse> results}) = _$PaginatedWarehouseListImpl;

  factory _PaginatedWarehouseList.fromJson(Map<String, dynamic> json) =
      _$PaginatedWarehouseListImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<Warehouse> get results;

  /// Create a copy of PaginatedWarehouseList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedWarehouseListImplCopyWith<_$PaginatedWarehouseListImpl>
      get copyWith => throw _privateConstructorUsedError;
}
