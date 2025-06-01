// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_order_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedOrderList _$PaginatedOrderListFromJson(Map<String, dynamic> json) {
  return _PaginatedOrderList.fromJson(json);
}

/// @nodoc
mixin _$PaginatedOrderList {
  int? get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<Order>? get results => throw _privateConstructorUsedError;

  /// Serializes this PaginatedOrderList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedOrderList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedOrderListCopyWith<PaginatedOrderList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedOrderListCopyWith<$Res> {
  factory $PaginatedOrderListCopyWith(
          PaginatedOrderList value, $Res Function(PaginatedOrderList) then) =
      _$PaginatedOrderListCopyWithImpl<$Res, PaginatedOrderList>;
  @useResult
  $Res call({int? count, String? next, String? previous, List<Order>? results});
}

/// @nodoc
class _$PaginatedOrderListCopyWithImpl<$Res, $Val extends PaginatedOrderList>
    implements $PaginatedOrderListCopyWith<$Res> {
  _$PaginatedOrderListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedOrderList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Order>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedOrderListImplCopyWith<$Res>
    implements $PaginatedOrderListCopyWith<$Res> {
  factory _$$PaginatedOrderListImplCopyWith(_$PaginatedOrderListImpl value,
          $Res Function(_$PaginatedOrderListImpl) then) =
      __$$PaginatedOrderListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? count, String? next, String? previous, List<Order>? results});
}

/// @nodoc
class __$$PaginatedOrderListImplCopyWithImpl<$Res>
    extends _$PaginatedOrderListCopyWithImpl<$Res, _$PaginatedOrderListImpl>
    implements _$$PaginatedOrderListImplCopyWith<$Res> {
  __$$PaginatedOrderListImplCopyWithImpl(_$PaginatedOrderListImpl _value,
      $Res Function(_$PaginatedOrderListImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedOrderList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_$PaginatedOrderListImpl(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Order>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedOrderListImpl implements _PaginatedOrderList {
  const _$PaginatedOrderListImpl(
      {this.count, this.next, this.previous, final List<Order>? results})
      : _results = results;

  factory _$PaginatedOrderListImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedOrderListImplFromJson(json);

  @override
  final int? count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<Order>? _results;
  @override
  List<Order>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PaginatedOrderList(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedOrderListImpl &&
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

  /// Create a copy of PaginatedOrderList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedOrderListImplCopyWith<_$PaginatedOrderListImpl> get copyWith =>
      __$$PaginatedOrderListImplCopyWithImpl<_$PaginatedOrderListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedOrderListImplToJson(
      this,
    );
  }
}

abstract class _PaginatedOrderList implements PaginatedOrderList {
  const factory _PaginatedOrderList(
      {final int? count,
      final String? next,
      final String? previous,
      final List<Order>? results}) = _$PaginatedOrderListImpl;

  factory _PaginatedOrderList.fromJson(Map<String, dynamic> json) =
      _$PaginatedOrderListImpl.fromJson;

  @override
  int? get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<Order>? get results;

  /// Create a copy of PaginatedOrderList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedOrderListImplCopyWith<_$PaginatedOrderListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
