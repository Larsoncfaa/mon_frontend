// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_payment_log_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedPaymentLogList _$PaginatedPaymentLogListFromJson(
    Map<String, dynamic> json) {
  return _PaginatedPaymentLogList.fromJson(json);
}

/// @nodoc
mixin _$PaginatedPaymentLogList {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<PaymentLog> get results => throw _privateConstructorUsedError;

  /// Serializes this PaginatedPaymentLogList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedPaymentLogList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedPaymentLogListCopyWith<PaginatedPaymentLogList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedPaymentLogListCopyWith<$Res> {
  factory $PaginatedPaymentLogListCopyWith(PaginatedPaymentLogList value,
          $Res Function(PaginatedPaymentLogList) then) =
      _$PaginatedPaymentLogListCopyWithImpl<$Res, PaginatedPaymentLogList>;
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<PaymentLog> results});
}

/// @nodoc
class _$PaginatedPaymentLogListCopyWithImpl<$Res,
        $Val extends PaginatedPaymentLogList>
    implements $PaginatedPaymentLogListCopyWith<$Res> {
  _$PaginatedPaymentLogListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedPaymentLogList
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
              as List<PaymentLog>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedPaymentLogListImplCopyWith<$Res>
    implements $PaginatedPaymentLogListCopyWith<$Res> {
  factory _$$PaginatedPaymentLogListImplCopyWith(
          _$PaginatedPaymentLogListImpl value,
          $Res Function(_$PaginatedPaymentLogListImpl) then) =
      __$$PaginatedPaymentLogListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<PaymentLog> results});
}

/// @nodoc
class __$$PaginatedPaymentLogListImplCopyWithImpl<$Res>
    extends _$PaginatedPaymentLogListCopyWithImpl<$Res,
        _$PaginatedPaymentLogListImpl>
    implements _$$PaginatedPaymentLogListImplCopyWith<$Res> {
  __$$PaginatedPaymentLogListImplCopyWithImpl(
      _$PaginatedPaymentLogListImpl _value,
      $Res Function(_$PaginatedPaymentLogListImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedPaymentLogList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PaginatedPaymentLogListImpl(
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
              as List<PaymentLog>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedPaymentLogListImpl implements _PaginatedPaymentLogList {
  const _$PaginatedPaymentLogListImpl(
      {required this.count,
      this.next,
      this.previous,
      required final List<PaymentLog> results})
      : _results = results;

  factory _$PaginatedPaymentLogListImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedPaymentLogListImplFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<PaymentLog> _results;
  @override
  List<PaymentLog> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PaginatedPaymentLogList(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedPaymentLogListImpl &&
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

  /// Create a copy of PaginatedPaymentLogList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedPaymentLogListImplCopyWith<_$PaginatedPaymentLogListImpl>
      get copyWith => __$$PaginatedPaymentLogListImplCopyWithImpl<
          _$PaginatedPaymentLogListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedPaymentLogListImplToJson(
      this,
    );
  }
}

abstract class _PaginatedPaymentLogList implements PaginatedPaymentLogList {
  const factory _PaginatedPaymentLogList(
      {required final int count,
      final String? next,
      final String? previous,
      required final List<PaymentLog> results}) = _$PaginatedPaymentLogListImpl;

  factory _PaginatedPaymentLogList.fromJson(Map<String, dynamic> json) =
      _$PaginatedPaymentLogListImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<PaymentLog> get results;

  /// Create a copy of PaginatedPaymentLogList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedPaymentLogListImplCopyWith<_$PaginatedPaymentLogListImpl>
      get copyWith => throw _privateConstructorUsedError;
}
