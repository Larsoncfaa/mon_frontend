import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/product_review.dart';
import '../../services/product_review_service.dart';
import '../notifications/product_review_notifier.dart';
import '../repositories/product_review_repository.dart';



// Service
final productReviewServiceProvider = Provider<ProductReviewService>(
      (ref) => ProductReviewService(ref.watch(dioProvider)),
);

// Repository
final productReviewRepositoryProvider = Provider<ProductReviewRepository>(
      (ref) => ProductReviewRepository(ref.watch(productReviewServiceProvider)),
);

// Notifier
final productReviewNotifierProvider = StateNotifierProvider<ProductReviewNotifier, AsyncValue<List<ProductReview>>>(
      (ref) => ProductReviewNotifier(ref.watch(productReviewRepositoryProvider)),
);
