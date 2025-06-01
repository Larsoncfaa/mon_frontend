import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_loyalty_program_list.dart';
import '../../services/loyalty_program_service.dart';
import '../notifications/loyalty_program_notifier.dart';
import '../repositories/loyalty_program_repository.dart';



final loyaltyProgramServiceProvider = Provider<LoyaltyProgramService>(
      (ref) => LoyaltyProgramService(ref.watch(dioProvider)),
);

final loyaltyProgramRepositoryProvider = Provider<LoyaltyProgramRepository>(
      (ref) => LoyaltyProgramRepository(ref.watch(loyaltyProgramServiceProvider)),
);

final loyaltyProgramNotifierProvider = StateNotifierProvider<LoyaltyProgramNotifier, AsyncValue<PaginatedLoyaltyProgramList>>(
      (ref) => LoyaltyProgramNotifier(ref.watch(loyaltyProgramRepositoryProvider)),
);
