import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_invoice_list.dart';
import '../../services/invoice_service.dart';
import '../notifications/invoice_notifier.dart';
import '../repositories/invoice_repository.dart';

/// 1. Service Provider
final invoiceServiceProvider = Provider<InvoiceService>(
      (ref) => InvoiceService(ref.watch(dioProvider)),
);

/// 2. Repository Provider
final invoiceRepositoryProvider = Provider<InvoiceRepository>(
      (ref) => InvoiceRepository(ref.watch(invoiceServiceProvider)),
);

/// 3. Notifier Provider (Riverpod 3.x)
final invoiceNotifierProvider = NotifierProvider<InvoiceNotifier,
    AsyncValue<PaginatedInvoiceList>>(
  InvoiceNotifier.new,
);