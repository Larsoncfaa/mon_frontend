import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_loyalty_program_list.dart';
import '../../services/loyalty_program_service.dart';
import '../notifications/loyalty_program_notifier.dart';
import '../repositories/loyalty_program_repository.dart';

/// 1. Service Provider
final loyaltyProgramServiceProvider = Provider<LoyaltyProgramService>(
      (ref) => LoyaltyProgramService(ref.watch(dioProvider)),
);

/// 2. Repository Provider
final loyaltyProgramRepositoryProvider = Provider<LoyaltyProgramRepository>(
      (ref) => LoyaltyProgramRepository(ref.watch(loyaltyProgramServiceProvider)),
);

/// 3. Notifier Provider (Riverpod 3.x)
final loyaltyProgramNotifierProvider = NotifierProvider<
    LoyaltyProgramNotifier, AsyncValue<PaginatedLoyaltyProgramList>>(
  LoyaltyProgramNotifier.new,
);