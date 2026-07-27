import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../pagination/paginated_loyalty_program_list.dart';
import '../repositories/loyalty_program_repository.dart';

// Provider du repository (à adapter selon ton projet)
final loyaltyProgramRepositoryProvider = Provider<LoyaltyProgramRepository>((ref) {
  throw UnimplementedError('Initialisez votre LoyaltyProgramRepository ici');
});

/// Notifier moderne pour Riverpod 3.x
class LoyaltyProgramNotifier extends Notifier<AsyncValue<PaginatedLoyaltyProgramList>> {
  late final LoyaltyProgramRepository _repository;

  @override
  AsyncValue<PaginatedLoyaltyProgramList> build() {
    _repository = ref.watch(loyaltyProgramRepositoryProvider);
    fetchLoyaltyPrograms();
    return const AsyncValue.loading();
  }

  Future<void> fetchLoyaltyPrograms({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final result = await _repository.fetchAll(page: page);
      state = AsyncData(result);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// Provider pour Riverpod 3.x
final loyaltyProgramNotifierProvider = NotifierProvider<
    LoyaltyProgramNotifier, AsyncValue<PaginatedLoyaltyProgramList>>(
  LoyaltyProgramNotifier.new,
);