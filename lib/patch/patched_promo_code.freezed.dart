// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_promo_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatchedPromoCode _$PatchedPromoCodeFromJson(Map<String, dynamic> json) {
  return _PatchedPromoCode.fromJson(json);
}

/// @nodoc
mixin _$PatchedPromoCode {
  int? get id => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_percent')
  double? get discountPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'valid_from')
  DateTime? get validFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'valid_to')
  DateTime? get validTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'usage_limit')
  int? get usageLimit => throw _privateConstructorUsedError;

  /// Serializes this PatchedPromoCode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatchedPromoCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatchedPromoCodeCopyWith<PatchedPromoCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatchedPromoCodeCopyWith<$Res> {
  factory $PatchedPromoCodeCopyWith(
          PatchedPromoCode value, $Res Function(PatchedPromoCode) then) =
      _$PatchedPromoCodeCopyWithImpl<$Res, PatchedPromoCode>;
  @useResult
  $Res call(
      {int? id,
      String? code,
      @JsonKey(name: 'discount_percent') double? discountPercent,
      @JsonKey(name: 'valid_from') DateTime? validFrom,
      @JsonKey(name: 'valid_to') DateTime? validTo,
      @JsonKey(name: 'usage_limit') int? usageLimit});
}

/// @nodoc
class _$PatchedPromoCodeCopyWithImpl<$Res, $Val extends PatchedPromoCode>
    implements $PatchedPromoCodeCopyWith<$Res> {
  _$PatchedPromoCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatchedPromoCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? discountPercent = freezed,
    Object? validFrom = freezed,
    Object? validTo = freezed,
    Object? usageLimit = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      discountPercent: freezed == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double?,
      validFrom: freezed == validFrom
          ? _value.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      validTo: freezed == validTo
          ? _value.validTo
          : validTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      usageLimit: freezed == usageLimit
          ? _value.usageLimit
          : usageLimit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatchedPromoCodeImplCopyWith<$Res>
    implements $PatchedPromoCodeCopyWith<$Res> {
  factory _$$PatchedPromoCodeImplCopyWith(_$PatchedPromoCodeImpl value,
          $Res Function(_$PatchedPromoCodeImpl) then) =
      __$$PatchedPromoCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? code,
      @JsonKey(name: 'discount_percent') double? discountPercent,
      @JsonKey(name: 'valid_from') DateTime? validFrom,
      @JsonKey(name: 'valid_to') DateTime? validTo,
      @JsonKey(name: 'usage_limit') int? usageLimit});
}

/// @nodoc
class __$$PatchedPromoCodeImplCopyWithImpl<$Res>
    extends _$PatchedPromoCodeCopyWithImpl<$Res, _$PatchedPromoCodeImpl>
    implements _$$PatchedPromoCodeImplCopyWith<$Res> {
  __$$PatchedPromoCodeImplCopyWithImpl(_$PatchedPromoCodeImpl _value,
      $Res Function(_$PatchedPromoCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatchedPromoCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? discountPercent = freezed,
    Object? validFrom = freezed,
    Object? validTo = freezed,
    Object? usageLimit = freezed,
  }) {
    return _then(_$PatchedPromoCodeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      discountPercent: freezed == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double?,
      validFrom: freezed == validFrom
          ? _value.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      validTo: freezed == validTo
          ? _value.validTo
          : validTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      usageLimit: freezed == usageLimit
          ? _value.usageLimit
          : usageLimit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatchedPromoCodeImpl implements _PatchedPromoCode {
  const _$PatchedPromoCodeImpl(
      {this.id,
      this.code,
      @JsonKey(name: 'discount_percent') this.discountPercent,
      @JsonKey(name: 'valid_from') this.validFrom,
      @JsonKey(name: 'valid_to') this.validTo,
      @JsonKey(name: 'usage_limit') this.usageLimit});

  factory _$PatchedPromoCodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatchedPromoCodeImplFromJson(json);

  @override
  final int? id;
  @override
  final String? code;
  @override
  @JsonKey(name: 'discount_percent')
  final double? discountPercent;
  @override
  @JsonKey(name: 'valid_from')
  final DateTime? validFrom;
  @override
  @JsonKey(name: 'valid_to')
  final DateTime? validTo;
  @override
  @JsonKey(name: 'usage_limit')
  final int? usageLimit;

  @override
  String toString() {
    return 'PatchedPromoCode(id: $id, code: $code, discountPercent: $discountPercent, validFrom: $validFrom, validTo: $validTo, usageLimit: $usageLimit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatchedPromoCodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent) &&
            (identical(other.validFrom, validFrom) ||
                other.validFrom == validFrom) &&
            (identical(other.validTo, validTo) || other.validTo == validTo) &&
            (identical(other.usageLimit, usageLimit) ||
                other.usageLimit == usageLimit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, code, discountPercent, validFrom, validTo, usageLimit);

  /// Create a copy of PatchedPromoCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchedPromoCodeImplCopyWith<_$PatchedPromoCodeImpl> get copyWith =>
      __$$PatchedPromoCodeImplCopyWithImpl<_$PatchedPromoCodeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatchedPromoCodeImplToJson(
      this,
    );
  }
}

abstract class _PatchedPromoCode implements PatchedPromoCode {
  const factory _PatchedPromoCode(
          {final int? id,
          final String? code,
          @JsonKey(name: 'discount_percent') final double? discountPercent,
          @JsonKey(name: 'valid_from') final DateTime? validFrom,
          @JsonKey(name: 'valid_to') final DateTime? validTo,
          @JsonKey(name: 'usage_limit') final int? usageLimit}) =
      _$PatchedPromoCodeImpl;

  factory _PatchedPromoCode.fromJson(Map<String, dynamic> json) =
      _$PatchedPromoCodeImpl.fromJson;

  @override
  int? get id;
  @override
  String? get code;
  @override
  @JsonKey(name: 'discount_percent')
  double? get discountPercent;
  @override
  @JsonKey(name: 'valid_from')
  DateTime? get validFrom;
  @override
  @JsonKey(name: 'valid_to')
  DateTime? get validTo;
  @override
  @JsonKey(name: 'usage_limit')
  int? get usageLimit;

  /// Create a copy of PatchedPromoCode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchedPromoCodeImplCopyWith<_$PatchedPromoCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
