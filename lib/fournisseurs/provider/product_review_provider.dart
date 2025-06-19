import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/product_review.dart';
import '../../services/product_review_service.dart';
import '../notifications/product_review_notifier.dart';
import '../repositories/product_review_repository.dart';

/// 🔌 Fournit le service qui gère les appels HTTP vers l’API
final productReviewServiceProvider = Provider<ProductReviewService>(
      (ref) => ProductReviewService(ref.watch(dioProvider)),
);

/// 📦 Fournit le dépôt qui encapsule la logique de récupération des données
final productReviewRepositoryProvider = Provider<ProductReviewRepository>(
      (ref) => ProductReviewRepository(ref.watch(productReviewServiceProvider)),
);

/// 🧠 Fournit le notifier qui gère l’état des avis produits (AsyncValue)
final productReviewNotifierProvider = StateNotifierProvider<ProductReviewNotifier, AsyncValue<List<ProductReview>>>(
      (ref) => ProductReviewNotifier(ref.watch(productReviewRepositoryProvider)),
);
