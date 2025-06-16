import 'package:dio/dio.dart';

import '../models/registration.dart';
import '../pagination/paginated_registration_list.dart';

class RegistrationService {
  final Dio dio;

  RegistrationService(this.dio);

  Future<PaginatedRegistrationList> getRegistrations({
    int page = 1,
    Map<String, dynamic>? filters,
  }) async {
    final response = await dio.get(
      '/registrations/',
      queryParameters: {'page': page, ...?filters},
    );
    return PaginatedRegistrationList.fromJson(response.data);
  }

  Future<Registration> getRegistration(String id) async {
    final response = await dio.get('/registrations/$id/');
    return Registration.fromJson(response.data);
  }

  Future<Registration> createRegistration(Registration registration) async {
    final response = await dio.post(
      '/registrations/',
      data: registration.toJson(),
    );
    return Registration.fromJson(response.data);
  }

  Future<Registration> updateRegistration(String id, Registration registration) async {
    final response = await dio.put(
      '/registrations/$id/',
      data: registration.toJson(),
    );
    return Registration.fromJson(response.data);
  }

  Future<void> deleteRegistration(String id) async {
    await dio.delete('/registrations/$id/');
  }
}
