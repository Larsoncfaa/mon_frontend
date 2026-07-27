import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_person.freezed.dart';
part 'delivery_person.g.dart';

@freezed
abstract class DeliveryPerson with _$DeliveryPerson {
  const factory DeliveryPerson({
    required int id,
    required int agriculteur,
    @JsonKey(name: 'agriculteur_name') required String agriculteurName,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String phone,
  }) = _DeliveryPerson;

  factory DeliveryPerson.fromJson(Map<String, dynamic> json) =>
      _$DeliveryPersonFromJson(json);
}
