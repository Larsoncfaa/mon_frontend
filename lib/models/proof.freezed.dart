// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'proof.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Proof _$ProofFromJson(Map<String, dynamic> json) {
  return _Proof.fromJson(json);
}

/// @nodoc
mixin _$Proof {
  int get id => throw _privateConstructorUsedError;
  int get delivery => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'uploaded_at')
  DateTime get uploadedAt => throw _privateConstructorUsedError;

  /// Serializes this Proof to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Proof
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProofCopyWith<Proof> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProofCopyWith<$Res> {
  factory $ProofCopyWith(Proof value, $Res Function(Proof) then) =
      _$ProofCopyWithImpl<$Res, Proof>;
  @useResult
  $Res call(
      {int id,
      int delivery,
      String image,
      @JsonKey(name: 'uploaded_at') DateTime uploadedAt});
}

/// @nodoc
class _$ProofCopyWithImpl<$Res, $Val extends Proof>
    implements $ProofCopyWith<$Res> {
  _$ProofCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Proof
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? delivery = null,
    Object? image = null,
    Object? uploadedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      delivery: null == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProofImplCopyWith<$Res> implements $ProofCopyWith<$Res> {
  factory _$$ProofImplCopyWith(
          _$ProofImpl value, $Res Function(_$ProofImpl) then) =
      __$$ProofImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int delivery,
      String image,
      @JsonKey(name: 'uploaded_at') DateTime uploadedAt});
}

/// @nodoc
class __$$ProofImplCopyWithImpl<$Res>
    extends _$ProofCopyWithImpl<$Res, _$ProofImpl>
    implements _$$ProofImplCopyWith<$Res> {
  __$$ProofImplCopyWithImpl(
      _$ProofImpl _value, $Res Function(_$ProofImpl) _then)
      : super(_value, _then);

  /// Create a copy of Proof
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? delivery = null,
    Object? image = null,
    Object? uploadedAt = null,
  }) {
    return _then(_$ProofImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      delivery: null == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedAt: null == uploadedAt
          ? _value.uploadedAt
          : uploadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProofImpl implements _Proof {
  const _$ProofImpl(
      {required this.id,
      required this.delivery,
      required this.image,
      @JsonKey(name: 'uploaded_at') required this.uploadedAt});

  factory _$ProofImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProofImplFromJson(json);

  @override
  final int id;
  @override
  final int delivery;
  @override
  final String image;
  @override
  @JsonKey(name: 'uploaded_at')
  final DateTime uploadedAt;

  @override
  String toString() {
    return 'Proof(id: $id, delivery: $delivery, image: $image, uploadedAt: $uploadedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProofImpl &&
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

  /// Create a copy of Proof
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProofImplCopyWith<_$ProofImpl> get copyWith =>
      __$$ProofImplCopyWithImpl<_$ProofImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProofImplToJson(
      this,
    );
  }
}

abstract class _Proof implements Proof {
  const factory _Proof(
          {required final int id,
          required final int delivery,
          required final String image,
          @JsonKey(name: 'uploaded_at') required final DateTime uploadedAt}) =
      _$ProofImpl;

  factory _Proof.fromJson(Map<String, dynamic> json) = _$ProofImpl.fromJson;

  @override
  int get id;
  @override
  int get delivery;
  @override
  String get image;
  @override
  @JsonKey(name: 'uploaded_at')
  DateTime get uploadedAt;

  /// Create a copy of Proof
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProofImplCopyWith<_$ProofImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
