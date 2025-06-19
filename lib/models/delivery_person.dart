import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_person.freezed.dart';
part 'delivery_person.g.dart';

@freezed
class DeliveryPerson with _$DeliveryPerson {
  const factory DeliveryPerson({
    required int id,

    // ID du compte livreur
    required int user,

    // Nom complet du livreur (ex: "Ali Diarra")
    @JsonKey(name: 'user_name') required String userName,

    // ID de l'agriculteur
    required int agriculteur,

    // Nom complet de l'agriculteur
    @JsonKey(name: 'agriculteur_name') String? agriculteurName,

    // Téléphone
    required String phone,
  }) = _DeliveryPerson;

  factory DeliveryPerson.fromJson(Map<String, dynamic> json) =>
      _$DeliveryPersonFromJson(json);
}
