import 'package:freezed_annotation/freezed_annotation.dart';

part 'batch.freezed.dart';
part 'batch.g.dart';

@freezed
class Batch with _$Batch {
  const factory Batch({
    required int id,
    required int product,
    @JsonKey(name: 'lot_number') required String lotNumber,
    @JsonKey(name: 'expiration_date') required DateTime expirationDate,
  }) = _Batch;

  factory Batch.fromJson(Map<String, dynamic> json) => _$BatchFromJson(json);
}
