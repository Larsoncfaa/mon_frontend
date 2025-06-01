// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_exchange_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatchedExchangeRequest _$PatchedExchangeRequestFromJson(
    Map<String, dynamic> json) {
  return _PatchedExchangeRequest.fromJson(json);
}

/// @nodoc
mixin _$PatchedExchangeRequest {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'return_request')
  int? get returnRequest => throw _privateConstructorUsedError;
  int? get replacement => throw _privateConstructorUsedError;
  @JsonKey(name: 'exchange_status')
  ExchangeStatusEnum? get exchangeStatus => throw _privateConstructorUsedError;

  /// Serializes this PatchedExchangeRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatchedExchangeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatchedExchangeRequestCopyWith<PatchedExchangeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatchedExchangeRequestCopyWith<$Res> {
  factory $PatchedExchangeRequestCopyWith(PatchedExchangeRequest value,
          $Res Function(PatchedExchangeRequest) then) =
      _$PatchedExchangeRequestCopyWithImpl<$Res, PatchedExchangeRequest>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'return_request') int? returnRequest,
      int? replacement,
      @JsonKey(name: 'exchange_status') ExchangeStatusEnum? exchangeStatus});
}

/// @nodoc
class _$PatchedExchangeRequestCopyWithImpl<$Res,
        $Val extends PatchedExchangeRequest>
    implements $PatchedExchangeRequestCopyWith<$Res> {
  _$PatchedExchangeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatchedExchangeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? returnRequest = freezed,
    Object? replacement = freezed,
    Object? exchangeStatus = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      returnRequest: freezed == returnRequest
          ? _value.returnRequest
          : returnRequest // ignore: cast_nullable_to_non_nullable
              as int?,
      replacement: freezed == replacement
          ? _value.replacement
          : replacement // ignore: cast_nullable_to_non_nullable
              as int?,
      exchangeStatus: freezed == exchangeStatus
          ? _value.exchangeStatus
          : exchangeStatus // ignore: cast_nullable_to_non_nullable
              as ExchangeStatusEnum?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatchedExchangeRequestImplCopyWith<$Res>
    implements $PatchedExchangeRequestCopyWith<$Res> {
  factory _$$PatchedExchangeRequestImplCopyWith(
          _$PatchedExchangeRequestImpl value,
          $Res Function(_$PatchedExchangeRequestImpl) then) =
      __$$PatchedExchangeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'return_request') int? returnRequest,
      int? replacement,
      @JsonKey(name: 'exchange_status') ExchangeStatusEnum? exchangeStatus});
}

/// @nodoc
class __$$PatchedExchangeRequestImplCopyWithImpl<$Res>
    extends _$PatchedExchangeRequestCopyWithImpl<$Res,
        _$PatchedExchangeRequestImpl>
    implements _$$PatchedExchangeRequestImplCopyWith<$Res> {
  __$$PatchedExchangeRequestImplCopyWithImpl(
      _$PatchedExchangeRequestImpl _value,
      $Res Function(_$PatchedExchangeRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatchedExchangeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? returnRequest = freezed,
    Object? replacement = freezed,
    Object? exchangeStatus = freezed,
  }) {
    return _then(_$PatchedExchangeRequestImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      returnRequest: freezed == returnRequest
          ? _value.returnRequest
          : returnRequest // ignore: cast_nullable_to_non_nullable
              as int?,
      replacement: freezed == replacement
          ? _value.replacement
          : replacement // ignore: cast_nullable_to_non_nullable
              as int?,
      exchangeStatus: freezed == exchangeStatus
          ? _value.exchangeStatus
          : exchangeStatus // ignore: cast_nullable_to_non_nullable
              as ExchangeStatusEnum?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatchedExchangeRequestImpl implements _PatchedExchangeRequest {
  const _$PatchedExchangeRequestImpl(
      {this.id,
      @JsonKey(name: 'return_request') this.returnRequest,
      this.replacement,
      @JsonKey(name: 'exchange_status') this.exchangeStatus});

  factory _$PatchedExchangeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatchedExchangeRequestImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'return_request')
  final int? returnRequest;
  @override
  final int? replacement;
  @override
  @JsonKey(name: 'exchange_status')
  final ExchangeStatusEnum? exchangeStatus;

  @override
  String toString() {
    return 'PatchedExchangeRequest(id: $id, returnRequest: $returnRequest, replacement: $replacement, exchangeStatus: $exchangeStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatchedExchangeRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.returnRequest, returnRequest) ||
                other.returnRequest == returnRequest) &&
            (identical(other.replacement, replacement) ||
                other.replacement == replacement) &&
            (identical(other.exchangeStatus, exchangeStatus) ||
                other.exchangeStatus == exchangeStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, returnRequest, replacement, exchangeStatus);

  /// Create a copy of PatchedExchangeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchedExchangeRequestImplCopyWith<_$PatchedExchangeRequestImpl>
      get copyWith => __$$PatchedExchangeRequestImplCopyWithImpl<
          _$PatchedExchangeRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatchedExchangeRequestImplToJson(
      this,
    );
  }
}

abstract class _PatchedExchangeRequest implements PatchedExchangeRequest {
  const factory _PatchedExchangeRequest(
      {final int? id,
      @JsonKey(name: 'return_request') final int? returnRequest,
      final int? replacement,
      @JsonKey(name: 'exchange_status')
      final ExchangeStatusEnum? exchangeStatus}) = _$PatchedExchangeRequestImpl;

  factory _PatchedExchangeRequest.fromJson(Map<String, dynamic> json) =
      _$PatchedExchangeRequestImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'return_request')
  int? get returnRequest;
  @override
  int? get replacement;
  @override
  @JsonKey(name: 'exchange_status')
  ExchangeStatusEnum? get exchangeStatus;

  /// Create a copy of PatchedExchangeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchedExchangeRequestImplCopyWith<_$PatchedExchangeRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
