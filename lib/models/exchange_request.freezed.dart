// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exchange_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExchangeRequest _$ExchangeRequestFromJson(Map<String, dynamic> json) {
  return _ExchangeRequest.fromJson(json);
}

/// @nodoc
mixin _$ExchangeRequest {
  int get id => throw _privateConstructorUsedError;
  int get returnRequest => throw _privateConstructorUsedError;
  int get replacement => throw _privateConstructorUsedError;
  String get requestedProduct => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  ExchangeStatusEnum? get exchangeStatus => throw _privateConstructorUsedError;

  /// Serializes this ExchangeRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExchangeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExchangeRequestCopyWith<ExchangeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExchangeRequestCopyWith<$Res> {
  factory $ExchangeRequestCopyWith(
          ExchangeRequest value, $Res Function(ExchangeRequest) then) =
      _$ExchangeRequestCopyWithImpl<$Res, ExchangeRequest>;
  @useResult
  $Res call(
      {int id,
      int returnRequest,
      int replacement,
      String requestedProduct,
      String reason,
      ExchangeStatusEnum? exchangeStatus});
}

/// @nodoc
class _$ExchangeRequestCopyWithImpl<$Res, $Val extends ExchangeRequest>
    implements $ExchangeRequestCopyWith<$Res> {
  _$ExchangeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExchangeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? returnRequest = null,
    Object? replacement = null,
    Object? requestedProduct = null,
    Object? reason = null,
    Object? exchangeStatus = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      returnRequest: null == returnRequest
          ? _value.returnRequest
          : returnRequest // ignore: cast_nullable_to_non_nullable
              as int,
      replacement: null == replacement
          ? _value.replacement
          : replacement // ignore: cast_nullable_to_non_nullable
              as int,
      requestedProduct: null == requestedProduct
          ? _value.requestedProduct
          : requestedProduct // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      exchangeStatus: freezed == exchangeStatus
          ? _value.exchangeStatus
          : exchangeStatus // ignore: cast_nullable_to_non_nullable
              as ExchangeStatusEnum?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExchangeRequestImplCopyWith<$Res>
    implements $ExchangeRequestCopyWith<$Res> {
  factory _$$ExchangeRequestImplCopyWith(_$ExchangeRequestImpl value,
          $Res Function(_$ExchangeRequestImpl) then) =
      __$$ExchangeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int returnRequest,
      int replacement,
      String requestedProduct,
      String reason,
      ExchangeStatusEnum? exchangeStatus});
}

/// @nodoc
class __$$ExchangeRequestImplCopyWithImpl<$Res>
    extends _$ExchangeRequestCopyWithImpl<$Res, _$ExchangeRequestImpl>
    implements _$$ExchangeRequestImplCopyWith<$Res> {
  __$$ExchangeRequestImplCopyWithImpl(
      _$ExchangeRequestImpl _value, $Res Function(_$ExchangeRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExchangeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? returnRequest = null,
    Object? replacement = null,
    Object? requestedProduct = null,
    Object? reason = null,
    Object? exchangeStatus = freezed,
  }) {
    return _then(_$ExchangeRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      returnRequest: null == returnRequest
          ? _value.returnRequest
          : returnRequest // ignore: cast_nullable_to_non_nullable
              as int,
      replacement: null == replacement
          ? _value.replacement
          : replacement // ignore: cast_nullable_to_non_nullable
              as int,
      requestedProduct: null == requestedProduct
          ? _value.requestedProduct
          : requestedProduct // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      exchangeStatus: freezed == exchangeStatus
          ? _value.exchangeStatus
          : exchangeStatus // ignore: cast_nullable_to_non_nullable
              as ExchangeStatusEnum?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExchangeRequestImpl implements _ExchangeRequest {
  const _$ExchangeRequestImpl(
      {required this.id,
      required this.returnRequest,
      required this.replacement,
      required this.requestedProduct,
      required this.reason,
      this.exchangeStatus});

  factory _$ExchangeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExchangeRequestImplFromJson(json);

  @override
  final int id;
  @override
  final int returnRequest;
  @override
  final int replacement;
  @override
  final String requestedProduct;
  @override
  final String reason;
  @override
  final ExchangeStatusEnum? exchangeStatus;

  @override
  String toString() {
    return 'ExchangeRequest(id: $id, returnRequest: $returnRequest, replacement: $replacement, requestedProduct: $requestedProduct, reason: $reason, exchangeStatus: $exchangeStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExchangeRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.returnRequest, returnRequest) ||
                other.returnRequest == returnRequest) &&
            (identical(other.replacement, replacement) ||
                other.replacement == replacement) &&
            (identical(other.requestedProduct, requestedProduct) ||
                other.requestedProduct == requestedProduct) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.exchangeStatus, exchangeStatus) ||
                other.exchangeStatus == exchangeStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, returnRequest, replacement,
      requestedProduct, reason, exchangeStatus);

  /// Create a copy of ExchangeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExchangeRequestImplCopyWith<_$ExchangeRequestImpl> get copyWith =>
      __$$ExchangeRequestImplCopyWithImpl<_$ExchangeRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExchangeRequestImplToJson(
      this,
    );
  }
}

abstract class _ExchangeRequest implements ExchangeRequest {
  const factory _ExchangeRequest(
      {required final int id,
      required final int returnRequest,
      required final int replacement,
      required final String requestedProduct,
      required final String reason,
      final ExchangeStatusEnum? exchangeStatus}) = _$ExchangeRequestImpl;

  factory _ExchangeRequest.fromJson(Map<String, dynamic> json) =
      _$ExchangeRequestImpl.fromJson;

  @override
  int get id;
  @override
  int get returnRequest;
  @override
  int get replacement;
  @override
  String get requestedProduct;
  @override
  String get reason;
  @override
  ExchangeStatusEnum? get exchangeStatus;

  /// Create a copy of ExchangeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExchangeRequestImplCopyWith<_$ExchangeRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
