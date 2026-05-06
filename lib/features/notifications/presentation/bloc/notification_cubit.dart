import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atheer/features/notifications/domain/entities/notification_schedule.dart';
import 'package:atheer/features/notifications/domain/usecases/schedule_notification.dart';
import 'package:atheer/features/notifications/domain/usecases/cancel_notification.dart';
import 'package:atheer/features/notifications/presentation/bloc/notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final ScheduleNotification scheduleNotification;
  final CancelNotification cancelNotification;

  NotificationCubit({
    required this.scheduleNotification,
    required this.cancelNotification,
  }) : super(NotificationInitial());

  Future<void> setDailyReminder(int hour, int minute) async {
    final schedule = NotificationSchedule(
      id: 1,
      title: 'Atheer',
      body: 'حان وقت قراءة القرآن الكريم',
      hour: hour,
      minute: minute,
    );

    await scheduleNotification(schedule);
    emit(NotificationScheduled(hour: hour, minute: minute));
  }

  Future<void> cancelReminder() async {
    await cancelNotification(1);
    emit(NotificationInitial());
  }
}
