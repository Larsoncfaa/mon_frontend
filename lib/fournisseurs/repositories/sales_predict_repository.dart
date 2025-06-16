// repositories/sales_predict_repository.dart

import '../../models/sales_predict.dart';
import '../../services/sales_predict_service.dart';

class SalesPredictRepository {
  final SalesPredictService service;

  SalesPredictRepository(this.service);

  // Récupérer toutes les prévisions de vente
  Future<List<SalesPredict>> fetchAll() => service.getAllSalesPredictions();

  // Récupérer une prévision de vente par ID
  Future<SalesPredict> fetchById(int id) => service.getSalesPrediction(id);

  // Créer une nouvelle prévision de vente
  Future<SalesPredict> create(SalesPredict data) => service.createSalesPrediction(data);

  // Mettre à jour une prévision de vente
  Future<SalesPredict> update(int id, SalesPredict data) => service.updateSalesPrediction(id, data);

  // Supprimer une prévision de vente
  Future<void> delete(int id) => service.deleteSalesPrediction(id);
}
