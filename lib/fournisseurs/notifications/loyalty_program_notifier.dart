import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../pagination/paginated_loyalty_program_list.dart';
import '../repositories/loyalty_program_repository.dart';

class LoyaltyProgramNotifier extends StateNotifier<AsyncValue<PaginatedLoyaltyProgramList>> {
  final LoyaltyProgramRepository repository;

  LoyaltyProgramNotifier(this.repository) : super(const AsyncLoading()) {
    fetchLoyaltyPrograms();
  }

  Future<void> fetchLoyaltyPrograms({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final result = await repository.fetchAll(page: page);
      state = AsyncData(result);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
