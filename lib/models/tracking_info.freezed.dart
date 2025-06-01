// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracking_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TrackingInfo _$TrackingInfoFromJson(Map<String, dynamic> json) {
  return _TrackingInfo.fromJson(json);
}

/// @nodoc
mixin _$TrackingInfo {
  int get id => throw _privateConstructorUsedError;

  /// ID de la livraison associée
  int get delivery => throw _privateConstructorUsedError;

  /// Statut actuel du suivi (ex: "en cours", "livré", etc.)
  String get trackingStatus => throw _privateConstructorUsedError;

  /// Localisation actuelle ou signalement du colis
  String get location => throw _privateConstructorUsedError;

  /// Date et heure du suivi
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this TrackingInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrackingInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrackingInfoCopyWith<TrackingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackingInfoCopyWith<$Res> {
  factory $TrackingInfoCopyWith(
          TrackingInfo value, $Res Function(TrackingInfo) then) =
      _$TrackingInfoCopyWithImpl<$Res, TrackingInfo>;
  @useResult
  $Res call(
      {int id,
      int delivery,
      String trackingStatus,
      String location,
      DateTime timestamp});
}

/// @nodoc
class _$TrackingInfoCopyWithImpl<$Res, $Val extends TrackingInfo>
    implements $TrackingInfoCopyWith<$Res> {
  _$TrackingInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrackingInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? delivery = null,
    Object? trackingStatus = null,
    Object? location = null,
    Object? timestamp = null,
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
      trackingStatus: null == trackingStatus
          ? _value.trackingStatus
          : trackingStatus // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrackingInfoImplCopyWith<$Res>
    implements $TrackingInfoCopyWith<$Res> {
  factory _$$TrackingInfoImplCopyWith(
          _$TrackingInfoImpl value, $Res Function(_$TrackingInfoImpl) then) =
      __$$TrackingInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int delivery,
      String trackingStatus,
      String location,
      DateTime timestamp});
}

/// @nodoc
class __$$TrackingInfoImplCopyWithImpl<$Res>
    extends _$TrackingInfoCopyWithImpl<$Res, _$TrackingInfoImpl>
    implements _$$TrackingInfoImplCopyWith<$Res> {
  __$$TrackingInfoImplCopyWithImpl(
      _$TrackingInfoImpl _value, $Res Function(_$TrackingInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TrackingInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? delivery = null,
    Object? trackingStatus = null,
    Object? location = null,
    Object? timestamp = null,
  }) {
    return _then(_$TrackingInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      delivery: null == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as int,
      trackingStatus: null == trackingStatus
          ? _value.trackingStatus
          : trackingStatus // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackingInfoImpl implements _TrackingInfo {
  const _$TrackingInfoImpl(
      {required this.id,
      required this.delivery,
      required this.trackingStatus,
      required this.location,
      required this.timestamp});

  factory _$TrackingInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackingInfoImplFromJson(json);

  @override
  final int id;

  /// ID de la livraison associée
  @override
  final int delivery;

  /// Statut actuel du suivi (ex: "en cours", "livré", etc.)
  @override
  final String trackingStatus;

  /// Localisation actuelle ou signalement du colis
  @override
  final String location;

  /// Date et heure du suivi
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'TrackingInfo(id: $id, delivery: $delivery, trackingStatus: $trackingStatus, location: $location, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackingInfoImpl &&
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

  /// Create a copy of TrackingInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackingInfoImplCopyWith<_$TrackingInfoImpl> get copyWith =>
      __$$TrackingInfoImplCopyWithImpl<_$TrackingInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackingInfoImplToJson(
      this,
    );
  }
}

abstract class _TrackingInfo implements TrackingInfo {
  const factory _TrackingInfo(
      {required final int id,
      required final int delivery,
      required final String trackingStatus,
      required final String location,
      required final DateTime timestamp}) = _$TrackingInfoImpl;

  factory _TrackingInfo.fromJson(Map<String, dynamic> json) =
      _$TrackingInfoImpl.fromJson;

  @override
  int get id;

  /// ID de la livraison associée
  @override
  int get delivery;

  /// Statut actuel du suivi (ex: "en cours", "livré", etc.)
  @override
  String get trackingStatus;

  /// Localisation actuelle ou signalement du colis
  @override
  String get location;

  /// Date et heure du suivi
  @override
  DateTime get timestamp;

  /// Create a copy of TrackingInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrackingInfoImplCopyWith<_$TrackingInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
