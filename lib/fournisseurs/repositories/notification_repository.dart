

import '../../models/notification.dart';
import '../../pagination/paginated_notification_list.dart';
import '../../services/notification_service.dart';

class NotificationRepository {
  final NotificationService service;

  NotificationRepository(this.service);

  Future<PaginatedNotificationList> getAll({int page = 1}) {
    return service.fetchNotifications(page: page);
  }

  Future<Notification> getOne(int id) {
    return service.fetchNotification(id);
  }

  Future<Notification> create(Notification notification) {
    return service.createNotification(notification);
  }

  Future<Notification> update(int id, Notification notification) {
    return service.updateNotification(id, notification);
  }

  Future<void> delete(int id) {
    return service.deleteNotification(id);
  }
}
