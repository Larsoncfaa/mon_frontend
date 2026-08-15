import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../models/invoice.dart';
import '../../pagination/paginated_invoice_list.dart';
import '../../services/invoice_service.dart';
import '../repositories/invoice_repository.dart';

/// 1. Service Provider
final invoiceServiceProvider = Provider<InvoiceService>((ref) {
  return InvoiceService(ref.watch(dioProvider));
});

/// 2. Repository Provider
final invoiceRepositoryProvider = Provider<InvoiceRepository>((ref) {
  return InvoiceRepository(ref.watch(invoiceServiceProvider));
});

/// Notifier moderne pour Riverpod 3.x
class InvoiceNotifier extends Notifier<AsyncValue<PaginatedInvoiceList>> {
  @override
  AsyncValue<PaginatedInvoiceList> build() {
    Future.microtask(() => fetchInvoices());
    return const AsyncValue.loading();
  }

  Future<void> fetchInvoices({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(invoiceRepositoryProvider);
      final invoices = await repository.fetchInvoices(page: page);
      state = AsyncData(invoices);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> refresh() async {
    await fetchInvoices();
  }

  Future<void> createInvoice(Invoice newInvoice) async {
    try {
      final repository = ref.read(invoiceRepositoryProvider);
      final created = await repository.createInvoice(newInvoice);
      final previous = state.value;
      if (previous != null) {
        final updatedResults = [...previous.results, created];
        state = AsyncData(previous.copyWith(results: updatedResults));
      } else {
        await fetchInvoices();
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

/// 3. Notifier Provider principal
final invoiceNotifierProvider = NotifierProvider<
    InvoiceNotifier, AsyncValue<PaginatedInvoiceList>>(
  InvoiceNotifier.new,
);
