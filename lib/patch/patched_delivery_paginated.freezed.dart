// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_delivery_paginated.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatchedDeliveryPaginated _$PatchedDeliveryPaginatedFromJson(
    Map<String, dynamic> json) {
  return _PatchedDeliveryPaginated.fromJson(json);
}

/// @nodoc
mixin _$PatchedDeliveryPaginated {
  int? get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<PatchedDelivery>? get results => throw _privateConstructorUsedError;

  /// Serializes this PatchedDeliveryPaginated to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatchedDeliveryPaginated
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatchedDeliveryPaginatedCopyWith<PatchedDeliveryPaginated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatchedDeliveryPaginatedCopyWith<$Res> {
  factory $PatchedDeliveryPaginatedCopyWith(PatchedDeliveryPaginated value,
          $Res Function(PatchedDeliveryPaginated) then) =
      _$PatchedDeliveryPaginatedCopyWithImpl<$Res, PatchedDeliveryPaginated>;
  @useResult
  $Res call(
      {int? count,
      String? next,
      String? previous,
      List<PatchedDelivery>? results});
}

/// @nodoc
class _$PatchedDeliveryPaginatedCopyWithImpl<$Res,
        $Val extends PatchedDeliveryPaginated>
    implements $PatchedDeliveryPaginatedCopyWith<$Res> {
  _$PatchedDeliveryPaginatedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatchedDeliveryPaginated
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
              as List<PatchedDelivery>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatchedDeliveryPaginatedImplCopyWith<$Res>
    implements $PatchedDeliveryPaginatedCopyWith<$Res> {
  factory _$$PatchedDeliveryPaginatedImplCopyWith(
          _$PatchedDeliveryPaginatedImpl value,
          $Res Function(_$PatchedDeliveryPaginatedImpl) then) =
      __$$PatchedDeliveryPaginatedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? count,
      String? next,
      String? previous,
      List<PatchedDelivery>? results});
}

/// @nodoc
class __$$PatchedDeliveryPaginatedImplCopyWithImpl<$Res>
    extends _$PatchedDeliveryPaginatedCopyWithImpl<$Res,
        _$PatchedDeliveryPaginatedImpl>
    implements _$$PatchedDeliveryPaginatedImplCopyWith<$Res> {
  __$$PatchedDeliveryPaginatedImplCopyWithImpl(
      _$PatchedDeliveryPaginatedImpl _value,
      $Res Function(_$PatchedDeliveryPaginatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatchedDeliveryPaginated
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_$PatchedDeliveryPaginatedImpl(
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
              as List<PatchedDelivery>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatchedDeliveryPaginatedImpl implements _PatchedDeliveryPaginated {
  const _$PatchedDeliveryPaginatedImpl(
      {this.count,
      this.next,
      this.previous,
      final List<PatchedDelivery>? results})
      : _results = results;

  factory _$PatchedDeliveryPaginatedImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatchedDeliveryPaginatedImplFromJson(json);

  @override
  final int? count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<PatchedDelivery>? _results;
  @override
  List<PatchedDelivery>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PatchedDeliveryPaginated(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatchedDeliveryPaginatedImpl &&
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

  /// Create a copy of PatchedDeliveryPaginated
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchedDeliveryPaginatedImplCopyWith<_$PatchedDeliveryPaginatedImpl>
      get copyWith => __$$PatchedDeliveryPaginatedImplCopyWithImpl<
          _$PatchedDeliveryPaginatedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatchedDeliveryPaginatedImplToJson(
      this,
    );
  }
}

abstract class _PatchedDeliveryPaginated implements PatchedDeliveryPaginated {
  const factory _PatchedDeliveryPaginated(
      {final int? count,
      final String? next,
      final String? previous,
      final List<PatchedDelivery>? results}) = _$PatchedDeliveryPaginatedImpl;

  factory _PatchedDeliveryPaginated.fromJson(Map<String, dynamic> json) =
      _$PatchedDeliveryPaginatedImpl.fromJson;

  @override
  int? get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<PatchedDelivery>? get results;

  /// Create a copy of PatchedDeliveryPaginated
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchedDeliveryPaginatedImplCopyWith<_$PatchedDeliveryPaginatedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
