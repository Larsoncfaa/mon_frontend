import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_exchange_request_list.dart';
import '../../services/exchange_request_service.dart';
import '../notifications/exchange_request_notifier.dart';
import '../repositories/exchange_request_repository.dart';

/// Provider du service ExchangeRequestService
final exchangeRequestServiceProvider = Provider<ExchangeRequestService>(
      (ref) => ExchangeRequestService(ref.watch(dioProvider)),
);

/// Provider du repository ExchangeRequestRepository
final exchangeRequestRepositoryProvider = Provider<ExchangeRequestRepository>(
      (ref) => ExchangeRequestRepository(ref.watch(exchangeRequestServiceProvider)),
);

/// Provider du notifier ExchangeRequestNotifier
final exchangeRequestNotifierProvider = StateNotifierProvider<
    ExchangeRequestNotifier, AsyncValue<PaginatedExchangeRequestList>>(
      (ref) => ExchangeRequestNotifier(ref.watch(exchangeRequestRepositoryProvider)),
);
