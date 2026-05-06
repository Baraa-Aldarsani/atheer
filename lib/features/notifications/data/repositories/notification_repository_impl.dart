import 'package:atheer/features/notifications/domain/entities/notification_schedule.dart';
import 'package:atheer/features/notifications/domain/repositories/notification_repository.dart';
import 'package:atheer/features/notifications/data/datasources/notification_local_datasource.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationLocalDataSource localDataSource;

  NotificationRepositoryImpl(this.localDataSource);

  @override
  Future<void> scheduleNotification(NotificationSchedule schedule) =>
      localDataSource.scheduleDaily(schedule);

  @override
  Future<void> cancelNotification(int id) => localDataSource.cancel(id);

  @override
  Future<void> cancelAllNotifications() => localDataSource.cancelAll();
}
