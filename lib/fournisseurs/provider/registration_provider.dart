import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_registration_list.dart';
import '../../services/registration_service.dart';
import '../notifications/registration_notifier.dart';
import '../repositories/registration_repository.dart';


final registrationServiceProvider = Provider<RegistrationService>((ref) {
  final dio = ref.watch(dioProvider);
  return RegistrationService(dio);
});

final registrationRepositoryProvider = Provider<RegistrationRepository>((ref) {
  final service = ref.watch(registrationServiceProvider);
  return RegistrationRepository(service);
});

final registrationNotifierProvider =
StateNotifierProvider<RegistrationNotifier, AsyncValue<PaginatedRegistrationList>>((ref) {
  final repository = ref.watch(registrationRepositoryProvider);
  return RegistrationNotifier(repository);
});
