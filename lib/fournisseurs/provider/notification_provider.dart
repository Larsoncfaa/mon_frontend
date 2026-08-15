import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_notification_list.dart';
import '../../services/notification_service.dart';
import '../repositories/notification_repository.dart';

/// 1. Service Provider
final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService(ref.watch(dioProvider));
});

/// 2. Repository Provider
final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return NotificationRepository(ref.watch(notificationServiceProvider));
});

/// Notifier moderne pour Riverpod 3.x
class NotificationNotifier extends Notifier<AsyncValue<PaginatedNotificationList>> {
  @override
  AsyncValue<PaginatedNotificationList> build() {
    Future.microtask(() => fetchAll());
    return const AsyncValue.loading();
  }

  Future<void> fetchAll({int page = 1}) async {
    state = const AsyncLoading();
    try {
      final repository = ref.read(notificationRepositoryProvider);
      final result = await repository.getAll(page: page);
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

/// 3. Notifier Provider principal
final notificationNotifierProvider = NotifierProvider<
    NotificationNotifier, AsyncValue<PaginatedNotificationList>>(
  NotificationNotifier.new,
);
