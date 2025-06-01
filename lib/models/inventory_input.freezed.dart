// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InventoryInput _$InventoryInputFromJson(Map<String, dynamic> json) {
  return _InventoryInput.fromJson(json);
}

/// @nodoc
mixin _$InventoryInput {
  /// ID du produit à prédire
  @JsonKey(name: 'product_id')
  int get productId => throw _privateConstructorUsedError;

  /// Fenêtre de jours passés (par défaut : 30 jours)
  @JsonKey(name: 'window_days')
  int get windowDays => throw _privateConstructorUsedError;

  /// Serializes this InventoryInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InventoryInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InventoryInputCopyWith<InventoryInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryInputCopyWith<$Res> {
  factory $InventoryInputCopyWith(
          InventoryInput value, $Res Function(InventoryInput) then) =
      _$InventoryInputCopyWithImpl<$Res, InventoryInput>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'window_days') int windowDays});
}

/// @nodoc
class _$InventoryInputCopyWithImpl<$Res, $Val extends InventoryInput>
    implements $InventoryInputCopyWith<$Res> {
  _$InventoryInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InventoryInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? windowDays = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      windowDays: null == windowDays
          ? _value.windowDays
          : windowDays // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryInputImplCopyWith<$Res>
    implements $InventoryInputCopyWith<$Res> {
  factory _$$InventoryInputImplCopyWith(_$InventoryInputImpl value,
          $Res Function(_$InventoryInputImpl) then) =
      __$$InventoryInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') int productId,
      @JsonKey(name: 'window_days') int windowDays});
}

/// @nodoc
class __$$InventoryInputImplCopyWithImpl<$Res>
    extends _$InventoryInputCopyWithImpl<$Res, _$InventoryInputImpl>
    implements _$$InventoryInputImplCopyWith<$Res> {
  __$$InventoryInputImplCopyWithImpl(
      _$InventoryInputImpl _value, $Res Function(_$InventoryInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of InventoryInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? windowDays = null,
  }) {
    return _then(_$InventoryInputImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      windowDays: null == windowDays
          ? _value.windowDays
          : windowDays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryInputImpl implements _InventoryInput {
  const _$InventoryInputImpl(
      {@JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'window_days') this.windowDays = 30});

  factory _$InventoryInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryInputImplFromJson(json);

  /// ID du produit à prédire
  @override
  @JsonKey(name: 'product_id')
  final int productId;

  /// Fenêtre de jours passés (par défaut : 30 jours)
  @override
  @JsonKey(name: 'window_days')
  final int windowDays;

  @override
  String toString() {
    return 'InventoryInput(productId: $productId, windowDays: $windowDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryInputImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.windowDays, windowDays) ||
                other.windowDays == windowDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productId, windowDays);

  /// Create a copy of InventoryInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryInputImplCopyWith<_$InventoryInputImpl> get copyWith =>
      __$$InventoryInputImplCopyWithImpl<_$InventoryInputImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryInputImplToJson(
      this,
    );
  }
}

abstract class _InventoryInput implements InventoryInput {
  const factory _InventoryInput(
          {@JsonKey(name: 'product_id') required final int productId,
          @JsonKey(name: 'window_days') final int windowDays}) =
      _$InventoryInputImpl;

  factory _InventoryInput.fromJson(Map<String, dynamic> json) =
      _$InventoryInputImpl.fromJson;

  /// ID du produit à prédire
  @override
  @JsonKey(name: 'product_id')
  int get productId;

  /// Fenêtre de jours passés (par défaut : 30 jours)
  @override
  @JsonKey(name: 'window_days')
  int get windowDays;

  /// Create a copy of InventoryInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InventoryInputImplCopyWith<_$InventoryInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
