// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  int get id => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  int? get quantityInStock => throw _privateConstructorUsedError;
  @JsonKey(fromJson: unitFromJson, toJson: unitToJson)
  UnitEnum get unit => throw _privateConstructorUsedError;
  @StringToDoubleConverter()
  double? get purchasePrice => throw _privateConstructorUsedError;
  @StringToDoubleConverter()
  double? get sellingPrice => throw _privateConstructorUsedError;
  DateTime? get expirationDate => throw _privateConstructorUsedError;
  String? get qrCodeImage => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {int id,
      String category,
      String? image,
      String name,
      String? description,
      @JsonKey(includeIfNull: true) int? quantityInStock,
      @JsonKey(fromJson: unitFromJson, toJson: unitToJson) UnitEnum unit,
      @StringToDoubleConverter() double? purchasePrice,
      @StringToDoubleConverter() double? sellingPrice,
      DateTime? expirationDate,
      String? qrCodeImage});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? image = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? quantityInStock = freezed,
    Object? unit = null,
    Object? purchasePrice = freezed,
    Object? sellingPrice = freezed,
    Object? expirationDate = freezed,
    Object? qrCodeImage = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityInStock: freezed == quantityInStock
          ? _value.quantityInStock
          : quantityInStock // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as UnitEnum,
      purchasePrice: freezed == purchasePrice
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      sellingPrice: freezed == sellingPrice
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      qrCodeImage: freezed == qrCodeImage
          ? _value.qrCodeImage
          : qrCodeImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String category,
      String? image,
      String name,
      String? description,
      @JsonKey(includeIfNull: true) int? quantityInStock,
      @JsonKey(fromJson: unitFromJson, toJson: unitToJson) UnitEnum unit,
      @StringToDoubleConverter() double? purchasePrice,
      @StringToDoubleConverter() double? sellingPrice,
      DateTime? expirationDate,
      String? qrCodeImage});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? image = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? quantityInStock = freezed,
    Object? unit = null,
    Object? purchasePrice = freezed,
    Object? sellingPrice = freezed,
    Object? expirationDate = freezed,
    Object? qrCodeImage = freezed,
  }) {
    return _then(_$ProductImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityInStock: freezed == quantityInStock
          ? _value.quantityInStock
          : quantityInStock // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as UnitEnum,
      purchasePrice: freezed == purchasePrice
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      sellingPrice: freezed == sellingPrice
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      qrCodeImage: freezed == qrCodeImage
          ? _value.qrCodeImage
          : qrCodeImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$ProductImpl implements _Product {
  const _$ProductImpl(
      {required this.id,
      required this.category,
      this.image,
      required this.name,
      this.description,
      @JsonKey(includeIfNull: true) this.quantityInStock,
      @JsonKey(fromJson: unitFromJson, toJson: unitToJson) required this.unit,
      @StringToDoubleConverter() required this.purchasePrice,
      @StringToDoubleConverter() required this.sellingPrice,
      this.expirationDate,
      this.qrCodeImage});

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  final int id;
  @override
  final String category;
  @override
  final String? image;
  @override
  final String name;
  @override
  final String? description;
  @override
  @JsonKey(includeIfNull: true)
  final int? quantityInStock;
  @override
  @JsonKey(fromJson: unitFromJson, toJson: unitToJson)
  final UnitEnum unit;
  @override
  @StringToDoubleConverter()
  final double? purchasePrice;
  @override
  @StringToDoubleConverter()
  final double? sellingPrice;
  @override
  final DateTime? expirationDate;
  @override
  final String? qrCodeImage;

  @override
  String toString() {
    return 'Product(id: $id, category: $category, image: $image, name: $name, description: $description, quantityInStock: $quantityInStock, unit: $unit, purchasePrice: $purchasePrice, sellingPrice: $sellingPrice, expirationDate: $expirationDate, qrCodeImage: $qrCodeImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.quantityInStock, quantityInStock) ||
                other.quantityInStock == quantityInStock) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.purchasePrice, purchasePrice) ||
                other.purchasePrice == purchasePrice) &&
            (identical(other.sellingPrice, sellingPrice) ||
                other.sellingPrice == sellingPrice) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            (identical(other.qrCodeImage, qrCodeImage) ||
                other.qrCodeImage == qrCodeImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      category,
      image,
      name,
      description,
      quantityInStock,
      unit,
      purchasePrice,
      sellingPrice,
      expirationDate,
      qrCodeImage);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {required final int id,
      required final String category,
      final String? image,
      required final String name,
      final String? description,
      @JsonKey(includeIfNull: true) final int? quantityInStock,
      @JsonKey(fromJson: unitFromJson, toJson: unitToJson)
      required final UnitEnum unit,
      @StringToDoubleConverter() required final double? purchasePrice,
      @StringToDoubleConverter() required final double? sellingPrice,
      final DateTime? expirationDate,
      final String? qrCodeImage}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  int get id;
  @override
  String get category;
  @override
  String? get image;
  @override
  String get name;
  @override
  String? get description;
  @override
  @JsonKey(includeIfNull: true)
  int? get quantityInStock;
  @override
  @JsonKey(fromJson: unitFromJson, toJson: unitToJson)
  UnitEnum get unit;
  @override
  @StringToDoubleConverter()
  double? get purchasePrice;
  @override
  @StringToDoubleConverter()
  double? get sellingPrice;
  @override
  DateTime? get expirationDate;
  @override
  String? get qrCodeImage;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
