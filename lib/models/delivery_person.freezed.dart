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
  /// Identifiant unique de la livraison
  int get id => throw _privateConstructorUsedError;

  /// ID du compte livreur
  int get user => throw _privateConstructorUsedError;

  /// ID de l'agriculteur émetteur
  int get agriculteur => throw _privateConstructorUsedError;

  /// Téléphone du destinataire
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
  $Res call({int id, int user, int agriculteur, String phone});
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
    Object? agriculteur = null,
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
      agriculteur: null == agriculteur
          ? _value.agriculteur
          : agriculteur // ignore: cast_nullable_to_non_nullable
              as int,
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
  $Res call({int id, int user, int agriculteur, String phone});
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
    Object? agriculteur = null,
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
      agriculteur: null == agriculteur
          ? _value.agriculteur
          : agriculteur // ignore: cast_nullable_to_non_nullable
              as int,
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
      required this.agriculteur,
      required this.phone});

  factory _$DeliveryPersonImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryPersonImplFromJson(json);

  /// Identifiant unique de la livraison
  @override
  final int id;

  /// ID du compte livreur
  @override
  final int user;

  /// ID de l'agriculteur émetteur
  @override
  final int agriculteur;

  /// Téléphone du destinataire
  @override
  final String phone;

  @override
  String toString() {
    return 'DeliveryPerson(id: $id, user: $user, agriculteur: $agriculteur, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryPersonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.agriculteur, agriculteur) ||
                other.agriculteur == agriculteur) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, agriculteur, phone);

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
      required final int agriculteur,
      required final String phone}) = _$DeliveryPersonImpl;

  factory _DeliveryPerson.fromJson(Map<String, dynamic> json) =
      _$DeliveryPersonImpl.fromJson;

  /// Identifiant unique de la livraison
  @override
  int get id;

  /// ID du compte livreur
  @override
  int get user;

  /// ID de l'agriculteur émetteur
  @override
  int get agriculteur;

  /// Téléphone du destinataire
  @override
  String get phone;

  /// Create a copy of DeliveryPerson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryPersonImplCopyWith<_$DeliveryPersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginatedDeliveryPersonList _$PaginatedDeliveryPersonListFromJson(
    Map<String, dynamic> json) {
  return _PaginatedDeliveryPersonList.fromJson(json);
}

/// @nodoc
mixin _$PaginatedDeliveryPersonList {
  /// Nombre total d'éléments
  int get count => throw _privateConstructorUsedError;

  /// URL de la page suivante (ou null si dernière page)
  String? get next => throw _privateConstructorUsedError;

  /// URL de la page précédente (ou null si première page)
  String? get previous => throw _privateConstructorUsedError;

  /// Liste des livraisons pour cette page
  List<DeliveryPerson> get results => throw _privateConstructorUsedError;

  /// Serializes this PaginatedDeliveryPersonList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedDeliveryPersonList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedDeliveryPersonListCopyWith<PaginatedDeliveryPersonList>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedDeliveryPersonListCopyWith<$Res> {
  factory $PaginatedDeliveryPersonListCopyWith(
          PaginatedDeliveryPersonList value,
          $Res Function(PaginatedDeliveryPersonList) then) =
      _$PaginatedDeliveryPersonListCopyWithImpl<$Res,
          PaginatedDeliveryPersonList>;
  @useResult
  $Res call(
      {int count,
      String? next,
      String? previous,
      List<DeliveryPerson> results});
}

/// @nodoc
class _$PaginatedDeliveryPersonListCopyWithImpl<$Res,
        $Val extends PaginatedDeliveryPersonList>
    implements $PaginatedDeliveryPersonListCopyWith<$Res> {
  _$PaginatedDeliveryPersonListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedDeliveryPersonList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<DeliveryPerson>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedDeliveryPersonListImplCopyWith<$Res>
    implements $PaginatedDeliveryPersonListCopyWith<$Res> {
  factory _$$PaginatedDeliveryPersonListImplCopyWith(
          _$PaginatedDeliveryPersonListImpl value,
          $Res Function(_$PaginatedDeliveryPersonListImpl) then) =
      __$$PaginatedDeliveryPersonListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int count,
      String? next,
      String? previous,
      List<DeliveryPerson> results});
}

/// @nodoc
class __$$PaginatedDeliveryPersonListImplCopyWithImpl<$Res>
    extends _$PaginatedDeliveryPersonListCopyWithImpl<$Res,
        _$PaginatedDeliveryPersonListImpl>
    implements _$$PaginatedDeliveryPersonListImplCopyWith<$Res> {
  __$$PaginatedDeliveryPersonListImplCopyWithImpl(
      _$PaginatedDeliveryPersonListImpl _value,
      $Res Function(_$PaginatedDeliveryPersonListImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedDeliveryPersonList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PaginatedDeliveryPersonListImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<DeliveryPerson>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedDeliveryPersonListImpl
    implements _PaginatedDeliveryPersonList {
  const _$PaginatedDeliveryPersonListImpl(
      {required this.count,
      this.next,
      this.previous,
      required final List<DeliveryPerson> results})
      : _results = results;

  factory _$PaginatedDeliveryPersonListImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PaginatedDeliveryPersonListImplFromJson(json);

  /// Nombre total d'éléments
  @override
  final int count;

  /// URL de la page suivante (ou null si dernière page)
  @override
  final String? next;

  /// URL de la page précédente (ou null si première page)
  @override
  final String? previous;

  /// Liste des livraisons pour cette page
  final List<DeliveryPerson> _results;

  /// Liste des livraisons pour cette page
  @override
  List<DeliveryPerson> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'PaginatedDeliveryPersonList(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedDeliveryPersonListImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, next, previous,
      const DeepCollectionEquality().hash(_results));

  /// Create a copy of PaginatedDeliveryPersonList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedDeliveryPersonListImplCopyWith<_$PaginatedDeliveryPersonListImpl>
      get copyWith => __$$PaginatedDeliveryPersonListImplCopyWithImpl<
          _$PaginatedDeliveryPersonListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedDeliveryPersonListImplToJson(
      this,
    );
  }
}

abstract class _PaginatedDeliveryPersonList
    implements PaginatedDeliveryPersonList {
  const factory _PaginatedDeliveryPersonList(
          {required final int count,
          final String? next,
          final String? previous,
          required final List<DeliveryPerson> results}) =
      _$PaginatedDeliveryPersonListImpl;

  factory _PaginatedDeliveryPersonList.fromJson(Map<String, dynamic> json) =
      _$PaginatedDeliveryPersonListImpl.fromJson;

  /// Nombre total d'éléments
  @override
  int get count;

  /// URL de la page suivante (ou null si dernière page)
  @override
  String? get next;

  /// URL de la page précédente (ou null si première page)
  @override
  String? get previous;

  /// Liste des livraisons pour cette page
  @override
  List<DeliveryPerson> get results;

  /// Create a copy of PaginatedDeliveryPersonList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedDeliveryPersonListImplCopyWith<_$PaginatedDeliveryPersonListImpl>
      get copyWith => throw _privateConstructorUsedError;
}
