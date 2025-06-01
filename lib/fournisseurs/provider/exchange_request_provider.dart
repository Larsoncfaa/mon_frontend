import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_exchange_request_list.dart';
import '../../services/exchange_request_service.dart';
import '../notifications/exchange_request_notifier.dart';
import '../repositories/exchange_request_repository.dart';




// Service provider
final exchangeRequestServiceProvider = Provider<ExchangeRequestService>((ref) {
  return ExchangeRequestService(ref.watch(dioProvider));
});

// Repository provider
final exchangeRequestRepositoryProvider =
Provider<ExchangeRequestRepository>((ref) {
  return ExchangeRequestRepository(ref.watch(exchangeRequestServiceProvider));
});

// Notifier provider
final exchangeRequestNotifierProvider = StateNotifierProvider<
    ExchangeRequestNotifier, AsyncValue<PaginatedExchangeRequestList>>((ref) {
  return ExchangeRequestNotifier(ref.watch(exchangeRequestRepositoryProvider));
});
