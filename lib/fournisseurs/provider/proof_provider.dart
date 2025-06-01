import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_proof_list.dart';
import '../../services/proof_service.dart';
import '../notifications/proof_notifier.dart';
import '../repositories/proof_repository.dart';



// Service
final proofServiceProvider = Provider<ProofService>(
      (ref) => ProofService(ref.read(dioProvider)),
);

// Repository
final proofRepositoryProvider = Provider<ProofRepository>(
      (ref) => ProofRepository(ref.read(proofServiceProvider)),
);

// Notifier
final proofNotifierProvider = StateNotifierProvider<ProofNotifier, AsyncValue<PaginatedProofList>>(
      (ref) => ProofNotifier(ref.read(proofRepositoryProvider)),
);
