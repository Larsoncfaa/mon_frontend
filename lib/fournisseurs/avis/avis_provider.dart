// lib/fournisseurs/avis/avis_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../donnees/avis_fidelite.dart';
import '../repositories/avis_repository.dart';

final avisProvider = FutureProvider.family<List<AvisProduit>, int>(
      (ref, produitId) => ref.read(avisRepositoryProvider).fetchByProduit(produitId),
);