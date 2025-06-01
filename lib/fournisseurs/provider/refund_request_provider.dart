// providers/refund_request_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_provider.dart';
import '../../models/refund_request.dart';
import '../../services/refund_request_service.dart';
import '../notifications/refund_request_notifier.dart';
import '../repositories/refund_request_repository.dart';




// Service
final refundRequestServiceProvider = Provider<RefundRequestService>((ref) {
  final dio = ref.watch(dioProvider);
  return RefundRequestService(dio);
});

// Repository
final refundRequestRepositoryProvider = Provider<RefundRequestRepository>((ref) {
  final service = ref.watch(refundRequestServiceProvider);
  return RefundRequestRepository(service);
});

// Notifier
final refundRequestNotifierProvider =
StateNotifierProvider<RefundRequestNotifier, AsyncValue<List<RefundRequest>>>(
      (ref) {
    final repository = ref.watch(refundRequestRepositoryProvider);
    return RefundRequestNotifier(repository);
  },
);
