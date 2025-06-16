import 'package:freezed_annotation/freezed_annotation.dart';

part 'batch.freezed.dart';
part 'batch.g.dart';

@freezed
class Batch with _$Batch {
  const factory Batch({
    required int id,

    /// Identifiant du produit (clé JSON = "product", OK en camelCase)
    required int product,

    /// Numéro de lot (clé JSON = "lot_number" : CHARFIELD dans Django)
    @JsonKey(name: 'lot_number') required String lotNumber,

    /// Date d'expiration (clé JSON = "expiration_date" : DATEFIELD dans Django)
    @JsonKey(name: 'expiration_date') required DateTime expirationDate,
  }) = _Batch;

  factory Batch.fromJson(Map<String, dynamic> json) => _$BatchFromJson(json);
}
