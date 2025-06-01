// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_invoice_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedInvoiceList _$PaginatedInvoiceListFromJson(Map<String, dynamic> json) {
  return _PaginatedInvoiceList.fromJson(json);
}

/// @nodoc
mixin _$PaginatedInvoiceList {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<Invoice> get results => throw _privateConstructorUsedError;

  /// Serializes this PaginatedInvoiceList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedInvoiceList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedInvoiceListCopyWith<PaginatedInvoiceList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedInvoiceListCopyWith<$Res> {
  factory $PaginatedInvoiceListCopyWith(PaginatedInvoiceList value,
          $Res Function(PaginatedInvoiceList) then) =
      _$PaginatedInvoiceListCopyWithImpl<$Res, PaginatedInvoiceList>;
  @useResult
  $Res call({int count, String? next, String? previous, List<Invoice> results});
}

/// @nodoc
class _$PaginatedInvoiceListCopyWithImpl<$Res,
        $Val extends PaginatedInvoiceList>
    implements $PaginatedInvoiceListCopyWith<$Res> {
  _$PaginatedInvoiceListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedInvoiceList
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
              as List<Invoice>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedInvoiceListImplCopyWith<$Res>
    implements $PaginatedInvoiceListCopyWith<$Res> {
  factory _$$PaginatedInvoiceListImplCopyWith(_$PaginatedInvoiceListImpl value,
          $Res Function(_$PaginatedInvoiceListImpl) then) =
      __$$PaginatedInvoiceListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, String? next, String? previous, List<Invoice> results});
}

/// @nodoc
class __$$PaginatedInvoiceListImplCopyWithImpl<$Res>
    extends _$PaginatedInvoiceListCopyWithImpl<$Res, _$PaginatedInvoiceListImpl>
    implements _$$PaginatedInvoiceListImplCopyWith<$Res> {
  __$$PaginatedInvoiceListImplCopyWithImpl(_$PaginatedInvoiceListImpl _value,
      $Res Function(_$PaginatedInvoiceListImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedInvoiceList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PaginatedInvoiceListImpl(
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
              as List<Invoice>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedInvoiceListImpl implements _PaginatedInvoiceList {
  const _$PaginatedInvoiceListImpl(
      {required this.count,
      this.next,
      this.previous,
      required final List<Invoice> results})
      : _results = results;

  factory _$PaginatedInvoiceListImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedInvoiceListImplFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<Invoice> _results;
  @override
  List<Invoice> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PaginatedInvoiceList(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedInvoiceListImpl &&
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

  /// Create a copy of PaginatedInvoiceList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedInvoiceListImplCopyWith<_$PaginatedInvoiceListImpl>
      get copyWith =>
          __$$PaginatedInvoiceListImplCopyWithImpl<_$PaginatedInvoiceListImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedInvoiceListImplToJson(
      this,
    );
  }
}

abstract class _PaginatedInvoiceList implements PaginatedInvoiceList {
  const factory _PaginatedInvoiceList(
      {required final int count,
      final String? next,
      final String? previous,
      required final List<Invoice> results}) = _$PaginatedInvoiceListImpl;

  factory _PaginatedInvoiceList.fromJson(Map<String, dynamic> json) =
      _$PaginatedInvoiceListImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<Invoice> get results;

  /// Create a copy of PaginatedInvoiceList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedInvoiceListImplCopyWith<_$PaginatedInvoiceListImpl>
      get copyWith => throw _privateConstructorUsedError;
}
