import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/dio_provider.dart';
import '../../pagination/paginated_notification_list.dart';
import '../../services/notification_service.dart';
import '../notifications/notification_notifier.dart';
import '../repositories/notification_repository.dart';



// Service Provider
final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService(ref.watch(dioProvider));
});

// Repository Provider
final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return NotificationRepository(ref.watch(notificationServiceProvider));
});

// Notifier Provider
final notificationNotifierProvider = StateNotifierProvider<NotificationNotifier, AsyncValue<PaginatedNotificationList>>((ref) {
  return NotificationNotifier(ref.watch(notificationRepositoryProvider));
});
