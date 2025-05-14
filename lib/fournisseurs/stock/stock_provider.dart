// lib/fournisseurs/stock/stock_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../donnees/stock.dart';
import '../repositories/stock_repository.dart';

final stockLevelsProvider = FutureProvider<List<StockLevel>>(
      (ref) => ref.read(stockRepositoryProvider).fetchStockLevels(),
);

final stockMovementsProvider = FutureProvider.family<List<MouvementStock>, int>(
      (ref, produitId) => ref.read(stockRepositoryProvider).fetchMovements(produitId),
);