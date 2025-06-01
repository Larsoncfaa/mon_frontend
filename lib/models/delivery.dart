import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery.freezed.dart';
part 'delivery.g.dart';

enum TypeEnum { LIVRAISON, STOCK, REMBOURSEMENT, AUTRE }
enum DeliveryStatusEnum { EN_ATTENTE, EN_COURS, TERMINEE }

@freezed
class Delivery with _$Delivery {
  const factory Delivery({
    required int id,
    int? deliverer,
    required int order,
    int? product,
    required TypeEnum type,
    DeliveryStatusEnum? deliveryStatus,
    required String description,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Delivery;

  factory Delivery.fromJson(Map<String, dynamic> json) =>
      _$DeliveryFromJson(json);
}
