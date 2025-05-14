// lib/fournisseurs/promotions/promotions_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../donnees/promotions.dart';
import '../repositories/promo_repository.dart';

final promotionsProvider = FutureProvider<List<CodePromo>>(
      (ref) => ref.read(promoRepositoryProvider).fetchCodes(),
);