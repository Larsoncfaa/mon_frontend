import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_loyalty_program_list.dart';
import '../../services/loyalty_program_service.dart';
import '../repositories/loyalty_program_repository.dart';

/// 1. Service Provider
final loyaltyProgramServiceProvider = Provider<LoyaltyProgramService>((ref) {
  return LoyaltyProgramService(ref.watch(dioProvider));
});

/// 2. Repository Provider
final loyaltyProgramRepositoryProvider = Provider<LoyaltyProgramRepository>((ref) {
  return LoyaltyProgramRepository(ref.watch(loyaltyProgramServiceProvider));
});

/// Notifier moderne pour Riverpod 3.x
class LoyaltyProgramNotifier extends Notifier<AsyncValue<PaginatedLoyaltyProgramList>> {
  @override
  AsyncValue<PaginatedLoyaltyProgramList> build() {
    Future.microtask(() => fetchLoyaltyPrograms());
    return const AsyncValue.loading();
  }

  Future<void> fetchLoyaltyPrograms({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(loyaltyProgramRepositoryProvider);
      final result = await repository.fetchAll(page: page);
      state = AsyncData(result);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// 3. Notifier Provider principal
final loyaltyProgramNotifierProvider = NotifierProvider<
    LoyaltyProgramNotifier, AsyncValue<PaginatedLoyaltyProgramList>>(
  LoyaltyProgramNotifier.new,
);
