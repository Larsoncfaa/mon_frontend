import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/promo_code.dart';
import '../repositories/promo_code_repository.dart';

// Provider du repository (à adapter selon ton projet)
final promoCodeRepositoryProvider = Provider<PromoCodeRepository>((ref) {
  throw UnimplementedError('Initialisez votre PromoCodeRepository ici');
});

/// Notifier moderne pour Riverpod 3.x
class PromoCodeNotifier extends Notifier<AsyncValue<List<PromoCode>>> {
  late final PromoCodeRepository _repository;

  @override
  AsyncValue<List<PromoCode>> build() {
    _repository = ref.watch(promoCodeRepositoryProvider);
    fetchPromoCodes();
    return const AsyncValue.loading();
  }

  Future<void> fetchPromoCodes({int page = 1}) async {
    try {
      final result = await _repository.fetchPromoCodes(page: page);
      state = AsyncValue.data(result.results);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

/// Provider pour Riverpod 3.x
final promoCodeNotifierProvider = NotifierProvider<
    PromoCodeNotifier, AsyncValue<List<PromoCode>>>(
  PromoCodeNotifier.new,
);