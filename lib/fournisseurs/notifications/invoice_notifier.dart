import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/invoice.dart';
import '../../pagination/paginated_invoice_list.dart';
import '../repositories/invoice_repository.dart';

// Provider du repository (à adapter selon la configuration de ton projet)
final invoiceRepositoryProvider = Provider<InvoiceRepository>((ref) {
  throw UnimplementedError('Initialisez votre InvoiceRepository ici');
});

/// Notifier moderne pour Riverpod 3.x
class InvoiceNotifier extends Notifier<AsyncValue<PaginatedInvoiceList>> {
  late final InvoiceRepository _repository;

  @override
  AsyncValue<PaginatedInvoiceList> build() {
    _repository = ref.watch(invoiceRepositoryProvider);
    fetchInvoices();
    return const AsyncValue.loading();
  }

  Future<void> fetchInvoices({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final invoices = await _repository.fetchInvoices(page: page);
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
      final created = await _repository.createInvoice(newInvoice);
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

/// Provider pour Riverpod 3.x
final invoiceNotifierProvider = NotifierProvider<
    InvoiceNotifier, AsyncValue<PaginatedInvoiceList>>(
  InvoiceNotifier.new,
);