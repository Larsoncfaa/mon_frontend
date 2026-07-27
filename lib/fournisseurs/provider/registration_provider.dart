import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_registration_list.dart';
import '../../services/registration_service.dart';
import '../notifications/registration_notifier.dart';
import '../repositories/registration_repository.dart';

/// 1. Service Provider
final registrationServiceProvider = Provider<RegistrationService>((ref) {
  final dio = ref.watch(dioProvider);
  return RegistrationService(dio);
});

/// 2. Repository Provider
final registrationRepositoryProvider = Provider<RegistrationRepository>((ref) {
  final service = ref.watch(registrationServiceProvider);
  return RegistrationRepository(service);
});

/// 3. Notifier Provider (Riverpod 3.x)
final registrationNotifierProvider = NotifierProvider<
    RegistrationNotifier, AsyncValue<PaginatedRegistrationList>>(
  RegistrationNotifier.new,
);