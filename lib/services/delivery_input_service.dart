import 'package:dio/dio.dart';

import '../models/delivery_input.dart';


class DeliveryInputService {
  final Dio dio;

  DeliveryInputService(this.dio);

  Future<void> createDeliveryInput(DeliveryInput input) async {
    await dio.post('/v1/deliveries/input/', data: input.toJson());
  }

  Future<void> updateDeliveryInput(int id, DeliveryInput input) async {
    await dio.put('/v1/deliveries/input/$id/', data: input.toJson());
  }
}
