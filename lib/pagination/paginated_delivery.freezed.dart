// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_delivery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedDelivery _$PaginatedDeliveryFromJson(Map<String, dynamic> json) {
  return _PaginatedDelivery.fromJson(json);
}

/// @nodoc
mixin _$PaginatedDelivery {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<Delivery> get results => throw _privateConstructorUsedError;

  /// Serializes this PaginatedDelivery to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedDelivery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedDeliveryCopyWith<PaginatedDelivery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedDeliveryCopyWith<$Res> {
  factory $PaginatedDeliveryCopyWith(
          PaginatedDelivery value, $Res Function(PaginatedDelivery) then) =
      _$PaginatedDeliveryCopyWithImpl<$Res, PaginatedDelivery>;
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<Delivery> results});
}

/// @nodoc
class _$PaginatedDeliveryCopyWithImpl<$Res, $Val extends PaginatedDelivery>
    implements $PaginatedDeliveryCopyWith<$Res> {
  _$PaginatedDeliveryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedDelivery
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
              as List<Delivery>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedDeliveryImplCopyWith<$Res>
    implements $PaginatedDeliveryCopyWith<$Res> {
  factory _$$PaginatedDeliveryImplCopyWith(_$PaginatedDeliveryImpl value,
          $Res Function(_$PaginatedDeliveryImpl) then) =
      __$$PaginatedDeliveryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<Delivery> results});
}

/// @nodoc
class __$$PaginatedDeliveryImplCopyWithImpl<$Res>
    extends _$PaginatedDeliveryCopyWithImpl<$Res, _$PaginatedDeliveryImpl>
    implements _$$PaginatedDeliveryImplCopyWith<$Res> {
  __$$PaginatedDeliveryImplCopyWithImpl(_$PaginatedDeliveryImpl _value,
      $Res Function(_$PaginatedDeliveryImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedDelivery
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PaginatedDeliveryImpl(
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
              as List<Delivery>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedDeliveryImpl implements _PaginatedDelivery {
  const _$PaginatedDeliveryImpl(
      {required this.count,
      this.next,
      this.previous,
      required final List<Delivery> results})
      : _results = results;

  factory _$PaginatedDeliveryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedDeliveryImplFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<Delivery> _results;
  @override
  List<Delivery> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PaginatedDelivery(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedDeliveryImpl &&
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

  /// Create a copy of PaginatedDelivery
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedDeliveryImplCopyWith<_$PaginatedDeliveryImpl> get copyWith =>
      __$$PaginatedDeliveryImplCopyWithImpl<_$PaginatedDeliveryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedDeliveryImplToJson(
      this,
    );
  }
}

abstract class _PaginatedDelivery implements PaginatedDelivery {
  const factory _PaginatedDelivery(
      {required final int count,
      final String? next,
      final String? previous,
      required final List<Delivery> results}) = _$PaginatedDeliveryImpl;

  factory _PaginatedDelivery.fromJson(Map<String, dynamic> json) =
      _$PaginatedDeliveryImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<Delivery> get results;

  /// Create a copy of PaginatedDelivery
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedDeliveryImplCopyWith<_$PaginatedDeliveryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
