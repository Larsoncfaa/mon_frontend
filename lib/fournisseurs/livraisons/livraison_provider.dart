// lib/fournisseurs/livraisons/livraison_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../donnees/livraison.dart';
import '../repositories/livraison_repository.dart';

final livraisonsProvider = FutureProvider<List<Livraison>>(
      (ref) => ref.read(livraisonRepositoryProvider).fetchAll(),
);