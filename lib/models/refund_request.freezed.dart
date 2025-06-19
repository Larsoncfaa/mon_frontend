// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refund_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RefundRequest _$RefundRequestFromJson(Map<String, dynamic> json) {
  return _RefundRequest.fromJson(json);
}

/// @nodoc
mixin _$RefundRequest {
  /// ID unique de la demande
  int get id => throw _privateConstructorUsedError;

  /// Nombre de jours restants avant expiration de la demande
  int get daysRemaining => throw _privateConstructorUsedError;

  /// Raison du remboursement (champ texte libre)
  String get reason => throw _privateConstructorUsedError;

  /// Preuves à l’appui de la demande (peut être un lien ou description)
// Champ ignoré pour JSON, rendu optionnel
  @JsonKey(ignore: true)
  File? get evidence =>
      throw _privateConstructorUsedError; // nullable, car pas présent dans le JSON
  /// Statut actuel de la demande (enum)
  RefundStatusEnum? get refundStatus => throw _privateConstructorUsedError;

  /// Date à laquelle la demande a été faite
  DateTime? get requestedAt => throw _privateConstructorUsedError;

  /// Date de traitement par un administrateur (peut être null si non traité)
  DateTime? get processedAt => throw _privateConstructorUsedError;

  /// ID de la commande associée
  int get order => throw _privateConstructorUsedError;

  /// Serializes this RefundRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefundRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefundRequestCopyWith<RefundRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefundRequestCopyWith<$Res> {
  factory $RefundRequestCopyWith(
          RefundRequest value, $Res Function(RefundRequest) then) =
      _$RefundRequestCopyWithImpl<$Res, RefundRequest>;
  @useResult
  $Res call(
      {int id,
      int daysRemaining,
      String reason,
      @JsonKey(ignore: true) File? evidence,
      RefundStatusEnum? refundStatus,
      DateTime? requestedAt,
      DateTime? processedAt,
      int order});
}

/// @nodoc
class _$RefundRequestCopyWithImpl<$Res, $Val extends RefundRequest>
    implements $RefundRequestCopyWith<$Res> {
  _$RefundRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefundRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? daysRemaining = null,
    Object? reason = null,
    Object? evidence = freezed,
    Object? refundStatus = freezed,
    Object? requestedAt = freezed,
    Object? processedAt = freezed,
    Object? order = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      daysRemaining: null == daysRemaining
          ? _value.daysRemaining
          : daysRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      evidence: freezed == evidence
          ? _value.evidence
          : evidence // ignore: cast_nullable_to_non_nullable
              as File?,
      refundStatus: freezed == refundStatus
          ? _value.refundStatus
          : refundStatus // ignore: cast_nullable_to_non_nullable
              as RefundStatusEnum?,
      requestedAt: freezed == requestedAt
          ? _value.requestedAt
          : requestedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      processedAt: freezed == processedAt
          ? _value.processedAt
          : processedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefundRequestImplCopyWith<$Res>
    implements $RefundRequestCopyWith<$Res> {
  factory _$$RefundRequestImplCopyWith(
          _$RefundRequestImpl value, $Res Function(_$RefundRequestImpl) then) =
      __$$RefundRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int daysRemaining,
      String reason,
      @JsonKey(ignore: true) File? evidence,
      RefundStatusEnum? refundStatus,
      DateTime? requestedAt,
      DateTime? processedAt,
      int order});
}

/// @nodoc
class __$$RefundRequestImplCopyWithImpl<$Res>
    extends _$RefundRequestCopyWithImpl<$Res, _$RefundRequestImpl>
    implements _$$RefundRequestImplCopyWith<$Res> {
  __$$RefundRequestImplCopyWithImpl(
      _$RefundRequestImpl _value, $Res Function(_$RefundRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefundRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? daysRemaining = null,
    Object? reason = null,
    Object? evidence = freezed,
    Object? refundStatus = freezed,
    Object? requestedAt = freezed,
    Object? processedAt = freezed,
    Object? order = null,
  }) {
    return _then(_$RefundRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      daysRemaining: null == daysRemaining
          ? _value.daysRemaining
          : daysRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      evidence: freezed == evidence
          ? _value.evidence
          : evidence // ignore: cast_nullable_to_non_nullable
              as File?,
      refundStatus: freezed == refundStatus
          ? _value.refundStatus
          : refundStatus // ignore: cast_nullable_to_non_nullable
              as RefundStatusEnum?,
      requestedAt: freezed == requestedAt
          ? _value.requestedAt
          : requestedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      processedAt: freezed == processedAt
          ? _value.processedAt
          : processedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefundRequestImpl implements _RefundRequest {
  const _$RefundRequestImpl(
      {required this.id,
      required this.daysRemaining,
      required this.reason,
      @JsonKey(ignore: true) this.evidence,
      required this.refundStatus,
      required this.requestedAt,
      this.processedAt,
      required this.order});

  factory _$RefundRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefundRequestImplFromJson(json);

  /// ID unique de la demande
  @override
  final int id;

  /// Nombre de jours restants avant expiration de la demande
  @override
  final int daysRemaining;

  /// Raison du remboursement (champ texte libre)
  @override
  final String reason;

  /// Preuves à l’appui de la demande (peut être un lien ou description)
// Champ ignoré pour JSON, rendu optionnel
  @override
  @JsonKey(ignore: true)
  final File? evidence;
// nullable, car pas présent dans le JSON
  /// Statut actuel de la demande (enum)
  @override
  final RefundStatusEnum? refundStatus;

  /// Date à laquelle la demande a été faite
  @override
  final DateTime? requestedAt;

  /// Date de traitement par un administrateur (peut être null si non traité)
  @override
  final DateTime? processedAt;

  /// ID de la commande associée
  @override
  final int order;

  @override
  String toString() {
    return 'RefundRequest(id: $id, daysRemaining: $daysRemaining, reason: $reason, evidence: $evidence, refundStatus: $refundStatus, requestedAt: $requestedAt, processedAt: $processedAt, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefundRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.daysRemaining, daysRemaining) ||
                other.daysRemaining == daysRemaining) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.evidence, evidence) ||
                other.evidence == evidence) &&
            (identical(other.refundStatus, refundStatus) ||
                other.refundStatus == refundStatus) &&
            (identical(other.requestedAt, requestedAt) ||
                other.requestedAt == requestedAt) &&
            (identical(other.processedAt, processedAt) ||
                other.processedAt == processedAt) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, daysRemaining, reason,
      evidence, refundStatus, requestedAt, processedAt, order);

  /// Create a copy of RefundRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefundRequestImplCopyWith<_$RefundRequestImpl> get copyWith =>
      __$$RefundRequestImplCopyWithImpl<_$RefundRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefundRequestImplToJson(
      this,
    );
  }
}

abstract class _RefundRequest implements RefundRequest {
  const factory _RefundRequest(
      {required final int id,
      required final int daysRemaining,
      required final String reason,
      @JsonKey(ignore: true) final File? evidence,
      required final RefundStatusEnum? refundStatus,
      required final DateTime? requestedAt,
      final DateTime? processedAt,
      required final int order}) = _$RefundRequestImpl;

  factory _RefundRequest.fromJson(Map<String, dynamic> json) =
      _$RefundRequestImpl.fromJson;

  /// ID unique de la demande
  @override
  int get id;

  /// Nombre de jours restants avant expiration de la demande
  @override
  int get daysRemaining;

  /// Raison du remboursement (champ texte libre)
  @override
  String get reason;

  /// Preuves à l’appui de la demande (peut être un lien ou description)
// Champ ignoré pour JSON, rendu optionnel
  @override
  @JsonKey(ignore: true)
  File? get evidence; // nullable, car pas présent dans le JSON
  /// Statut actuel de la demande (enum)
  @override
  RefundStatusEnum? get refundStatus;

  /// Date à laquelle la demande a été faite
  @override
  DateTime? get requestedAt;

  /// Date de traitement par un administrateur (peut être null si non traité)
  @override
  DateTime? get processedAt;

  /// ID de la commande associée
  @override
  int get order;

  /// Create a copy of RefundRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefundRequestImplCopyWith<_$RefundRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
