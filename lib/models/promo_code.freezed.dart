// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promo_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PromoCode _$PromoCodeFromJson(Map<String, dynamic> json) {
  return _PromoCode.fromJson(json);
}

/// @nodoc
mixin _$PromoCode {
  int get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_percent')
  double get discountPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'valid_from')
  DateTime get validFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'valid_to')
  DateTime get validTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'usage_limit')
  int? get usageLimit => throw _privateConstructorUsedError;

  /// Serializes this PromoCode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PromoCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromoCodeCopyWith<PromoCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromoCodeCopyWith<$Res> {
  factory $PromoCodeCopyWith(PromoCode value, $Res Function(PromoCode) then) =
      _$PromoCodeCopyWithImpl<$Res, PromoCode>;
  @useResult
  $Res call(
      {int id,
      String code,
      @JsonKey(name: 'discount_percent') double discountPercent,
      @JsonKey(name: 'valid_from') DateTime validFrom,
      @JsonKey(name: 'valid_to') DateTime validTo,
      @JsonKey(name: 'usage_limit') int? usageLimit});
}

/// @nodoc
class _$PromoCodeCopyWithImpl<$Res, $Val extends PromoCode>
    implements $PromoCodeCopyWith<$Res> {
  _$PromoCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromoCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? discountPercent = null,
    Object? validFrom = null,
    Object? validTo = null,
    Object? usageLimit = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      validFrom: null == validFrom
          ? _value.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as DateTime,
      validTo: null == validTo
          ? _value.validTo
          : validTo // ignore: cast_nullable_to_non_nullable
              as DateTime,
      usageLimit: freezed == usageLimit
          ? _value.usageLimit
          : usageLimit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PromoCodeImplCopyWith<$Res>
    implements $PromoCodeCopyWith<$Res> {
  factory _$$PromoCodeImplCopyWith(
          _$PromoCodeImpl value, $Res Function(_$PromoCodeImpl) then) =
      __$$PromoCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String code,
      @JsonKey(name: 'discount_percent') double discountPercent,
      @JsonKey(name: 'valid_from') DateTime validFrom,
      @JsonKey(name: 'valid_to') DateTime validTo,
      @JsonKey(name: 'usage_limit') int? usageLimit});
}

/// @nodoc
class __$$PromoCodeImplCopyWithImpl<$Res>
    extends _$PromoCodeCopyWithImpl<$Res, _$PromoCodeImpl>
    implements _$$PromoCodeImplCopyWith<$Res> {
  __$$PromoCodeImplCopyWithImpl(
      _$PromoCodeImpl _value, $Res Function(_$PromoCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of PromoCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? discountPercent = null,
    Object? validFrom = null,
    Object? validTo = null,
    Object? usageLimit = freezed,
  }) {
    return _then(_$PromoCodeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      validFrom: null == validFrom
          ? _value.validFrom
          : validFrom // ignore: cast_nullable_to_non_nullable
              as DateTime,
      validTo: null == validTo
          ? _value.validTo
          : validTo // ignore: cast_nullable_to_non_nullable
              as DateTime,
      usageLimit: freezed == usageLimit
          ? _value.usageLimit
          : usageLimit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromoCodeImpl implements _PromoCode {
  const _$PromoCodeImpl(
      {required this.id,
      required this.code,
      @JsonKey(name: 'discount_percent') required this.discountPercent,
      @JsonKey(name: 'valid_from') required this.validFrom,
      @JsonKey(name: 'valid_to') required this.validTo,
      @JsonKey(name: 'usage_limit') this.usageLimit});

  factory _$PromoCodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromoCodeImplFromJson(json);

  @override
  final int id;
  @override
  final String code;
  @override
  @JsonKey(name: 'discount_percent')
  final double discountPercent;
  @override
  @JsonKey(name: 'valid_from')
  final DateTime validFrom;
  @override
  @JsonKey(name: 'valid_to')
  final DateTime validTo;
  @override
  @JsonKey(name: 'usage_limit')
  final int? usageLimit;

  @override
  String toString() {
    return 'PromoCode(id: $id, code: $code, discountPercent: $discountPercent, validFrom: $validFrom, validTo: $validTo, usageLimit: $usageLimit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromoCodeImpl &&
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

  /// Create a copy of PromoCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromoCodeImplCopyWith<_$PromoCodeImpl> get copyWith =>
      __$$PromoCodeImplCopyWithImpl<_$PromoCodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromoCodeImplToJson(
      this,
    );
  }
}

abstract class _PromoCode implements PromoCode {
  const factory _PromoCode(
      {required final int id,
      required final String code,
      @JsonKey(name: 'discount_percent') required final double discountPercent,
      @JsonKey(name: 'valid_from') required final DateTime validFrom,
      @JsonKey(name: 'valid_to') required final DateTime validTo,
      @JsonKey(name: 'usage_limit') final int? usageLimit}) = _$PromoCodeImpl;

  factory _PromoCode.fromJson(Map<String, dynamic> json) =
      _$PromoCodeImpl.fromJson;

  @override
  int get id;
  @override
  String get code;
  @override
  @JsonKey(name: 'discount_percent')
  double get discountPercent;
  @override
  @JsonKey(name: 'valid_from')
  DateTime get validFrom;
  @override
  @JsonKey(name: 'valid_to')
  DateTime get validTo;
  @override
  @JsonKey(name: 'usage_limit')
  int? get usageLimit;

  /// Create a copy of PromoCode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromoCodeImplCopyWith<_$PromoCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
