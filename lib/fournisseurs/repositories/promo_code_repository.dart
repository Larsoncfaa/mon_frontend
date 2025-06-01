

import '../../models/promo_code.dart';
import '../../pagination/paginated_promo_code_list.dart';
import '../../services/promo_code_service.dart';

class PromoCodeRepository {
  final PromoCodeService service;

  PromoCodeRepository(this.service);

  Future<PaginatedPromoCodeList> fetchPromoCodes({int page = 1}) {
    return service.fetchPromoCodes(page: page);
  }

  Future<PromoCode> getPromoCode(int id) {
    return service.getPromoCode(id);
  }

  Future<PromoCode> createPromoCode(PromoCode promoCode) {
    return service.createPromoCode(promoCode);
  }

  Future<PromoCode> updatePromoCode(int id, PromoCode promoCode) {
    return service.updatePromoCode(id, promoCode);
  }

  Future<void> deletePromoCode(int id) {
    return service.deletePromoCode(id);
  }
}
