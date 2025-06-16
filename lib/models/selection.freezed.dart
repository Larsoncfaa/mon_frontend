// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Selection _$SelectionFromJson(Map<String, dynamic> json) {
  return _Selection.fromJson(json);
}

/// @nodoc
mixin _$Selection {
  int get id => throw _privateConstructorUsedError;
  int get product => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'selling_price')
  String get sellingPrice => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiration_date')
  DateTime? get expirationDate => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Selection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Selection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SelectionCopyWith<Selection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectionCopyWith<$Res> {
  factory $SelectionCopyWith(Selection value, $Res Function(Selection) then) =
      _$SelectionCopyWithImpl<$Res, Selection>;
  @useResult
  $Res call(
      {int id,
      int product,
      String? image,
      int quantity,
      String name,
      @JsonKey(name: 'selling_price') String sellingPrice,
      String? description,
      @JsonKey(name: 'expiration_date') DateTime? expirationDate,
      String category,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class _$SelectionCopyWithImpl<$Res, $Val extends Selection>
    implements $SelectionCopyWith<$Res> {
  _$SelectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Selection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? image = freezed,
    Object? quantity = null,
    Object? name = null,
    Object? sellingPrice = null,
    Object? description = freezed,
    Object? expirationDate = freezed,
    Object? category = null,
    Object? createdAt = freezed,
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
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sellingPrice: null == sellingPrice
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectionImplCopyWith<$Res>
    implements $SelectionCopyWith<$Res> {
  factory _$$SelectionImplCopyWith(
          _$SelectionImpl value, $Res Function(_$SelectionImpl) then) =
      __$$SelectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int product,
      String? image,
      int quantity,
      String name,
      @JsonKey(name: 'selling_price') String sellingPrice,
      String? description,
      @JsonKey(name: 'expiration_date') DateTime? expirationDate,
      String category,
      @JsonKey(name: 'created_at') DateTime? createdAt});
}

/// @nodoc
class __$$SelectionImplCopyWithImpl<$Res>
    extends _$SelectionCopyWithImpl<$Res, _$SelectionImpl>
    implements _$$SelectionImplCopyWith<$Res> {
  __$$SelectionImplCopyWithImpl(
      _$SelectionImpl _value, $Res Function(_$SelectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Selection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? image = freezed,
    Object? quantity = null,
    Object? name = null,
    Object? sellingPrice = null,
    Object? description = freezed,
    Object? expirationDate = freezed,
    Object? category = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$SelectionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as int,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sellingPrice: null == sellingPrice
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$SelectionImpl implements _Selection {
  const _$SelectionImpl(
      {required this.id,
      required this.product,
      this.image,
      required this.quantity,
      required this.name,
      @JsonKey(name: 'selling_price') required this.sellingPrice,
      this.description,
      @JsonKey(name: 'expiration_date') this.expirationDate,
      required this.category,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$SelectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectionImplFromJson(json);

  @override
  final int id;
  @override
  final int product;
  @override
  final String? image;
  @override
  final int quantity;
  @override
  final String name;
  @override
  @JsonKey(name: 'selling_price')
  final String sellingPrice;
  @override
  final String? description;
  @override
  @JsonKey(name: 'expiration_date')
  final DateTime? expirationDate;
  @override
  final String category;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Selection(id: $id, product: $product, image: $image, quantity: $quantity, name: $name, sellingPrice: $sellingPrice, description: $description, expirationDate: $expirationDate, category: $category, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sellingPrice, sellingPrice) ||
                other.sellingPrice == sellingPrice) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, product, image, quantity,
      name, sellingPrice, description, expirationDate, category, createdAt);

  /// Create a copy of Selection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectionImplCopyWith<_$SelectionImpl> get copyWith =>
      __$$SelectionImplCopyWithImpl<_$SelectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectionImplToJson(
      this,
    );
  }
}

abstract class _Selection implements Selection {
  const factory _Selection(
          {required final int id,
          required final int product,
          final String? image,
          required final int quantity,
          required final String name,
          @JsonKey(name: 'selling_price') required final String sellingPrice,
          final String? description,
          @JsonKey(name: 'expiration_date') final DateTime? expirationDate,
          required final String category,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$SelectionImpl;

  factory _Selection.fromJson(Map<String, dynamic> json) =
      _$SelectionImpl.fromJson;

  @override
  int get id;
  @override
  int get product;
  @override
  String? get image;
  @override
  int get quantity;
  @override
  String get name;
  @override
  @JsonKey(name: 'selling_price')
  String get sellingPrice;
  @override
  String? get description;
  @override
  @JsonKey(name: 'expiration_date')
  DateTime? get expirationDate;
  @override
  String get category;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of Selection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectionImplCopyWith<_$SelectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
