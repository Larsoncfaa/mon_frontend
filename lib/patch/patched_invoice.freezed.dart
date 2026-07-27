// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patched_invoice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PatchedInvoice {

 int? get id; int? get order;@JsonKey(name: 'issued_at') DateTime? get issuedAt;@JsonKey(name: 'pdf_file') String? get pdfFile;
/// Create a copy of PatchedInvoice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PatchedInvoiceCopyWith<PatchedInvoice> get copyWith => _$PatchedInvoiceCopyWithImpl<PatchedInvoice>(this as PatchedInvoice, _$identity);

  /// Serializes this PatchedInvoice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatchedInvoice&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.issuedAt, issuedAt) || other.issuedAt == issuedAt)&&(identical(other.pdfFile, pdfFile) || other.pdfFile == pdfFile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,issuedAt,pdfFile);

@override
String toString() {
  return 'PatchedInvoice(id: $id, order: $order, issuedAt: $issuedAt, pdfFile: $pdfFile)';
}


}

/// @nodoc
abstract mixin class $PatchedInvoiceCopyWith<$Res>  {
  factory $PatchedInvoiceCopyWith(PatchedInvoice value, $Res Function(PatchedInvoice) _then) = _$PatchedInvoiceCopyWithImpl;
@useResult
$Res call({
 int? id, int? order,@JsonKey(name: 'issued_at') DateTime? issuedAt,@JsonKey(name: 'pdf_file') String? pdfFile
});




}
/// @nodoc
class _$PatchedInvoiceCopyWithImpl<$Res>
    implements $PatchedInvoiceCopyWith<$Res> {
  _$PatchedInvoiceCopyWithImpl(this._self, this._then);

  final PatchedInvoice _self;
  final $Res Function(PatchedInvoice) _then;

/// Create a copy of PatchedInvoice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? order = freezed,Object? issuedAt = freezed,Object? pdfFile = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,issuedAt: freezed == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,pdfFile: freezed == pdfFile ? _self.pdfFile : pdfFile // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PatchedInvoice].
extension PatchedInvoicePatterns on PatchedInvoice {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PatchedInvoice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PatchedInvoice() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PatchedInvoice value)  $default,){
final _that = this;
switch (_that) {
case _PatchedInvoice():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PatchedInvoice value)?  $default,){
final _that = this;
switch (_that) {
case _PatchedInvoice() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? order, @JsonKey(name: 'issued_at')  DateTime? issuedAt, @JsonKey(name: 'pdf_file')  String? pdfFile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PatchedInvoice() when $default != null:
return $default(_that.id,_that.order,_that.issuedAt,_that.pdfFile);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? order, @JsonKey(name: 'issued_at')  DateTime? issuedAt, @JsonKey(name: 'pdf_file')  String? pdfFile)  $default,) {final _that = this;
switch (_that) {
case _PatchedInvoice():
return $default(_that.id,_that.order,_that.issuedAt,_that.pdfFile);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? order, @JsonKey(name: 'issued_at')  DateTime? issuedAt, @JsonKey(name: 'pdf_file')  String? pdfFile)?  $default,) {final _that = this;
switch (_that) {
case _PatchedInvoice() when $default != null:
return $default(_that.id,_that.order,_that.issuedAt,_that.pdfFile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PatchedInvoice implements PatchedInvoice {
  const _PatchedInvoice({this.id, this.order, @JsonKey(name: 'issued_at') this.issuedAt, @JsonKey(name: 'pdf_file') this.pdfFile});
  factory _PatchedInvoice.fromJson(Map<String, dynamic> json) => _$PatchedInvoiceFromJson(json);

@override final  int? id;
@override final  int? order;
@override@JsonKey(name: 'issued_at') final  DateTime? issuedAt;
@override@JsonKey(name: 'pdf_file') final  String? pdfFile;

/// Create a copy of PatchedInvoice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PatchedInvoiceCopyWith<_PatchedInvoice> get copyWith => __$PatchedInvoiceCopyWithImpl<_PatchedInvoice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PatchedInvoiceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatchedInvoice&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.issuedAt, issuedAt) || other.issuedAt == issuedAt)&&(identical(other.pdfFile, pdfFile) || other.pdfFile == pdfFile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,issuedAt,pdfFile);

@override
String toString() {
  return 'PatchedInvoice(id: $id, order: $order, issuedAt: $issuedAt, pdfFile: $pdfFile)';
}


}

/// @nodoc
abstract mixin class _$PatchedInvoiceCopyWith<$Res> implements $PatchedInvoiceCopyWith<$Res> {
  factory _$PatchedInvoiceCopyWith(_PatchedInvoice value, $Res Function(_PatchedInvoice) _then) = __$PatchedInvoiceCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? order,@JsonKey(name: 'issued_at') DateTime? issuedAt,@JsonKey(name: 'pdf_file') String? pdfFile
});




}
/// @nodoc
class __$PatchedInvoiceCopyWithImpl<$Res>
    implements _$PatchedInvoiceCopyWith<$Res> {
  __$PatchedInvoiceCopyWithImpl(this._self, this._then);

  final _PatchedInvoice _self;
  final $Res Function(_PatchedInvoice) _then;

/// Create a copy of PatchedInvoice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? order = freezed,Object? issuedAt = freezed,Object? pdfFile = freezed,}) {
  return _then(_PatchedInvoice(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,issuedAt: freezed == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,pdfFile: freezed == pdfFile ? _self.pdfFile : pdfFile // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
