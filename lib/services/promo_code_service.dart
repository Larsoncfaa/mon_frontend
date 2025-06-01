import 'package:dio/dio.dart';
import '../models/promo_code.dart';
import '../pagination/paginated_promo_code_list.dart';

class PromoCodeService {
  final Dio dio;

  PromoCodeService(this.dio);

  Future<PaginatedPromoCodeList> fetchPromoCodes({int page = 1}) async {
    final response = await dio.get('/v1/promocodes/', queryParameters: {'page': page});
    return PaginatedPromoCodeList.fromJson(response.data);
  }

  Future<PromoCode> getPromoCode(int id) async {
    final response = await dio.get('/v1/promocodes/$id/');
    return PromoCode.fromJson(response.data);
  }

  Future<PromoCode> createPromoCode(PromoCode promoCode) async {
    final response = await dio.post('/v1/promocodes/', data: promoCode.toJson());
    return PromoCode.fromJson(response.data);
  }

  Future<PromoCode> updatePromoCode(int id, PromoCode promoCode) async {
    final response = await dio.put('/v1/promocodes/$id/', data: promoCode.toJson());
    return PromoCode.fromJson(response.data);
  }

  Future<void> deletePromoCode(int id) async {
    await dio.delete('/v1/promocodes/$id/');
  }
}
