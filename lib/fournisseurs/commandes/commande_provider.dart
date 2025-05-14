// lib/fournisseurs/commandes/commande_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../donnees/commande.dart';
import '../repositories/commande_repository.dart';

final commandesProvider = FutureProvider<List<Commande>>(
      (ref) => ref.read(commandeRepositoryProvider).fetchAll(),
);

final commandeProvider = FutureProvider.family<Commande, int>(
      (ref, id) => ref.read(commandeRepositoryProvider).fetchById(id),
);