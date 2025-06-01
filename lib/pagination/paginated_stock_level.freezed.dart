// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_stock_level.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedStockLevel _$PaginatedStockLevelFromJson(Map<String, dynamic> json) {
  return _PaginatedStockLevel.fromJson(json);
}

/// @nodoc
mixin _$PaginatedStockLevel {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<StockLevel> get results => throw _privateConstructorUsedError;

  /// Serializes this PaginatedStockLevel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedStockLevel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedStockLevelCopyWith<PaginatedStockLevel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedStockLevelCopyWith<$Res> {
  factory $PaginatedStockLevelCopyWith(
          PaginatedStockLevel value, $Res Function(PaginatedStockLevel) then) =
      _$PaginatedStockLevelCopyWithImpl<$Res, PaginatedStockLevel>;
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<StockLevel> results});
}

/// @nodoc
class _$PaginatedStockLevelCopyWithImpl<$Res, $Val extends PaginatedStockLevel>
    implements $PaginatedStockLevelCopyWith<$Res> {
  _$PaginatedStockLevelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedStockLevel
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
              as List<StockLevel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedStockLevelImplCopyWith<$Res>
    implements $PaginatedStockLevelCopyWith<$Res> {
  factory _$$PaginatedStockLevelImplCopyWith(_$PaginatedStockLevelImpl value,
          $Res Function(_$PaginatedStockLevelImpl) then) =
      __$$PaginatedStockLevelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<StockLevel> results});
}

/// @nodoc
class __$$PaginatedStockLevelImplCopyWithImpl<$Res>
    extends _$PaginatedStockLevelCopyWithImpl<$Res, _$PaginatedStockLevelImpl>
    implements _$$PaginatedStockLevelImplCopyWith<$Res> {
  __$$PaginatedStockLevelImplCopyWithImpl(_$PaginatedStockLevelImpl _value,
      $Res Function(_$PaginatedStockLevelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedStockLevel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PaginatedStockLevelImpl(
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
              as List<StockLevel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedStockLevelImpl implements _PaginatedStockLevel {
  const _$PaginatedStockLevelImpl(
      {required this.count,
      this.next,
      this.previous,
      required final List<StockLevel> results})
      : _results = results;

  factory _$PaginatedStockLevelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedStockLevelImplFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<StockLevel> _results;
  @override
  List<StockLevel> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PaginatedStockLevel(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedStockLevelImpl &&
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

  /// Create a copy of PaginatedStockLevel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedStockLevelImplCopyWith<_$PaginatedStockLevelImpl> get copyWith =>
      __$$PaginatedStockLevelImplCopyWithImpl<_$PaginatedStockLevelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedStockLevelImplToJson(
      this,
    );
  }
}

abstract class _PaginatedStockLevel implements PaginatedStockLevel {
  const factory _PaginatedStockLevel(
      {required final int count,
      final String? next,
      final String? previous,
      required final List<StockLevel> results}) = _$PaginatedStockLevelImpl;

  factory _PaginatedStockLevel.fromJson(Map<String, dynamic> json) =
      _$PaginatedStockLevelImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<StockLevel> get results;

  /// Create a copy of PaginatedStockLevel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedStockLevelImplCopyWith<_$PaginatedStockLevelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
