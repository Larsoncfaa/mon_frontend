import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_registration_list.dart';
import '../../services/registration_service.dart';
import '../repositories/registration_repository.dart';

/// 1. Service Provider
final registrationServiceProvider = Provider<RegistrationService>((ref) {
  return RegistrationService(ref.watch(dioProvider));
});

/// 2. Repository Provider
final registrationRepositoryProvider = Provider<RegistrationRepository>((ref) {
  return RegistrationRepository(ref.watch(registrationServiceProvider));
});

/// Notifier moderne pour Riverpod 3.x
class RegistrationNotifier extends Notifier<AsyncValue<PaginatedRegistrationList>> {

  @override
  AsyncValue<PaginatedRegistrationList> build() {
    Future.microtask(() => fetchRegistrations());
    return const AsyncValue.loading();
  }

  Future<void> fetchRegistrations({int page = 1}) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(registrationRepositoryProvider);
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

/// 3. Notifier Provider principal
final registrationNotifierProvider = NotifierProvider<
    RegistrationNotifier, AsyncValue<PaginatedRegistrationList>>(
  RegistrationNotifier.new,
);
