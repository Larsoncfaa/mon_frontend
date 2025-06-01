// repositories/sales_predict_repository.dart



import '../../models/sales_predict.dart';
import '../../services/sales_predict_service.dart';

class SalesPredictRepository {
  final SalesPredictService service;

  SalesPredictRepository(this.service);

  Future<List<SalesPredict>> fetchAll() => service.getAllSalesPredictions();

  Future<SalesPredict> fetchById(int id) => service.getSalesPrediction(id);

  Future<SalesPredict> create(SalesPredict data) =>
      service.createSalesPrediction(data);

  Future<SalesPredict> update(int id, SalesPredict data) =>
      service.updateSalesPrediction(id, data);

  Future<void> delete(int id) => service.deleteSalesPrediction(id);
}
