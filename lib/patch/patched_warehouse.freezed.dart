// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_warehouse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatchedWarehouse _$PatchedWarehouseFromJson(Map<String, dynamic> json) {
  return _PatchedWarehouse.fromJson(json);
}

/// @nodoc
mixin _$PatchedWarehouse {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;

  /// Serializes this PatchedWarehouse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatchedWarehouse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatchedWarehouseCopyWith<PatchedWarehouse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatchedWarehouseCopyWith<$Res> {
  factory $PatchedWarehouseCopyWith(
          PatchedWarehouse value, $Res Function(PatchedWarehouse) then) =
      _$PatchedWarehouseCopyWithImpl<$Res, PatchedWarehouse>;
  @useResult
  $Res call({int? id, String? name, String? location});
}

/// @nodoc
class _$PatchedWarehouseCopyWithImpl<$Res, $Val extends PatchedWarehouse>
    implements $PatchedWarehouseCopyWith<$Res> {
  _$PatchedWarehouseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatchedWarehouse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatchedWarehouseImplCopyWith<$Res>
    implements $PatchedWarehouseCopyWith<$Res> {
  factory _$$PatchedWarehouseImplCopyWith(_$PatchedWarehouseImpl value,
          $Res Function(_$PatchedWarehouseImpl) then) =
      __$$PatchedWarehouseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, String? location});
}

/// @nodoc
class __$$PatchedWarehouseImplCopyWithImpl<$Res>
    extends _$PatchedWarehouseCopyWithImpl<$Res, _$PatchedWarehouseImpl>
    implements _$$PatchedWarehouseImplCopyWith<$Res> {
  __$$PatchedWarehouseImplCopyWithImpl(_$PatchedWarehouseImpl _value,
      $Res Function(_$PatchedWarehouseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatchedWarehouse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? location = freezed,
  }) {
    return _then(_$PatchedWarehouseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatchedWarehouseImpl implements _PatchedWarehouse {
  const _$PatchedWarehouseImpl({this.id, this.name, this.location});

  factory _$PatchedWarehouseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatchedWarehouseImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? location;

  @override
  String toString() {
    return 'PatchedWarehouse(id: $id, name: $name, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatchedWarehouseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, location);

  /// Create a copy of PatchedWarehouse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchedWarehouseImplCopyWith<_$PatchedWarehouseImpl> get copyWith =>
      __$$PatchedWarehouseImplCopyWithImpl<_$PatchedWarehouseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatchedWarehouseImplToJson(
      this,
    );
  }
}

abstract class _PatchedWarehouse implements PatchedWarehouse {
  const factory _PatchedWarehouse(
      {final int? id,
      final String? name,
      final String? location}) = _$PatchedWarehouseImpl;

  factory _PatchedWarehouse.fromJson(Map<String, dynamic> json) =
      _$PatchedWarehouseImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get location;

  /// Create a copy of PatchedWarehouse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchedWarehouseImplCopyWith<_$PatchedWarehouseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
