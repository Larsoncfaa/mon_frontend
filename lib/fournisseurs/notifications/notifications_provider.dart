
// lib/fournisseurs/notifications/notifications_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../donnees/notifications.dart';
import '../repositories/notification_repository.dart';

final notificationsProvider = FutureProvider<List<NotificationSysteme>>(
      (ref) => ref.read(notificationRepositoryProvider).fetchAll(),
);