import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/delivery.dart';


part 'paginated_delivery.freezed.dart';
part 'paginated_delivery.g.dart';

@freezed
class PaginatedDelivery with _$PaginatedDelivery {
  const factory PaginatedDelivery({
    required int count,
    String? next,
    String? previous,
    required List<Delivery> results,
  }) = _PaginatedDelivery;

  factory PaginatedDelivery.fromJson(Map<String, dynamic> json) =>
      _$PaginatedDeliveryFromJson(json);
}
