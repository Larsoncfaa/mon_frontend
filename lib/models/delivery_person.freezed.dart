// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeliveryPerson _$DeliveryPersonFromJson(Map<String, dynamic> json) {
  return _DeliveryPerson.fromJson(json);
}

/// @nodoc
mixin _$DeliveryPerson {
  int get id => throw _privateConstructorUsedError; // ID du compte livreur
  int get user =>
      throw _privateConstructorUsedError; // Nom complet du livreur (ex: "Ali Diarra")
  @JsonKey(name: 'user_name')
  String get userName =>
      throw _privateConstructorUsedError; // ID de l'agriculteur
  int get agriculteur =>
      throw _privateConstructorUsedError; // Nom complet de l'agriculteur
  @JsonKey(name: 'agriculteur_name')
  String? get agriculteurName =>
      throw _privateConstructorUsedError; // Téléphone
  String get phone => throw _privateConstructorUsedError;

  /// Serializes this DeliveryPerson to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryPerson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryPersonCopyWith<DeliveryPerson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryPersonCopyWith<$Res> {
  factory $DeliveryPersonCopyWith(
          DeliveryPerson value, $Res Function(DeliveryPerson) then) =
      _$DeliveryPersonCopyWithImpl<$Res, DeliveryPerson>;
  @useResult
  $Res call(
      {int id,
      int user,
      @JsonKey(name: 'user_name') String userName,
      int agriculteur,
      @JsonKey(name: 'agriculteur_name') String? agriculteurName,
      String phone});
}

/// @nodoc
class _$DeliveryPersonCopyWithImpl<$Res, $Val extends DeliveryPerson>
    implements $DeliveryPersonCopyWith<$Res> {
  _$DeliveryPersonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryPerson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? userName = null,
    Object? agriculteur = null,
    Object? agriculteurName = freezed,
    Object? phone = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      agriculteur: null == agriculteur
          ? _value.agriculteur
          : agriculteur // ignore: cast_nullable_to_non_nullable
              as int,
      agriculteurName: freezed == agriculteurName
          ? _value.agriculteurName
          : agriculteurName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryPersonImplCopyWith<$Res>
    implements $DeliveryPersonCopyWith<$Res> {
  factory _$$DeliveryPersonImplCopyWith(_$DeliveryPersonImpl value,
          $Res Function(_$DeliveryPersonImpl) then) =
      __$$DeliveryPersonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int user,
      @JsonKey(name: 'user_name') String userName,
      int agriculteur,
      @JsonKey(name: 'agriculteur_name') String? agriculteurName,
      String phone});
}

/// @nodoc
class __$$DeliveryPersonImplCopyWithImpl<$Res>
    extends _$DeliveryPersonCopyWithImpl<$Res, _$DeliveryPersonImpl>
    implements _$$DeliveryPersonImplCopyWith<$Res> {
  __$$DeliveryPersonImplCopyWithImpl(
      _$DeliveryPersonImpl _value, $Res Function(_$DeliveryPersonImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryPerson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user = null,
    Object? userName = null,
    Object? agriculteur = null,
    Object? agriculteurName = freezed,
    Object? phone = null,
  }) {
    return _then(_$DeliveryPersonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      agriculteur: null == agriculteur
          ? _value.agriculteur
          : agriculteur // ignore: cast_nullable_to_non_nullable
              as int,
      agriculteurName: freezed == agriculteurName
          ? _value.agriculteurName
          : agriculteurName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryPersonImpl implements _DeliveryPerson {
  const _$DeliveryPersonImpl(
      {required this.id,
      required this.user,
      @JsonKey(name: 'user_name') required this.userName,
      required this.agriculteur,
      @JsonKey(name: 'agriculteur_name') this.agriculteurName,
      required this.phone});

  factory _$DeliveryPersonImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryPersonImplFromJson(json);

  @override
  final int id;
// ID du compte livreur
  @override
  final int user;
// Nom complet du livreur (ex: "Ali Diarra")
  @override
  @JsonKey(name: 'user_name')
  final String userName;
// ID de l'agriculteur
  @override
  final int agriculteur;
// Nom complet de l'agriculteur
  @override
  @JsonKey(name: 'agriculteur_name')
  final String? agriculteurName;
// Téléphone
  @override
  final String phone;

  @override
  String toString() {
    return 'DeliveryPerson(id: $id, user: $user, userName: $userName, agriculteur: $agriculteur, agriculteurName: $agriculteurName, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryPersonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.agriculteur, agriculteur) ||
                other.agriculteur == agriculteur) &&
            (identical(other.agriculteurName, agriculteurName) ||
                other.agriculteurName == agriculteurName) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, user, userName, agriculteur, agriculteurName, phone);

  /// Create a copy of DeliveryPerson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryPersonImplCopyWith<_$DeliveryPersonImpl> get copyWith =>
      __$$DeliveryPersonImplCopyWithImpl<_$DeliveryPersonImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryPersonImplToJson(
      this,
    );
  }
}

abstract class _DeliveryPerson implements DeliveryPerson {
  const factory _DeliveryPerson(
      {required final int id,
      required final int user,
      @JsonKey(name: 'user_name') required final String userName,
      required final int agriculteur,
      @JsonKey(name: 'agriculteur_name') final String? agriculteurName,
      required final String phone}) = _$DeliveryPersonImpl;

  factory _DeliveryPerson.fromJson(Map<String, dynamic> json) =
      _$DeliveryPersonImpl.fromJson;

  @override
  int get id; // ID du compte livreur
  @override
  int get user; // Nom complet du livreur (ex: "Ali Diarra")
  @override
  @JsonKey(name: 'user_name')
  String get userName; // ID de l'agriculteur
  @override
  int get agriculteur; // Nom complet de l'agriculteur
  @override
  @JsonKey(name: 'agriculteur_name')
  String? get agriculteurName; // Téléphone
  @override
  String get phone;

  /// Create a copy of DeliveryPerson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryPersonImplCopyWith<_$DeliveryPersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
