// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selection_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SelectionResponse _$SelectionResponseFromJson(Map<String, dynamic> json) {
  return _SelectionResponse.fromJson(json);
}

/// @nodoc
mixin _$SelectionResponse {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<Selection> get results => throw _privateConstructorUsedError;

  /// Serializes this SelectionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SelectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SelectionResponseCopyWith<SelectionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectionResponseCopyWith<$Res> {
  factory $SelectionResponseCopyWith(
          SelectionResponse value, $Res Function(SelectionResponse) then) =
      _$SelectionResponseCopyWithImpl<$Res, SelectionResponse>;
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<Selection> results});
}

/// @nodoc
class _$SelectionResponseCopyWithImpl<$Res, $Val extends SelectionResponse>
    implements $SelectionResponseCopyWith<$Res> {
  _$SelectionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SelectionResponse
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
              as List<Selection>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectionResponseImplCopyWith<$Res>
    implements $SelectionResponseCopyWith<$Res> {
  factory _$$SelectionResponseImplCopyWith(_$SelectionResponseImpl value,
          $Res Function(_$SelectionResponseImpl) then) =
      __$$SelectionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<Selection> results});
}

/// @nodoc
class __$$SelectionResponseImplCopyWithImpl<$Res>
    extends _$SelectionResponseCopyWithImpl<$Res, _$SelectionResponseImpl>
    implements _$$SelectionResponseImplCopyWith<$Res> {
  __$$SelectionResponseImplCopyWithImpl(_$SelectionResponseImpl _value,
      $Res Function(_$SelectionResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SelectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$SelectionResponseImpl(
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
              as List<Selection>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$SelectionResponseImpl implements _SelectionResponse {
  const _$SelectionResponseImpl(
      {required this.count,
      this.next,
      this.previous,
      required final List<Selection> results})
      : _results = results;

  factory _$SelectionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectionResponseImplFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<Selection> _results;
  @override
  List<Selection> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'SelectionResponse(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectionResponseImpl &&
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

  /// Create a copy of SelectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectionResponseImplCopyWith<_$SelectionResponseImpl> get copyWith =>
      __$$SelectionResponseImplCopyWithImpl<_$SelectionResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectionResponseImplToJson(
      this,
    );
  }
}

abstract class _SelectionResponse implements SelectionResponse {
  const factory _SelectionResponse(
      {required final int count,
      final String? next,
      final String? previous,
      required final List<Selection> results}) = _$SelectionResponseImpl;

  factory _SelectionResponse.fromJson(Map<String, dynamic> json) =
      _$SelectionResponseImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<Selection> get results;

  /// Create a copy of SelectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectionResponseImplCopyWith<_$SelectionResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
