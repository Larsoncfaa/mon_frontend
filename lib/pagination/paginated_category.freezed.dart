// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedCategory _$PaginatedCategoryFromJson(Map<String, dynamic> json) {
  return _PaginatedCategory.fromJson(json);
}

/// @nodoc
mixin _$PaginatedCategory {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<Category> get results => throw _privateConstructorUsedError;

  /// Serializes this PaginatedCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedCategoryCopyWith<PaginatedCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedCategoryCopyWith<$Res> {
  factory $PaginatedCategoryCopyWith(
          PaginatedCategory value, $Res Function(PaginatedCategory) then) =
      _$PaginatedCategoryCopyWithImpl<$Res, PaginatedCategory>;
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<Category> results});
}

/// @nodoc
class _$PaginatedCategoryCopyWithImpl<$Res, $Val extends PaginatedCategory>
    implements $PaginatedCategoryCopyWith<$Res> {
  _$PaginatedCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedCategory
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
              as List<Category>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedCategoryImplCopyWith<$Res>
    implements $PaginatedCategoryCopyWith<$Res> {
  factory _$$PaginatedCategoryImplCopyWith(_$PaginatedCategoryImpl value,
          $Res Function(_$PaginatedCategoryImpl) then) =
      __$$PaginatedCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<Category> results});
}

/// @nodoc
class __$$PaginatedCategoryImplCopyWithImpl<$Res>
    extends _$PaginatedCategoryCopyWithImpl<$Res, _$PaginatedCategoryImpl>
    implements _$$PaginatedCategoryImplCopyWith<$Res> {
  __$$PaginatedCategoryImplCopyWithImpl(_$PaginatedCategoryImpl _value,
      $Res Function(_$PaginatedCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PaginatedCategoryImpl(
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
              as List<Category>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedCategoryImpl implements _PaginatedCategory {
  const _$PaginatedCategoryImpl(
      {required this.count,
      this.next,
      this.previous,
      required final List<Category> results})
      : _results = results;

  factory _$PaginatedCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedCategoryImplFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<Category> _results;
  @override
  List<Category> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PaginatedCategory(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedCategoryImpl &&
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

  /// Create a copy of PaginatedCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedCategoryImplCopyWith<_$PaginatedCategoryImpl> get copyWith =>
      __$$PaginatedCategoryImplCopyWithImpl<_$PaginatedCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedCategoryImplToJson(
      this,
    );
  }
}

abstract class _PaginatedCategory implements PaginatedCategory {
  const factory _PaginatedCategory(
      {required final int count,
      final String? next,
      final String? previous,
      required final List<Category> results}) = _$PaginatedCategoryImpl;

  factory _PaginatedCategory.fromJson(Map<String, dynamic> json) =
      _$PaginatedCategoryImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<Category> get results;

  /// Create a copy of PaginatedCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedCategoryImplCopyWith<_$PaginatedCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
