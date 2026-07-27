import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_proof_list.dart';
import '../../services/proof_service.dart';
import '../notifications/proof_notifier.dart';
import '../repositories/proof_repository.dart';

/// 1. Service Provider
final proofServiceProvider = Provider<ProofService>((ref) {
  try {
    return ProofService(ref.watch(dioProvider));
  } catch (e) {
    throw Exception('Erreur lors de la création de ProofService: $e');
  }
});

/// 2. Repository Provider
final proofRepositoryProvider = Provider<ProofRepository>((ref) {
  try {
    return ProofRepository(ref.watch(proofServiceProvider));
  } catch (e) {
    throw Exception('Erreur lors de la création de ProofRepository: $e');
  }
});

/// 3. Notifier Provider (Riverpod 3.x)
final proofNotifierProvider =
NotifierProvider<ProofNotifier, AsyncValue<PaginatedProofList>>(
  ProofNotifier.new,
);