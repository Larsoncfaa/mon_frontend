// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_proof.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatchedProof _$PatchedProofFromJson(Map<String, dynamic> json) {
  return _PatchedProof.fromJson(json);
}

/// @nodoc
mixin _$PatchedProof {
  int? get id => throw _privateConstructorUsedError;
  int? get delivery => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'uploaded_at')
  DateTime? get uploadedAt => throw _privateConstructorUsedError;

  /// Serializes this PatchedProof to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatchedProof
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatchedProofCopyWith<PatchedProof> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatchedProofCopyWith<$Res> {
  factory $PatchedProofCopyWith(
          PatchedProof value, $Res Function(PatchedProof) then) =
      _$PatchedProofCopyWithImpl<$Res, PatchedProof>;
  @useResult
  $Res call(
      {int? id,
      int? delivery,
      String? image,
      @JsonKey(name: 'uploaded_at') DateTime? uploadedAt});
}

/// @nodoc
class _$PatchedProofCopyWithImpl<$Res, $Val extends PatchedProof>
    implements $PatchedProofCopyWith<$Res> {
  _$PatchedProofCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatchedProof
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? delivery = freezed,
    Object? image = freezed,
    Object? uploadedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      delivery: freezed == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedAt: freezed == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatchedProofImplCopyWith<$Res>
    implements $PatchedProofCopyWith<$Res> {
  factory _$$PatchedProofImplCopyWith(
          _$PatchedProofImpl value, $Res Function(_$PatchedProofImpl) then) =
      __$$PatchedProofImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? delivery,
      String? image,
      @JsonKey(name: 'uploaded_at') DateTime? uploadedAt});
}

/// @nodoc
class __$$PatchedProofImplCopyWithImpl<$Res>
    extends _$PatchedProofCopyWithImpl<$Res, _$PatchedProofImpl>
    implements _$$PatchedProofImplCopyWith<$Res> {
  __$$PatchedProofImplCopyWithImpl(
      _$PatchedProofImpl _value, $Res Function(_$PatchedProofImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatchedProof
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? delivery = freezed,
    Object? image = freezed,
    Object? uploadedAt = freezed,
  }) {
    return _then(_$PatchedProofImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      delivery: freezed == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedAt: freezed == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatchedProofImpl implements _PatchedProof {
  const _$PatchedProofImpl(
      {this.id,
      this.delivery,
      this.image,
      @JsonKey(name: 'uploaded_at') this.uploadedAt});

  factory _$PatchedProofImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatchedProofImplFromJson(json);

  @override
  final int? id;
  @override
  final int? delivery;
  @override
  final String? image;
  @override
  @JsonKey(name: 'uploaded_at')
  final DateTime? uploadedAt;

  @override
  String toString() {
    return 'PatchedProof(id: $id, delivery: $delivery, image: $image, uploadedAt: $uploadedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatchedProofImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.delivery, delivery) ||
                other.delivery == delivery) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, delivery, image, uploadedAt);

  /// Create a copy of PatchedProof
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchedProofImplCopyWith<_$PatchedProofImpl> get copyWith =>
      __$$PatchedProofImplCopyWithImpl<_$PatchedProofImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatchedProofImplToJson(
      this,
    );
  }
}

abstract class _PatchedProof implements PatchedProof {
  const factory _PatchedProof(
          {final int? id,
          final int? delivery,
          final String? image,
          @JsonKey(name: 'uploaded_at') final DateTime? uploadedAt}) =
      _$PatchedProofImpl;

  factory _PatchedProof.fromJson(Map<String, dynamic> json) =
      _$PatchedProofImpl.fromJson;

  @override
  int? get id;
  @override
  int? get delivery;
  @override
  String? get image;
  @override
  @JsonKey(name: 'uploaded_at')
  DateTime? get uploadedAt;

  /// Create a copy of PatchedProof
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchedProofImplCopyWith<_$PatchedProofImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
