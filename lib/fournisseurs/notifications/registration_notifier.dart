import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../pagination/paginated_registration_list.dart';
import '../repositories/registration_repository.dart';

class RegistrationNotifier extends StateNotifier<AsyncValue<PaginatedRegistrationList>> {
  final RegistrationRepository repository;

  RegistrationNotifier(this.repository) : super(const AsyncValue.loading()) {
    fetchRegistrations();
  }

  Future<void> fetchRegistrations({int page = 1}) async {
    state = const AsyncValue.loading();
    try {
      final data = await repository.fetchAll(page: page);
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refresh() async {
    await fetchRegistrations();
  }
}
