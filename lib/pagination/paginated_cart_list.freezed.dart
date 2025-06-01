// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_cart_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedCartList _$PaginatedCartListFromJson(Map<String, dynamic> json) {
  return _PaginatedCartList.fromJson(json);
}

/// @nodoc
mixin _$PaginatedCartList {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<Cart> get results => throw _privateConstructorUsedError;

  /// Serializes this PaginatedCartList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedCartList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedCartListCopyWith<PaginatedCartList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedCartListCopyWith<$Res> {
  factory $PaginatedCartListCopyWith(
          PaginatedCartList value, $Res Function(PaginatedCartList) then) =
      _$PaginatedCartListCopyWithImpl<$Res, PaginatedCartList>;
  @useResult
  $Res call({int count, String? next, String? previous, List<Cart> results});
}

/// @nodoc
class _$PaginatedCartListCopyWithImpl<$Res, $Val extends PaginatedCartList>
    implements $PaginatedCartListCopyWith<$Res> {
  _$PaginatedCartListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedCartList
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
              as List<Cart>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedCartListImplCopyWith<$Res>
    implements $PaginatedCartListCopyWith<$Res> {
  factory _$$PaginatedCartListImplCopyWith(_$PaginatedCartListImpl value,
          $Res Function(_$PaginatedCartListImpl) then) =
      __$$PaginatedCartListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, String? next, String? previous, List<Cart> results});
}

/// @nodoc
class __$$PaginatedCartListImplCopyWithImpl<$Res>
    extends _$PaginatedCartListCopyWithImpl<$Res, _$PaginatedCartListImpl>
    implements _$$PaginatedCartListImplCopyWith<$Res> {
  __$$PaginatedCartListImplCopyWithImpl(_$PaginatedCartListImpl _value,
      $Res Function(_$PaginatedCartListImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedCartList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PaginatedCartListImpl(
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
              as List<Cart>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedCartListImpl implements _PaginatedCartList {
  const _$PaginatedCartListImpl(
      {required this.count,
      this.next,
      this.previous,
      required final List<Cart> results})
      : _results = results;

  factory _$PaginatedCartListImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedCartListImplFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<Cart> _results;
  @override
  List<Cart> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PaginatedCartList(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedCartListImpl &&
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

  /// Create a copy of PaginatedCartList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedCartListImplCopyWith<_$PaginatedCartListImpl> get copyWith =>
      __$$PaginatedCartListImplCopyWithImpl<_$PaginatedCartListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedCartListImplToJson(
      this,
    );
  }
}

abstract class _PaginatedCartList implements PaginatedCartList {
  const factory _PaginatedCartList(
      {required final int count,
      final String? next,
      final String? previous,
      required final List<Cart> results}) = _$PaginatedCartListImpl;

  factory _PaginatedCartList.fromJson(Map<String, dynamic> json) =
      _$PaginatedCartListImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<Cart> get results;

  /// Create a copy of PaginatedCartList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedCartListImplCopyWith<_$PaginatedCartListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
