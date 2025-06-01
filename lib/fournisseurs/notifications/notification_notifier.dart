import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../pagination/paginated_notification_list.dart';
import '../repositories/notification_repository.dart';

class NotificationNotifier extends StateNotifier<AsyncValue<PaginatedNotificationList>> {
  final NotificationRepository repository;

  NotificationNotifier(this.repository) : super(const AsyncValue.loading()) {
    fetchAll();
  }

  Future<void> fetchAll({int page = 1}) async {
    state = const AsyncValue.loading();
    try {
      final result = await repository.getAll(page: page);
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
