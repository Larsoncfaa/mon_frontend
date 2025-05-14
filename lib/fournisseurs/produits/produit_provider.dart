// lib/fournisseurs/produits/produit_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../donnees/produit.dart';
import '../repositories/produit_repository.dart';

final produitListProvider = FutureProvider<List<Produit>>(
      (ref) => ref.read(produitRepositoryProvider).fetchAll(),
);

final produitDetailsProvider = FutureProvider.family<Produit, int>(
      (ref, id) => ref.read(produitRepositoryProvider).fetchById(id),
);