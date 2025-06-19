import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery.freezed.dart';
part 'delivery.g.dart';

enum TypeEnum { LIVRAISON, STOCK, REMBOURSEMENT, AUTRE }

enum DeliveryStatusEnum { EN_ATTENTE, EN_COURS, TERMINEE }

// Décodeur robuste pour TypeEnum
TypeEnum _typeEnumFromJson(String? value) {
  switch (value) {
    case 'LIVRAISON':
      return TypeEnum.LIVRAISON;
    case 'STOCK':
      return TypeEnum.STOCK;
    case 'REMBOURSEMENT':
      return TypeEnum.REMBOURSEMENT;
    case 'AUTRE':
      return TypeEnum.AUTRE;
    default:
      return TypeEnum.AUTRE; // valeur par défaut si vide ou inconnue
  }
}

// Décodeur robuste pour DeliveryStatusEnum
DeliveryStatusEnum? _deliveryStatusEnumFromJson(String? value) {
  switch (value) {
    case 'EN_ATTENTE':
      return DeliveryStatusEnum.EN_ATTENTE;
    case 'EN_COURS':
      return DeliveryStatusEnum.EN_COURS;
    case 'TERMINEE':
      return DeliveryStatusEnum.TERMINEE;
    default:
      return null; // ou une valeur par défaut comme EN_ATTENTE si tu préfères
  }
}

@freezed
class Delivery with _$Delivery {
  const factory Delivery({
    required int id,
    int? deliverer,
    int? order,
    int? product,

    @JsonKey(name: 'type', fromJson: _typeEnumFromJson)
    required TypeEnum type,

    @JsonKey(name: 'delivery_status', fromJson: _deliveryStatusEnumFromJson)
    DeliveryStatusEnum? deliveryStatus,

    required String description,

    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    double? latitude,
    double? longitude,
  }) = _Delivery;

  factory Delivery.fromJson(Map<String, dynamic> json) =>
      _$DeliveryFromJson(json);
}
