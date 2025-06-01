import 'package:dio/dio.dart';

import '../models/notification.dart';
import '../pagination/paginated_notification_list.dart';

class NotificationService {
  final Dio dio;

  NotificationService(this.dio);

  Future<PaginatedNotificationList> fetchNotifications({int page = 1}) async {
    final response = await dio.get('/v1/notifications/', queryParameters: {'page': page});
    return PaginatedNotificationList.fromJson(response.data);
  }

  Future<Notification> fetchNotification(int id) async {
    final response = await dio.get('/v1/notifications/$id/');
    return Notification.fromJson(response.data);
  }

  Future<Notification> createNotification(Notification notification) async {
    final response = await dio.post('/v1/notifications/', data: notification.toJson());
    return Notification.fromJson(response.data);
  }

  Future<Notification> updateNotification(int id, Notification notification) async {
    final response = await dio.put('/v1/notifications/$id/', data: notification.toJson());
    return Notification.fromJson(response.data);
  }

  Future<void> deleteNotification(int id) async {
    await dio.delete('/v1/notifications/$id/');
  }
}
