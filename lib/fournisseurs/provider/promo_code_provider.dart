import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/promo_code.dart';
import '../../services/promo_code_service.dart';
import '../notifications/promo_code_notifier.dart';
import '../repositories/promo_code_repository.dart';

/// 1. Service Provider
final promoCodeServiceProvider = Provider<PromoCodeService>((ref) {
  final dio = ref.watch(dioProvider);
  return PromoCodeService(dio);
});

/// 2. Repository Provider
final promoCodeRepositoryProvider = Provider<PromoCodeRepository>((ref) {
  final service = ref.watch(promoCodeServiceProvider);
  return PromoCodeRepository(service);
});

/// 3. Notifier Provider (Riverpod 3.x)
final promoCodeNotifierProvider =
NotifierProvider<PromoCodeNotifier, AsyncValue<List<PromoCode>>>(
  PromoCodeNotifier.new,
);