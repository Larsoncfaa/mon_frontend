import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/promo_code.dart';
import '../repositories/promo_code_repository.dart';

class PromoCodeNotifier extends StateNotifier<AsyncValue<List<PromoCode>>> {
  final PromoCodeRepository repository;

  PromoCodeNotifier(this.repository) : super(const AsyncValue.loading()) {
    fetchPromoCodes();
  }

  Future<void> fetchPromoCodes({int page = 1}) async {
    try {
      final result = await repository.fetchPromoCodes(page: page);
      state = AsyncValue.data(result.results);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
