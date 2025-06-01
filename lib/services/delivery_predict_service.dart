import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:maliag/widgets/loading_widget.dart';

import '../models/delivery_predict.dart';


class DeliveryPredictService {
  final Dio _dio;

  DeliveryPredictService(this._dio);

  Future<DeliveryPredict> predictDelivery({
    required int productId,
    required int quantity,
  }) async {
    final response = await _dio.post(
      'v1/predict/delivery/',
      data: {
        'product_id': productId,
        'quantity': quantity,
      },
    );

    return DeliveryPredict.fromJson(response.data);
  }

  when({required Column Function(dynamic deliveries) data, required LoadingWidget Function() loading, required Function(dynamic e, dynamic _) error}) {}
}
