// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_exchange_request_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedExchangeRequestList _$PaginatedExchangeRequestListFromJson(
    Map<String, dynamic> json) {
  return _PaginatedExchangeRequestList.fromJson(json);
}

/// @nodoc
mixin _$PaginatedExchangeRequestList {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<ExchangeRequest> get results => throw _privateConstructorUsedError;

  /// Serializes this PaginatedExchangeRequestList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedExchangeRequestList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedExchangeRequestListCopyWith<PaginatedExchangeRequestList>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedExchangeRequestListCopyWith<$Res> {
  factory $PaginatedExchangeRequestListCopyWith(
          PaginatedExchangeRequestList value,
          $Res Function(PaginatedExchangeRequestList) then) =
      _$PaginatedExchangeRequestListCopyWithImpl<$Res,
          PaginatedExchangeRequestList>;
  @useResult
  $Res call(
      {int count,
      String? next,
      String? previous,
      List<ExchangeRequest> results});
}

/// @nodoc
class _$PaginatedExchangeRequestListCopyWithImpl<$Res,
        $Val extends PaginatedExchangeRequestList>
    implements $PaginatedExchangeRequestListCopyWith<$Res> {
  _$PaginatedExchangeRequestListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedExchangeRequestList
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
              as List<ExchangeRequest>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedExchangeRequestListImplCopyWith<$Res>
    implements $PaginatedExchangeRequestListCopyWith<$Res> {
  factory _$$PaginatedExchangeRequestListImplCopyWith(
          _$PaginatedExchangeRequestListImpl value,
          $Res Function(_$PaginatedExchangeRequestListImpl) then) =
      __$$PaginatedExchangeRequestListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count,
      String? next,
      String? previous,
      List<ExchangeRequest> results});
}

/// @nodoc
class __$$PaginatedExchangeRequestListImplCopyWithImpl<$Res>
    extends _$PaginatedExchangeRequestListCopyWithImpl<$Res,
        _$PaginatedExchangeRequestListImpl>
    implements _$$PaginatedExchangeRequestListImplCopyWith<$Res> {
  __$$PaginatedExchangeRequestListImplCopyWithImpl(
      _$PaginatedExchangeRequestListImpl _value,
      $Res Function(_$PaginatedExchangeRequestListImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedExchangeRequestList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PaginatedExchangeRequestListImpl(
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
              as List<ExchangeRequest>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedExchangeRequestListImpl
    implements _PaginatedExchangeRequestList {
  const _$PaginatedExchangeRequestListImpl(
      {required this.count,
      this.next,
      this.previous,
      required final List<ExchangeRequest> results})
      : _results = results;

  factory _$PaginatedExchangeRequestListImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PaginatedExchangeRequestListImplFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<ExchangeRequest> _results;
  @override
  List<ExchangeRequest> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PaginatedExchangeRequestList(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedExchangeRequestListImpl &&
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

  /// Create a copy of PaginatedExchangeRequestList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedExchangeRequestListImplCopyWith<
          _$PaginatedExchangeRequestListImpl>
      get copyWith => __$$PaginatedExchangeRequestListImplCopyWithImpl<
          _$PaginatedExchangeRequestListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedExchangeRequestListImplToJson(
      this,
    );
  }
}

abstract class _PaginatedExchangeRequestList
    implements PaginatedExchangeRequestList {
  const factory _PaginatedExchangeRequestList(
          {required final int count,
          final String? next,
          final String? previous,
          required final List<ExchangeRequest> results}) =
      _$PaginatedExchangeRequestListImpl;

  factory _PaginatedExchangeRequestList.fromJson(Map<String, dynamic> json) =
      _$PaginatedExchangeRequestListImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<ExchangeRequest> get results;

  /// Create a copy of PaginatedExchangeRequestList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedExchangeRequestListImplCopyWith<
          _$PaginatedExchangeRequestListImpl>
      get copyWith => throw _privateConstructorUsedError;
}
