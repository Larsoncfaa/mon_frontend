import 'package:dio/dio.dart';
import '../models/invoice.dart';
import '../pagination/paginated_invoice_list.dart';


class InvoiceService {
  final Dio dio;

  InvoiceService(this.dio);

  Future<PaginatedInvoiceList> getInvoices({int page = 1}) async {
    final response = await dio.get('/invoices/', queryParameters: {'page': page});
    return PaginatedInvoiceList.fromJson(response.data);
  }

  Future<Invoice> getInvoice(int id) async {
    final response = await dio.get('/invoices/$id/');
    return Invoice.fromJson(response.data);
  }

  Future<Invoice> createInvoice(Invoice invoice) async {
    final response = await dio.post('/invoices/', data: invoice.toJson());
    return Invoice.fromJson(response.data);
  }

  Future<Invoice> updateInvoice(int id, Invoice invoice) async {
    final response = await dio.put('/invoices/$id/', data: invoice.toJson());
    return Invoice.fromJson(response.data);
  }

  Future<void> deleteInvoice(int id) async {
    await dio.delete('/invoices/$id/');
  }
}
