import 'package:dio/dio.dart';

import '../models/loyalty_program.dart';
import '../pagination/paginated_loyalty_program_list.dart';

class LoyaltyProgramService {
  final Dio dio;

  LoyaltyProgramService(this.dio);

  Future<PaginatedLoyaltyProgramList> getLoyaltyPrograms({int page = 1}) async {
    final response = await dio.get('/loyalty-programs/', queryParameters: {'page': page});
    return PaginatedLoyaltyProgramList.fromJson(response.data);
  }

  Future<LoyaltyProgram> getLoyaltyProgram(int id) async {
    final response = await dio.get('/loyalty-programs/$id/');
    return LoyaltyProgram.fromJson(response.data);
  }

  Future<LoyaltyProgram> createLoyaltyProgram(LoyaltyProgram program) async {
    final response = await dio.post('/loyalty-programs/', data: program.toJson());
    return LoyaltyProgram.fromJson(response.data);
  }

  Future<LoyaltyProgram> updateLoyaltyProgram(int id, LoyaltyProgram program) async {
    final response = await dio.put('/loyalty-programs/$id/', data: program.toJson());
    return LoyaltyProgram.fromJson(response.data);
  }

  Future<void> deleteLoyaltyProgram(int id) async {
    await dio.delete('/loyalty-programs/$id/');
  }
}
