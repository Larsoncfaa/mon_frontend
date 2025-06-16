import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_proof_list.dart';
import '../../services/proof_service.dart';
import '../notifications/proof_notifier.dart';
import '../repositories/proof_repository.dart';

/// Service avec gestion d’erreur
final proofServiceProvider = Provider<ProofService>((ref) {
  try {
    return ProofService(ref.read(dioProvider));
  } catch (e) {
    throw Exception('Erreur lors de la création de ProofService: $e');
  }
});

/// Repository avec gestion d’erreur
final proofRepositoryProvider = Provider<ProofRepository>((ref) {
  try {
    return ProofRepository(ref.read(proofServiceProvider));
  } catch (e) {
    throw Exception('Erreur lors de la création de ProofRepository: $e');
  }
});

/// Notifier avec gestion d’erreur
final proofNotifierProvider =
StateNotifierProvider<ProofNotifier, AsyncValue<PaginatedProofList>>(
      (ref) {
    try {
      return ProofNotifier(ref.read(proofRepositoryProvider));
    } catch (e) {
      throw Exception('Erreur lors de la création de ProofNotifier: $e');
    }
  },
);
