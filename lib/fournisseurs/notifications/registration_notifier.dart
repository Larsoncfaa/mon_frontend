import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../pagination/paginated_registration_list.dart';
import '../repositories/registration_repository.dart';

// Provider du repository (à adapter selon la configuration de ton projet)
final registrationRepositoryProvider = Provider<RegistrationRepository>((ref) {
  throw UnimplementedError('Initialisez votre RegistrationRepository ici');
});

/// Notifier moderne pour Riverpod 3.x
class RegistrationNotifier extends Notifier<AsyncValue<PaginatedRegistrationList>> {
  late final RegistrationRepository _repository;

  @override
  AsyncValue<PaginatedRegistrationList> build() {
    _repository = ref.watch(registrationRepositoryProvider);
    fetchRegistrations();
    return const AsyncValue.loading();
  }

  Future<void> fetchRegistrations({int page = 1}) async {
    state = const AsyncValue.loading();
    try {
      final data = await _repository.fetchAll(page: page);
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refresh() async {
    await fetchRegistrations();
  }
}

/// Provider pour Riverpod 3.x
final registrationNotifierProvider = NotifierProvider<
    RegistrationNotifier, AsyncValue<PaginatedRegistrationList>>(
  RegistrationNotifier.new,
);