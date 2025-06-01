

import '../../models/loyalty_program.dart';
import '../../pagination/paginated_loyalty_program_list.dart';
import '../../services/loyalty_program_service.dart';

class LoyaltyProgramRepository {
  final LoyaltyProgramService service;

  LoyaltyProgramRepository(this.service);

  Future<PaginatedLoyaltyProgramList> fetchAll({int page = 1}) {
    return service.getLoyaltyPrograms(page: page);
  }

  Future<LoyaltyProgram> fetchOne(int id) {
    return service.getLoyaltyProgram(id);
  }

  Future<LoyaltyProgram> create(LoyaltyProgram program) {
    return service.createLoyaltyProgram(program);
  }

  Future<LoyaltyProgram> update(int id, LoyaltyProgram program) {
    return service.updateLoyaltyProgram(id, program);
  }

  Future<void> delete(int id) {
    return service.deleteLoyaltyProgram(id);
  }
}
