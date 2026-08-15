import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/promo_code.dart';
import '../../services/promo_code_service.dart';
import '../repositories/promo_code_repository.dart';

/// 1. Service Provider
final promoCodeServiceProvider = Provider<PromoCodeService>((ref) {
  return PromoCodeService(ref.watch(dioProvider));
});

/// 2. Repository Provider
final promoCodeRepositoryProvider = Provider<PromoCodeRepository>((ref) {
  return PromoCodeRepository(ref.watch(promoCodeServiceProvider));
});

/// Notifier moderne pour Riverpod 3.x
class PromoCodeNotifier extends Notifier<AsyncValue<List<PromoCode>>> {
  @override
  AsyncValue<List<PromoCode>> build() {
    Future.microtask(() => fetchPromoCodes());
    return const AsyncValue.loading();
  }

  Future<void> fetchPromoCodes({int page = 1}) async {
    try {
      final repository = ref.read(promoCodeRepositoryProvider);
      final result = await repository.fetchPromoCodes(page: page);
      state = AsyncValue.data(result.results);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

/// 3. Notifier Provider principal
final promoCodeNotifierProvider = NotifierProvider<
    PromoCodeNotifier, AsyncValue<List<PromoCode>>>(
  PromoCodeNotifier.new,
);
