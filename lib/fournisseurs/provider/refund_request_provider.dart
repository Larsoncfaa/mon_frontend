import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/refund_request.dart';
import '../../services/refund_request_service.dart';
import '../notifications/refund_request_notifier.dart';
import '../repositories/refund_request_repository.dart';

/// 1. Provider du service RefundRequestService
final refundRequestServiceProvider = Provider<RefundRequestService>(
      (ref) => RefundRequestService(ref.watch(dioProvider)),
);

/// 2. Provider du repository RefundRequestRepository
final refundRequestRepositoryProvider = Provider<RefundRequestRepository>(
      (ref) => RefundRequestRepository(ref.watch(refundRequestServiceProvider)),
);

/// 3. Provider du notifier RefundRequestNotifier (Riverpod 3.x)
final refundRequestNotifierProvider =
NotifierProvider<RefundRequestNotifier, AsyncValue<List<RefundRequest>>>(
  RefundRequestNotifier.new,
);