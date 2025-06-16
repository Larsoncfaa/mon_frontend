// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'batch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Batch _$BatchFromJson(Map<String, dynamic> json) {
  return _Batch.fromJson(json);
}

/// @nodoc
mixin _$Batch {
  int get id => throw _privateConstructorUsedError;

  /// Identifiant du produit (clé JSON = "product", OK en camelCase)
  int get product => throw _privateConstructorUsedError;

  /// Numéro de lot (clé JSON = "lot_number" : CHARFIELD dans Django)
  @JsonKey(name: 'lot_number')
  String get lotNumber => throw _privateConstructorUsedError;

  /// Date d'expiration (clé JSON = "expiration_date" : DATEFIELD dans Django)
  @JsonKey(name: 'expiration_date')
  DateTime get expirationDate => throw _privateConstructorUsedError;

  /// Serializes this Batch to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BatchCopyWith<Batch> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchCopyWith<$Res> {
  factory $BatchCopyWith(Batch value, $Res Function(Batch) then) =
      _$BatchCopyWithImpl<$Res, Batch>;
  @useResult
  $Res call(
      {int id,
      int product,
      @JsonKey(name: 'lot_number') String lotNumber,
      @JsonKey(name: 'expiration_date') DateTime expirationDate});
}

/// @nodoc
class _$BatchCopyWithImpl<$Res, $Val extends Batch>
    implements $BatchCopyWith<$Res> {
  _$BatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? lotNumber = null,
    Object? expirationDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as int,
      lotNumber: null == lotNumber
          ? _value.lotNumber
          : lotNumber // ignore: cast_nullable_to_non_nullable
              as String,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BatchImplCopyWith<$Res> implements $BatchCopyWith<$Res> {
  factory _$$BatchImplCopyWith(
          _$BatchImpl value, $Res Function(_$BatchImpl) then) =
      __$$BatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int product,
      @JsonKey(name: 'lot_number') String lotNumber,
      @JsonKey(name: 'expiration_date') DateTime expirationDate});
}

/// @nodoc
class __$$BatchImplCopyWithImpl<$Res>
    extends _$BatchCopyWithImpl<$Res, _$BatchImpl>
    implements _$$BatchImplCopyWith<$Res> {
  __$$BatchImplCopyWithImpl(
      _$BatchImpl _value, $Res Function(_$BatchImpl) _then)
      : super(_value, _then);

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? lotNumber = null,
    Object? expirationDate = null,
  }) {
    return _then(_$BatchImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as int,
      lotNumber: null == lotNumber
          ? _value.lotNumber
          : lotNumber // ignore: cast_nullable_to_non_nullable
              as String,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BatchImpl implements _Batch {
  const _$BatchImpl(
      {required this.id,
      required this.product,
      @JsonKey(name: 'lot_number') required this.lotNumber,
      @JsonKey(name: 'expiration_date') required this.expirationDate});

  factory _$BatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$BatchImplFromJson(json);

  @override
  final int id;

  /// Identifiant du produit (clé JSON = "product", OK en camelCase)
  @override
  final int product;

  /// Numéro de lot (clé JSON = "lot_number" : CHARFIELD dans Django)
  @override
  @JsonKey(name: 'lot_number')
  final String lotNumber;

  /// Date d'expiration (clé JSON = "expiration_date" : DATEFIELD dans Django)
  @override
  @JsonKey(name: 'expiration_date')
  final DateTime expirationDate;

  @override
  String toString() {
    return 'Batch(id: $id, product: $product, lotNumber: $lotNumber, expirationDate: $expirationDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BatchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.lotNumber, lotNumber) ||
                other.lotNumber == lotNumber) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, product, lotNumber, expirationDate);

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BatchImplCopyWith<_$BatchImpl> get copyWith =>
      __$$BatchImplCopyWithImpl<_$BatchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BatchImplToJson(
      this,
    );
  }
}

abstract class _Batch implements Batch {
  const factory _Batch(
      {required final int id,
      required final int product,
      @JsonKey(name: 'lot_number') required final String lotNumber,
      @JsonKey(name: 'expiration_date')
      required final DateTime expirationDate}) = _$BatchImpl;

  factory _Batch.fromJson(Map<String, dynamic> json) = _$BatchImpl.fromJson;

  @override
  int get id;

  /// Identifiant du produit (clé JSON = "product", OK en camelCase)
  @override
  int get product;

  /// Numéro de lot (clé JSON = "lot_number" : CHARFIELD dans Django)
  @override
  @JsonKey(name: 'lot_number')
  String get lotNumber;

  /// Date d'expiration (clé JSON = "expiration_date" : DATEFIELD dans Django)
  @override
  @JsonKey(name: 'expiration_date')
  DateTime get expirationDate;

  /// Create a copy of Batch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BatchImplCopyWith<_$BatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
