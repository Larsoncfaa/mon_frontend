// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_client_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedClientProfile _$PaginatedClientProfileFromJson(
    Map<String, dynamic> json) {
  return _PaginatedClientProfile.fromJson(json);
}

/// @nodoc
mixin _$PaginatedClientProfile {
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<ClientProfile> get results => throw _privateConstructorUsedError;

  /// Serializes this PaginatedClientProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedClientProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedClientProfileCopyWith<PaginatedClientProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedClientProfileCopyWith<$Res> {
  factory $PaginatedClientProfileCopyWith(PaginatedClientProfile value,
          $Res Function(PaginatedClientProfile) then) =
      _$PaginatedClientProfileCopyWithImpl<$Res, PaginatedClientProfile>;
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<ClientProfile> results});
}

/// @nodoc
class _$PaginatedClientProfileCopyWithImpl<$Res,
        $Val extends PaginatedClientProfile>
    implements $PaginatedClientProfileCopyWith<$Res> {
  _$PaginatedClientProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedClientProfile
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
              as List<ClientProfile>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedClientProfileImplCopyWith<$Res>
    implements $PaginatedClientProfileCopyWith<$Res> {
  factory _$$PaginatedClientProfileImplCopyWith(
          _$PaginatedClientProfileImpl value,
          $Res Function(_$PaginatedClientProfileImpl) then) =
      __$$PaginatedClientProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count, String? next, String? previous, List<ClientProfile> results});
}

/// @nodoc
class __$$PaginatedClientProfileImplCopyWithImpl<$Res>
    extends _$PaginatedClientProfileCopyWithImpl<$Res,
        _$PaginatedClientProfileImpl>
    implements _$$PaginatedClientProfileImplCopyWith<$Res> {
  __$$PaginatedClientProfileImplCopyWithImpl(
      _$PaginatedClientProfileImpl _value,
      $Res Function(_$PaginatedClientProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedClientProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PaginatedClientProfileImpl(
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
              as List<ClientProfile>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedClientProfileImpl implements _PaginatedClientProfile {
  const _$PaginatedClientProfileImpl(
      {required this.count,
      this.next,
      this.previous,
      required final List<ClientProfile> results})
      : _results = results;

  factory _$PaginatedClientProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedClientProfileImplFromJson(json);

  @override
  final int count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<ClientProfile> _results;
  @override
  List<ClientProfile> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PaginatedClientProfile(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedClientProfileImpl &&
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

  /// Create a copy of PaginatedClientProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedClientProfileImplCopyWith<_$PaginatedClientProfileImpl>
      get copyWith => __$$PaginatedClientProfileImplCopyWithImpl<
          _$PaginatedClientProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedClientProfileImplToJson(
      this,
    );
  }
}

abstract class _PaginatedClientProfile implements PaginatedClientProfile {
  const factory _PaginatedClientProfile(
          {required final int count,
          final String? next,
          final String? previous,
          required final List<ClientProfile> results}) =
      _$PaginatedClientProfileImpl;

  factory _PaginatedClientProfile.fromJson(Map<String, dynamic> json) =
      _$PaginatedClientProfileImpl.fromJson;

  @override
  int get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<ClientProfile> get results;

  /// Create a copy of PaginatedClientProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedClientProfileImplCopyWith<_$PaginatedClientProfileImpl>
      get copyWith => throw _privateConstructorUsedError;
}
