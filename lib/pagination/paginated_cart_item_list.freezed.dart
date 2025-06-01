// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_cart_item_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedCartItemList _$PaginatedCartItemListFromJson(
    Map<String, dynamic> json) {
  return _PaginatedCartItemList.fromJson(json);
}

/// @nodoc
mixin _$PaginatedCartItemList {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<CartItem> get results => throw _privateConstructorUsedError;

  /// Serializes this PaginatedCartItemList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedCartItemList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedCartItemListCopyWith<PaginatedCartItemList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedCartItemListCopyWith<$Res> {
  factory $PaginatedCartItemListCopyWith(PaginatedCartItemList value,
          $Res Function(PaginatedCartItemList) then) =
      _$PaginatedCartItemListCopyWithImpl<$Res, PaginatedCartItemList>;
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<CartItem> results});
}

/// @nodoc
class _$PaginatedCartItemListCopyWithImpl<$Res,
        $Val extends PaginatedCartItemList>
    implements $PaginatedCartItemListCopyWith<$Res> {
  _$PaginatedCartItemListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedCartItemList
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
              as List<CartItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedCartItemListImplCopyWith<$Res>
    implements $PaginatedCartItemListCopyWith<$Res> {
  factory _$$PaginatedCartItemListImplCopyWith(
          _$PaginatedCartItemListImpl value,
          $Res Function(_$PaginatedCartItemListImpl) then) =
      __$$PaginatedCartItemListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<CartItem> results});
}

/// @nodoc
class __$$PaginatedCartItemListImplCopyWithImpl<$Res>
    extends _$PaginatedCartItemListCopyWithImpl<$Res,
        _$PaginatedCartItemListImpl>
    implements _$$PaginatedCartItemListImplCopyWith<$Res> {
  __$$PaginatedCartItemListImplCopyWithImpl(_$PaginatedCartItemListImpl _value,
      $Res Function(_$PaginatedCartItemListImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedCartItemList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PaginatedCartItemListImpl(
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
              as List<CartItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedCartItemListImpl implements _PaginatedCartItemList {
  const _$PaginatedCartItemListImpl(
      {required this.count,
      this.next,
      this.previous,
      required final List<CartItem> results})
      : _results = results;

  factory _$PaginatedCartItemListImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedCartItemListImplFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<CartItem> _results;
  @override
  List<CartItem> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PaginatedCartItemList(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedCartItemListImpl &&
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

  /// Create a copy of PaginatedCartItemList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedCartItemListImplCopyWith<_$PaginatedCartItemListImpl>
      get copyWith => __$$PaginatedCartItemListImplCopyWithImpl<
          _$PaginatedCartItemListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedCartItemListImplToJson(
      this,
    );
  }
}

abstract class _PaginatedCartItemList implements PaginatedCartItemList {
  const factory _PaginatedCartItemList(
      {required final int count,
      final String? next,
      final String? previous,
      required final List<CartItem> results}) = _$PaginatedCartItemListImpl;

  factory _PaginatedCartItemList.fromJson(Map<String, dynamic> json) =
      _$PaginatedCartItemListImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<CartItem> get results;

  /// Create a copy of PaginatedCartItemList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedCartItemListImplCopyWith<_$PaginatedCartItemListImpl>
      get copyWith => throw _privateConstructorUsedError;
}
