import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/invoice.dart';
import '../../pagination/paginated_invoice_list.dart';
import '../repositories/invoice_repository.dart';

class InvoiceNotifier extends StateNotifier<AsyncValue<PaginatedInvoiceList>> {
  final InvoiceRepository repository;

  InvoiceNotifier(this.repository) : super(const AsyncLoading()) {
    fetchInvoices();
  }

  Future<void> fetchInvoices({int page = 1}) async {
    state = const AsyncLoading();
    try {
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
