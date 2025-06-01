import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_provider.dart';
import '../../models/promo_code.dart';
import '../../services/promo_code_service.dart';
import '../notifications/promo_code_notifier.dart';
import '../repositories/promo_code_repository.dart';


final promoCodeServiceProvider = Provider<PromoCodeService>((ref) {
  final dio = ref.watch(dioProvider);
  return PromoCodeService(dio);
});

final promoCodeRepositoryProvider = Provider<PromoCodeRepository>((ref) {
  final service = ref.watch(promoCodeServiceProvider);
  return PromoCodeRepository(service);
});

final promoCodeNotifierProvider =
StateNotifierProvider<PromoCodeNotifier, AsyncValue<List<PromoCode>>>((ref) {
  final repository = ref.watch(promoCodeRepositoryProvider);
  return PromoCodeNotifier(repository);
});
