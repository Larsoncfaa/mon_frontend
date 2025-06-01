

import '../../models/invoice.dart';
import '../../pagination/paginated_invoice_list.dart';
import '../../services/invoice_service.dart';

class InvoiceRepository {
  final InvoiceService service;

  InvoiceRepository(this.service);

  Future<PaginatedInvoiceList> fetchInvoices({int page = 1}) {
    return service.getInvoices(page: page);
  }

  Future<Invoice> fetchInvoice(int id) {
    return service.getInvoice(id);
  }

  Future<Invoice> createInvoice(Invoice invoice) {
    return service.createInvoice(invoice);
  }

  Future<Invoice> updateInvoice(int id, Invoice invoice) {
    return service.updateInvoice(id, invoice);
  }

  Future<void> deleteInvoice(int id) {
    return service.deleteInvoice(id);
  }
}
