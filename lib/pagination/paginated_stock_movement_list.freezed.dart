// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_stock_movement_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedStockMovementList _$PaginatedStockMovementListFromJson(
    Map<String, dynamic> json) {
  return _PaginatedStockMovementList.fromJson(json);
}

/// @nodoc
mixin _$PaginatedStockMovementList {
  int get count =>
      throw _privateConstructorUsedError; // Nombre total d’éléments
  String? get next =>
      throw _privateConstructorUsedError; // URL de la page suivante
  String? get previous =>
      throw _privateConstructorUsedError; // URL de la page précédente
  List<StockMovement> get results => throw _privateConstructorUsedError;

  /// Serializes this PaginatedStockMovementList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedStockMovementList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedStockMovementListCopyWith<PaginatedStockMovementList>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedStockMovementListCopyWith<$Res> {
  factory $PaginatedStockMovementListCopyWith(PaginatedStockMovementList value,
          $Res Function(PaginatedStockMovementList) then) =
      _$PaginatedStockMovementListCopyWithImpl<$Res,
          PaginatedStockMovementList>;
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<StockMovement> results});
}

/// @nodoc
class _$PaginatedStockMovementListCopyWithImpl<$Res,
        $Val extends PaginatedStockMovementList>
    implements $PaginatedStockMovementListCopyWith<$Res> {
  _$PaginatedStockMovementListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedStockMovementList
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
              as List<StockMovement>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedStockMovementListImplCopyWith<$Res>
    implements $PaginatedStockMovementListCopyWith<$Res> {
  factory _$$PaginatedStockMovementListImplCopyWith(
          _$PaginatedStockMovementListImpl value,
          $Res Function(_$PaginatedStockMovementListImpl) then) =
      __$$PaginatedStockMovementListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<StockMovement> results});
}

/// @nodoc
class __$$PaginatedStockMovementListImplCopyWithImpl<$Res>
    extends _$PaginatedStockMovementListCopyWithImpl<$Res,
        _$PaginatedStockMovementListImpl>
    implements _$$PaginatedStockMovementListImplCopyWith<$Res> {
  __$$PaginatedStockMovementListImplCopyWithImpl(
      _$PaginatedStockMovementListImpl _value,
      $Res Function(_$PaginatedStockMovementListImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedStockMovementList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PaginatedStockMovementListImpl(
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
              as List<StockMovement>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedStockMovementListImpl implements _PaginatedStockMovementList {
  const _$PaginatedStockMovementListImpl(
      {required this.count,
      this.next,
      this.previous,
      required final List<StockMovement> results})
      : _results = results;

  factory _$PaginatedStockMovementListImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PaginatedStockMovementListImplFromJson(json);

  @override
  final int count;
// Nombre total d’éléments
  @override
  final String? next;
// URL de la page suivante
  @override
  final String? previous;
// URL de la page précédente
  final List<StockMovement> _results;
// URL de la page précédente
  @override
  List<StockMovement> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PaginatedStockMovementList(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedStockMovementListImpl &&
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

  /// Create a copy of PaginatedStockMovementList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedStockMovementListImplCopyWith<_$PaginatedStockMovementListImpl>
      get copyWith => __$$PaginatedStockMovementListImplCopyWithImpl<
          _$PaginatedStockMovementListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedStockMovementListImplToJson(
      this,
    );
  }
}

abstract class _PaginatedStockMovementList
    implements PaginatedStockMovementList {
  const factory _PaginatedStockMovementList(
          {required final int count,
          final String? next,
          final String? previous,
          required final List<StockMovement> results}) =
      _$PaginatedStockMovementListImpl;

  factory _PaginatedStockMovementList.fromJson(Map<String, dynamic> json) =
      _$PaginatedStockMovementListImpl.fromJson;

  @override
  int get count; // Nombre total d’éléments
  @override
  String? get next; // URL de la page suivante
  @override
  String? get previous; // URL de la page précédente
  @override
  List<StockMovement> get results;

  /// Create a copy of PaginatedStockMovementList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedStockMovementListImplCopyWith<_$PaginatedStockMovementListImpl>
      get copyWith => throw _privateConstructorUsedError;
}
