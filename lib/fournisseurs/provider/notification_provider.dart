import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_notification_list.dart';
import '../../services/notification_service.dart';
import '../notifications/notification_notifier.dart';
import '../repositories/notification_repository.dart';

// 1. Service Provider
final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService(ref.watch(dioProvider));
});

// 2. Repository Provider
final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return NotificationRepository(ref.watch(notificationServiceProvider));
});

// 3. Notifier Provider (Riverpod 3.x)
final notificationNotifierProvider = NotifierProvider<NotificationNotifier,
    AsyncValue<PaginatedNotificationList>>(
  NotificationNotifier.new,
);