// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeliveryInput _$DeliveryInputFromJson(Map<String, dynamic> json) {
  return _DeliveryInput.fromJson(json);
}

/// @nodoc
mixin _$DeliveryInput {
  /// Dictionnaire contenant 'lat' et 'lng' du client
  Map<String, double> get client => throw _privateConstructorUsedError;

  /// Quantité totale commandée pour l'estimation
  @JsonKey(name: 'total_quantity')
  int get totalQuantity => throw _privateConstructorUsedError;

  /// Serializes this DeliveryInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryInputCopyWith<DeliveryInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryInputCopyWith<$Res> {
  factory $DeliveryInputCopyWith(
          DeliveryInput value, $Res Function(DeliveryInput) then) =
      _$DeliveryInputCopyWithImpl<$Res, DeliveryInput>;
  @useResult
  $Res call(
      {Map<String, double> client,
      @JsonKey(name: 'total_quantity') int totalQuantity});
}

/// @nodoc
class _$DeliveryInputCopyWithImpl<$Res, $Val extends DeliveryInput>
    implements $DeliveryInputCopyWith<$Res> {
  _$DeliveryInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? client = null,
    Object? totalQuantity = null,
  }) {
    return _then(_value.copyWith(
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryInputImplCopyWith<$Res>
    implements $DeliveryInputCopyWith<$Res> {
  factory _$$DeliveryInputImplCopyWith(
          _$DeliveryInputImpl value, $Res Function(_$DeliveryInputImpl) then) =
      __$$DeliveryInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, double> client,
      @JsonKey(name: 'total_quantity') int totalQuantity});
}

/// @nodoc
class __$$DeliveryInputImplCopyWithImpl<$Res>
    extends _$DeliveryInputCopyWithImpl<$Res, _$DeliveryInputImpl>
    implements _$$DeliveryInputImplCopyWith<$Res> {
  __$$DeliveryInputImplCopyWithImpl(
      _$DeliveryInputImpl _value, $Res Function(_$DeliveryInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? client = null,
    Object? totalQuantity = null,
  }) {
    return _then(_$DeliveryInputImpl(
      client: null == client
          ? _value._client
          : client // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryInputImpl implements _DeliveryInput {
  const _$DeliveryInputImpl(
      {required final Map<String, double> client,
      @JsonKey(name: 'total_quantity') required this.totalQuantity})
      : _client = client;

  factory _$DeliveryInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryInputImplFromJson(json);

  /// Dictionnaire contenant 'lat' et 'lng' du client
  final Map<String, double> _client;

  /// Dictionnaire contenant 'lat' et 'lng' du client
  @override
  Map<String, double> get client {
    if (_client is EqualUnmodifiableMapView) return _client;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_client);
  }

  /// Quantité totale commandée pour l'estimation
  @override
  @JsonKey(name: 'total_quantity')
  final int totalQuantity;

  @override
  String toString() {
    return 'DeliveryInput(client: $client, totalQuantity: $totalQuantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryInputImpl &&
            const DeepCollectionEquality().equals(other._client, _client) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_client), totalQuantity);

  /// Create a copy of DeliveryInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryInputImplCopyWith<_$DeliveryInputImpl> get copyWith =>
      __$$DeliveryInputImplCopyWithImpl<_$DeliveryInputImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryInputImplToJson(
      this,
    );
  }
}

abstract class _DeliveryInput implements DeliveryInput {
  const factory _DeliveryInput(
          {required final Map<String, double> client,
          @JsonKey(name: 'total_quantity') required final int totalQuantity}) =
      _$DeliveryInputImpl;

  factory _DeliveryInput.fromJson(Map<String, dynamic> json) =
      _$DeliveryInputImpl.fromJson;

  /// Dictionnaire contenant 'lat' et 'lng' du client
  @override
  Map<String, double> get client;

  /// Quantité totale commandée pour l'estimation
  @override
  @JsonKey(name: 'total_quantity')
  int get totalQuantity;

  /// Create a copy of DeliveryInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryInputImplCopyWith<_$DeliveryInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
