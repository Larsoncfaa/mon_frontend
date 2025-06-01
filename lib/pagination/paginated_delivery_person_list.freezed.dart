// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_delivery_person_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedDeliveryPersonList _$PaginatedDeliveryPersonListFromJson(
    Map<String, dynamic> json) {
  return _PaginatedDeliveryPersonList.fromJson(json);
}

/// @nodoc
mixin _$PaginatedDeliveryPersonList {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<DeliveryPerson> get results => throw _privateConstructorUsedError;

  /// Serializes this PaginatedDeliveryPersonList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedDeliveryPersonList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedDeliveryPersonListCopyWith<PaginatedDeliveryPersonList>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedDeliveryPersonListCopyWith<$Res> {
  factory $PaginatedDeliveryPersonListCopyWith(
          PaginatedDeliveryPersonList value,
          $Res Function(PaginatedDeliveryPersonList) then) =
      _$PaginatedDeliveryPersonListCopyWithImpl<$Res,
          PaginatedDeliveryPersonList>;
  @useResult
  $Res call(
      {int count,
      String? next,
      String? previous,
      List<DeliveryPerson> results});
}

/// @nodoc
class _$PaginatedDeliveryPersonListCopyWithImpl<$Res,
        $Val extends PaginatedDeliveryPersonList>
    implements $PaginatedDeliveryPersonListCopyWith<$Res> {
  _$PaginatedDeliveryPersonListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedDeliveryPersonList
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
              as List<DeliveryPerson>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedDeliveryPersonListImplCopyWith<$Res>
    implements $PaginatedDeliveryPersonListCopyWith<$Res> {
  factory _$$PaginatedDeliveryPersonListImplCopyWith(
          _$PaginatedDeliveryPersonListImpl value,
          $Res Function(_$PaginatedDeliveryPersonListImpl) then) =
      __$$PaginatedDeliveryPersonListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count,
      String? next,
      String? previous,
      List<DeliveryPerson> results});
}

/// @nodoc
class __$$PaginatedDeliveryPersonListImplCopyWithImpl<$Res>
    extends _$PaginatedDeliveryPersonListCopyWithImpl<$Res,
        _$PaginatedDeliveryPersonListImpl>
    implements _$$PaginatedDeliveryPersonListImplCopyWith<$Res> {
  __$$PaginatedDeliveryPersonListImplCopyWithImpl(
      _$PaginatedDeliveryPersonListImpl _value,
      $Res Function(_$PaginatedDeliveryPersonListImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedDeliveryPersonList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PaginatedDeliveryPersonListImpl(
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
              as List<DeliveryPerson>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedDeliveryPersonListImpl
    implements _PaginatedDeliveryPersonList {
  const _$PaginatedDeliveryPersonListImpl(
      {required this.count,
      this.next,
      this.previous,
      required final List<DeliveryPerson> results})
      : _results = results;

  factory _$PaginatedDeliveryPersonListImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PaginatedDeliveryPersonListImplFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<DeliveryPerson> _results;
  @override
  List<DeliveryPerson> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PaginatedDeliveryPersonList(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedDeliveryPersonListImpl &&
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

  /// Create a copy of PaginatedDeliveryPersonList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedDeliveryPersonListImplCopyWith<_$PaginatedDeliveryPersonListImpl>
      get copyWith => __$$PaginatedDeliveryPersonListImplCopyWithImpl<
          _$PaginatedDeliveryPersonListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedDeliveryPersonListImplToJson(
      this,
    );
  }
}

abstract class _PaginatedDeliveryPersonList
    implements PaginatedDeliveryPersonList {
  const factory _PaginatedDeliveryPersonList(
          {required final int count,
          final String? next,
          final String? previous,
          required final List<DeliveryPerson> results}) =
      _$PaginatedDeliveryPersonListImpl;

  factory _PaginatedDeliveryPersonList.fromJson(Map<String, dynamic> json) =
      _$PaginatedDeliveryPersonListImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<DeliveryPerson> get results;

  /// Create a copy of PaginatedDeliveryPersonList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedDeliveryPersonListImplCopyWith<_$PaginatedDeliveryPersonListImpl>
      get copyWith => throw _privateConstructorUsedError;
}
