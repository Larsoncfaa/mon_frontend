import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_invoice_list.dart';
import '../../services/invoice_service.dart';
import '../notifications/invoice_notifier.dart';
import '../repositories/invoice_repository.dart';




final invoiceServiceProvider = Provider<InvoiceService>(
      (ref) => InvoiceService(ref.watch(dioProvider)),
);

final invoiceRepositoryProvider = Provider<InvoiceRepository>(
      (ref) => InvoiceRepository(ref.watch(invoiceServiceProvider)),
);

final invoiceNotifierProvider = StateNotifierProvider<InvoiceNotifier, AsyncValue<PaginatedInvoiceList>>(
      (ref) => InvoiceNotifier(ref.watch(invoiceRepositoryProvider)),
);
