import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../pagination/paginated_notification_list.dart';
import '../repositories/notification_repository.dart';

// Provider du repository (à adapter selon ton projet)
final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  throw UnimplementedError('Initialisez votre NotificationRepository ici');
});

/// Notifier moderne pour Riverpod 3.x
class NotificationNotifier extends Notifier<AsyncValue<PaginatedNotificationList>> {
  late final NotificationRepository _repository;

  @override
  AsyncValue<PaginatedNotificationList> build() {
    _repository = ref.watch(notificationRepositoryProvider);
    fetchAll();
    return const AsyncValue.loading();
  }

  Future<void> fetchAll({int page = 1}) async {
    state = const AsyncValue.loading();
    try {
      final result = await _repository.getAll(page: page);
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

/// Provider pour Riverpod 3.x
final notificationNotifierProvider = NotifierProvider<
    NotificationNotifier, AsyncValue<PaginatedNotificationList>>(
  NotificationNotifier.new,
);