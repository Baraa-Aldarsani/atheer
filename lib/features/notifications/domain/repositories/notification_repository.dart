import 'package:atheer/features/notifications/domain/entities/notification_schedule.dart';

abstract class NotificationRepository {
  Future<void> scheduleNotification(NotificationSchedule schedule);
  Future<void> cancelNotification(int id);
  Future<void> cancelAllNotifications();
}
