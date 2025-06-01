

import '../../models/registration.dart';
import '../../pagination/paginated_registration_list.dart';
import '../../services/registration_service.dart';

class RegistrationRepository {
  final RegistrationService service;

  RegistrationRepository(this.service);

  Future<PaginatedRegistrationList> fetchAll({int page = 1}) {
    return service.getRegistrations(page: page);
  }

  Future<Registration> fetchOne(String id) {
    return service.getRegistration(id);
  }

  Future<Registration> create(Registration registration) {
    return service.createRegistration(registration);
  }

  Future<Registration> update(String id, Registration registration) {
    return service.updateRegistration(id, registration);
  }

  Future<void> delete(String id) {
    return service.deleteRegistration(id);
  }
}
