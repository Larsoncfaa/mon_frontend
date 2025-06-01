// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_tracking_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PatchedTrackingInfo _$PatchedTrackingInfoFromJson(Map<String, dynamic> json) {
  return _PatchedTrackingInfo.fromJson(json);
}

/// @nodoc
mixin _$PatchedTrackingInfo {
  int? get id => throw _privateConstructorUsedError;
  int? get delivery => throw _privateConstructorUsedError;
  @JsonKey(name: 'tracking_status')
  String? get trackingStatus => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  DateTime? get timestamp => throw _privateConstructorUsedError;

  /// Serializes this PatchedTrackingInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatchedTrackingInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatchedTrackingInfoCopyWith<PatchedTrackingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatchedTrackingInfoCopyWith<$Res> {
  factory $PatchedTrackingInfoCopyWith(
          PatchedTrackingInfo value, $Res Function(PatchedTrackingInfo) then) =
      _$PatchedTrackingInfoCopyWithImpl<$Res, PatchedTrackingInfo>;
  @useResult
  $Res call(
      {int? id,
      int? delivery,
      @JsonKey(name: 'tracking_status') String? trackingStatus,
      String? location,
      DateTime? timestamp});
}

/// @nodoc
class _$PatchedTrackingInfoCopyWithImpl<$Res, $Val extends PatchedTrackingInfo>
    implements $PatchedTrackingInfoCopyWith<$Res> {
  _$PatchedTrackingInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatchedTrackingInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? delivery = freezed,
    Object? trackingStatus = freezed,
    Object? location = freezed,
    Object? timestamp = freezed,
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
      trackingStatus: freezed == trackingStatus
          ? _value.trackingStatus
          : trackingStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PatchedTrackingInfoImplCopyWith<$Res>
    implements $PatchedTrackingInfoCopyWith<$Res> {
  factory _$$PatchedTrackingInfoImplCopyWith(_$PatchedTrackingInfoImpl value,
          $Res Function(_$PatchedTrackingInfoImpl) then) =
      __$$PatchedTrackingInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? delivery,
      @JsonKey(name: 'tracking_status') String? trackingStatus,
      String? location,
      DateTime? timestamp});
}

/// @nodoc
class __$$PatchedTrackingInfoImplCopyWithImpl<$Res>
    extends _$PatchedTrackingInfoCopyWithImpl<$Res, _$PatchedTrackingInfoImpl>
    implements _$$PatchedTrackingInfoImplCopyWith<$Res> {
  __$$PatchedTrackingInfoImplCopyWithImpl(_$PatchedTrackingInfoImpl _value,
      $Res Function(_$PatchedTrackingInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PatchedTrackingInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? delivery = freezed,
    Object? trackingStatus = freezed,
    Object? location = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_$PatchedTrackingInfoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      delivery: freezed == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as int?,
      trackingStatus: freezed == trackingStatus
          ? _value.trackingStatus
          : trackingStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PatchedTrackingInfoImpl implements _PatchedTrackingInfo {
  const _$PatchedTrackingInfoImpl(
      {this.id,
      this.delivery,
      @JsonKey(name: 'tracking_status') this.trackingStatus,
      this.location,
      this.timestamp});

  factory _$PatchedTrackingInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatchedTrackingInfoImplFromJson(json);

  @override
  final int? id;
  @override
  final int? delivery;
  @override
  @JsonKey(name: 'tracking_status')
  final String? trackingStatus;
  @override
  final String? location;
  @override
  final DateTime? timestamp;

  @override
  String toString() {
    return 'PatchedTrackingInfo(id: $id, delivery: $delivery, trackingStatus: $trackingStatus, location: $location, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatchedTrackingInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.delivery, delivery) ||
                other.delivery == delivery) &&
            (identical(other.trackingStatus, trackingStatus) ||
                other.trackingStatus == trackingStatus) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, delivery, trackingStatus, location, timestamp);

  /// Create a copy of PatchedTrackingInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchedTrackingInfoImplCopyWith<_$PatchedTrackingInfoImpl> get copyWith =>
      __$$PatchedTrackingInfoImplCopyWithImpl<_$PatchedTrackingInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatchedTrackingInfoImplToJson(
      this,
    );
  }
}

abstract class _PatchedTrackingInfo implements PatchedTrackingInfo {
  const factory _PatchedTrackingInfo(
      {final int? id,
      final int? delivery,
      @JsonKey(name: 'tracking_status') final String? trackingStatus,
      final String? location,
      final DateTime? timestamp}) = _$PatchedTrackingInfoImpl;

  factory _PatchedTrackingInfo.fromJson(Map<String, dynamic> json) =
      _$PatchedTrackingInfoImpl.fromJson;

  @override
  int? get id;
  @override
  int? get delivery;
  @override
  @JsonKey(name: 'tracking_status')
  String? get trackingStatus;
  @override
  String? get location;
  @override
  DateTime? get timestamp;

  /// Create a copy of PatchedTrackingInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatchedTrackingInfoImplCopyWith<_$PatchedTrackingInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
