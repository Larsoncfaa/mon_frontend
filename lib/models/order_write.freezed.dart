// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_write.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderWrite _$OrderWriteFromJson(Map<String, dynamic> json) {
  return _OrderWrite.fromJson(json);
}

/// @nodoc
mixin _$OrderWrite {
  int get client => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_status')
  OrderStatusEnum? get orderStatus => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  List<OrderLineWrite> get lines => throw _privateConstructorUsedError;

  /// Serializes this OrderWrite to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OrderWrite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderWriteCopyWith<OrderWrite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderWriteCopyWith<$Res> {
  factory $OrderWriteCopyWith(
          OrderWrite value, $Res Function(OrderWrite) then) =
      _$OrderWriteCopyWithImpl<$Res, OrderWrite>;
  @useResult
  $Res call(
      {int client,
      @JsonKey(name: 'order_status') OrderStatusEnum? orderStatus,
      double total,
      List<OrderLineWrite> lines});
}

/// @nodoc
class _$OrderWriteCopyWithImpl<$Res, $Val extends OrderWrite>
    implements $OrderWriteCopyWith<$Res> {
  _$OrderWriteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderWrite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? client = null,
    Object? orderStatus = freezed,
    Object? total = null,
    Object? lines = null,
  }) {
    return _then(_value.copyWith(
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as int,
      orderStatus: freezed == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as OrderStatusEnum?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      lines: null == lines
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<OrderLineWrite>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderWriteImplCopyWith<$Res>
    implements $OrderWriteCopyWith<$Res> {
  factory _$$OrderWriteImplCopyWith(
          _$OrderWriteImpl value, $Res Function(_$OrderWriteImpl) then) =
      __$$OrderWriteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int client,
      @JsonKey(name: 'order_status') OrderStatusEnum? orderStatus,
      double total,
      List<OrderLineWrite> lines});
}

/// @nodoc
class __$$OrderWriteImplCopyWithImpl<$Res>
    extends _$OrderWriteCopyWithImpl<$Res, _$OrderWriteImpl>
    implements _$$OrderWriteImplCopyWith<$Res> {
  __$$OrderWriteImplCopyWithImpl(
      _$OrderWriteImpl _value, $Res Function(_$OrderWriteImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderWrite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? client = null,
    Object? orderStatus = freezed,
    Object? total = null,
    Object? lines = null,
  }) {
    return _then(_$OrderWriteImpl(
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as int,
      orderStatus: freezed == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as OrderStatusEnum?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      lines: null == lines
          ? _value._lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<OrderLineWrite>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderWriteImpl implements _OrderWrite {
  const _$OrderWriteImpl(
      {required this.client,
      @JsonKey(name: 'order_status') this.orderStatus,
      required this.total,
      required final List<OrderLineWrite> lines})
      : _lines = lines;

  factory _$OrderWriteImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderWriteImplFromJson(json);

  @override
  final int client;
  @override
  @JsonKey(name: 'order_status')
  final OrderStatusEnum? orderStatus;
  @override
  final double total;
  final List<OrderLineWrite> _lines;
  @override
  List<OrderLineWrite> get lines {
    if (_lines is EqualUnmodifiableListView) return _lines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lines);
  }

  @override
  String toString() {
    return 'OrderWrite(client: $client, orderStatus: $orderStatus, total: $total, lines: $lines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderWriteImpl &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._lines, _lines));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, client, orderStatus, total,
      const DeepCollectionEquality().hash(_lines));

  /// Create a copy of OrderWrite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderWriteImplCopyWith<_$OrderWriteImpl> get copyWith =>
      __$$OrderWriteImplCopyWithImpl<_$OrderWriteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderWriteImplToJson(
      this,
    );
  }
}

abstract class _OrderWrite implements OrderWrite {
  const factory _OrderWrite(
      {required final int client,
      @JsonKey(name: 'order_status') final OrderStatusEnum? orderStatus,
      required final double total,
      required final List<OrderLineWrite> lines}) = _$OrderWriteImpl;

  factory _OrderWrite.fromJson(Map<String, dynamic> json) =
      _$OrderWriteImpl.fromJson;

  @override
  int get client;
  @override
  @JsonKey(name: 'order_status')
  OrderStatusEnum? get orderStatus;
  @override
  double get total;
  @override
  List<OrderLineWrite> get lines;

  /// Create a copy of OrderWrite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderWriteImplCopyWith<_$OrderWriteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
