// providers/sales_predict_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_provider.dart';
import '../../models/sales_predict.dart';
import '../../services/sales_predict_service.dart';
import '../notifications/sales_predict_notifier.dart';
import '../repositories/sales_predict_repository.dart';



final salesPredictServiceProvider = Provider<SalesPredictService>((ref) {
  final dio = ref.watch(dioProvider);
  return SalesPredictService(dio);
});

final salesPredictRepositoryProvider = Provider<SalesPredictRepository>((ref) {
  final service = ref.watch(salesPredictServiceProvider);
  return SalesPredictRepository(service);
});

final salesPredictNotifierProvider = StateNotifierProvider<SalesPredictNotifier,
    AsyncValue<List<SalesPredict>>>((ref) {
  final repository = ref.watch(salesPredictRepositoryProvider);
  return SalesPredictNotifier(repository);
});
