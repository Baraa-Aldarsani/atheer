import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:atheer/features/notifications/domain/entities/notification_schedule.dart';

abstract class NotificationLocalDataSource {
  Future<void> initialize();
  Future<void> scheduleDaily(NotificationSchedule schedule);
  Future<void> cancel(int id);
  Future<void> cancelAll();
}

class NotificationLocalDataSourceImpl implements NotificationLocalDataSource {
  final FlutterLocalNotificationsPlugin plugin;

  NotificationLocalDataSourceImpl(this.plugin);

  @override
  Future<void> initialize() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );
    await plugin.initialize(settings);
  }

  @override
  Future<void> scheduleDaily(NotificationSchedule schedule) async {
    // Simplified: uses show() for demonstration
    // In production, use zonedSchedule with matchDateTimeComponents
    await plugin.show(
      schedule.id,
      schedule.title,
      schedule.body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'atheer_reminders',
          'Reading Reminders',
          channelDescription: 'Daily Quran reading reminders',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
    );
  }

  @override
  Future<void> cancel(int id) => plugin.cancel(id);

  @override
  Future<void> cancelAll() => plugin.cancelAll();
}
