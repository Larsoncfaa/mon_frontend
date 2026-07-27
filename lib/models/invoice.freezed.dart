// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Invoice {

 int get id; int get order;@JsonKey(name: 'issued_at') DateTime get issuedAt;@JsonKey(name: 'pdf_file') String? get pdfFile;
/// Create a copy of Invoice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceCopyWith<Invoice> get copyWith => _$InvoiceCopyWithImpl<Invoice>(this as Invoice, _$identity);

  /// Serializes this Invoice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Invoice&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.issuedAt, issuedAt) || other.issuedAt == issuedAt)&&(identical(other.pdfFile, pdfFile) || other.pdfFile == pdfFile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,issuedAt,pdfFile);

@override
String toString() {
  return 'Invoice(id: $id, order: $order, issuedAt: $issuedAt, pdfFile: $pdfFile)';
}


}

/// @nodoc
abstract mixin class $InvoiceCopyWith<$Res>  {
  factory $InvoiceCopyWith(Invoice value, $Res Function(Invoice) _then) = _$InvoiceCopyWithImpl;
@useResult
$Res call({
 int id, int order,@JsonKey(name: 'issued_at') DateTime issuedAt,@JsonKey(name: 'pdf_file') String? pdfFile
});




}
/// @nodoc
class _$InvoiceCopyWithImpl<$Res>
    implements $InvoiceCopyWith<$Res> {
  _$InvoiceCopyWithImpl(this._self, this._then);

  final Invoice _self;
  final $Res Function(Invoice) _then;

/// Create a copy of Invoice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? order = null,Object? issuedAt = null,Object? pdfFile = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,issuedAt: null == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as DateTime,pdfFile: freezed == pdfFile ? _self.pdfFile : pdfFile // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Invoice].
extension InvoicePatterns on Invoice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Invoice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Invoice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Invoice value)  $default,){
final _that = this;
switch (_that) {
case _Invoice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Invoice value)?  $default,){
final _that = this;
switch (_that) {
case _Invoice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int order, @JsonKey(name: 'issued_at')  DateTime issuedAt, @JsonKey(name: 'pdf_file')  String? pdfFile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Invoice() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int order, @JsonKey(name: 'issued_at')  DateTime issuedAt, @JsonKey(name: 'pdf_file')  String? pdfFile)  $default,) {final _that = this;
switch (_that) {
case _Invoice():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int order, @JsonKey(name: 'issued_at')  DateTime issuedAt, @JsonKey(name: 'pdf_file')  String? pdfFile)?  $default,) {final _that = this;
switch (_that) {
case _Invoice() when $default != null:
return $default(_that.id,_that.order,_that.issuedAt,_that.pdfFile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Invoice implements Invoice {
  const _Invoice({required this.id, required this.order, @JsonKey(name: 'issued_at') required this.issuedAt, @JsonKey(name: 'pdf_file') this.pdfFile});
  factory _Invoice.fromJson(Map<String, dynamic> json) => _$InvoiceFromJson(json);

@override final  int id;
@override final  int order;
@override@JsonKey(name: 'issued_at') final  DateTime issuedAt;
@override@JsonKey(name: 'pdf_file') final  String? pdfFile;

/// Create a copy of Invoice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceCopyWith<_Invoice> get copyWith => __$InvoiceCopyWithImpl<_Invoice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Invoice&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.issuedAt, issuedAt) || other.issuedAt == issuedAt)&&(identical(other.pdfFile, pdfFile) || other.pdfFile == pdfFile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,issuedAt,pdfFile);

@override
String toString() {
  return 'Invoice(id: $id, order: $order, issuedAt: $issuedAt, pdfFile: $pdfFile)';
}


}

/// @nodoc
abstract mixin class _$InvoiceCopyWith<$Res> implements $InvoiceCopyWith<$Res> {
  factory _$InvoiceCopyWith(_Invoice value, $Res Function(_Invoice) _then) = __$InvoiceCopyWithImpl;
@override @useResult
$Res call({
 int id, int order,@JsonKey(name: 'issued_at') DateTime issuedAt,@JsonKey(name: 'pdf_file') String? pdfFile
});




}
/// @nodoc
class __$InvoiceCopyWithImpl<$Res>
    implements _$InvoiceCopyWith<$Res> {
  __$InvoiceCopyWithImpl(this._self, this._then);

  final _Invoice _self;
  final $Res Function(_Invoice) _then;

/// Create a copy of Invoice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? issuedAt = null,Object? pdfFile = freezed,}) {
  return _then(_Invoice(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,issuedAt: null == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as DateTime,pdfFile: freezed == pdfFile ? _self.pdfFile : pdfFile // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
