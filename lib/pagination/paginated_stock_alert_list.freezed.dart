// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_stock_alert_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedStockAlertList _$PaginatedStockAlertListFromJson(
    Map<String, dynamic> json) {
  return _PaginatedStockAlertList.fromJson(json);
}

/// @nodoc
mixin _$PaginatedStockAlertList {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<StockAlert> get results => throw _privateConstructorUsedError;

  /// Serializes this PaginatedStockAlertList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedStockAlertList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedStockAlertListCopyWith<PaginatedStockAlertList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedStockAlertListCopyWith<$Res> {
  factory $PaginatedStockAlertListCopyWith(PaginatedStockAlertList value,
          $Res Function(PaginatedStockAlertList) then) =
      _$PaginatedStockAlertListCopyWithImpl<$Res, PaginatedStockAlertList>;
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<StockAlert> results});
}

/// @nodoc
class _$PaginatedStockAlertListCopyWithImpl<$Res,
        $Val extends PaginatedStockAlertList>
    implements $PaginatedStockAlertListCopyWith<$Res> {
  _$PaginatedStockAlertListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedStockAlertList
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
              as List<StockAlert>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedStockAlertListImplCopyWith<$Res>
    implements $PaginatedStockAlertListCopyWith<$Res> {
  factory _$$PaginatedStockAlertListImplCopyWith(
          _$PaginatedStockAlertListImpl value,
          $Res Function(_$PaginatedStockAlertListImpl) then) =
      __$$PaginatedStockAlertListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<StockAlert> results});
}

/// @nodoc
class __$$PaginatedStockAlertListImplCopyWithImpl<$Res>
    extends _$PaginatedStockAlertListCopyWithImpl<$Res,
        _$PaginatedStockAlertListImpl>
    implements _$$PaginatedStockAlertListImplCopyWith<$Res> {
  __$$PaginatedStockAlertListImplCopyWithImpl(
      _$PaginatedStockAlertListImpl _value,
      $Res Function(_$PaginatedStockAlertListImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedStockAlertList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PaginatedStockAlertListImpl(
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
              as List<StockAlert>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedStockAlertListImpl implements _PaginatedStockAlertList {
  const _$PaginatedStockAlertListImpl(
      {required this.count,
      this.next,
      this.previous,
      required final List<StockAlert> results})
      : _results = results;

  factory _$PaginatedStockAlertListImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedStockAlertListImplFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<StockAlert> _results;
  @override
  List<StockAlert> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PaginatedStockAlertList(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedStockAlertListImpl &&
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

  /// Create a copy of PaginatedStockAlertList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedStockAlertListImplCopyWith<_$PaginatedStockAlertListImpl>
      get copyWith => __$$PaginatedStockAlertListImplCopyWithImpl<
          _$PaginatedStockAlertListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedStockAlertListImplToJson(
      this,
    );
  }
}

abstract class _PaginatedStockAlertList implements PaginatedStockAlertList {
  const factory _PaginatedStockAlertList(
      {required final int count,
      final String? next,
      final String? previous,
      required final List<StockAlert> results}) = _$PaginatedStockAlertListImpl;

  factory _PaginatedStockAlertList.fromJson(Map<String, dynamic> json) =
      _$PaginatedStockAlertListImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<StockAlert> get results;

  /// Create a copy of PaginatedStockAlertList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedStockAlertListImplCopyWith<_$PaginatedStockAlertListImpl>
      get copyWith => throw _privateConstructorUsedError;
}
