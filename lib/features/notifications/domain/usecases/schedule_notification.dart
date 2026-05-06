import 'package:atheer/features/notifications/domain/entities/notification_schedule.dart';
import 'package:atheer/features/notifications/domain/repositories/notification_repository.dart';

class ScheduleNotification {
  final NotificationRepository repository;

  ScheduleNotification(this.repository);

  Future<void> call(NotificationSchedule schedule) =>
      repository.scheduleNotification(schedule);
}
