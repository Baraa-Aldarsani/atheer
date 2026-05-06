import 'package:atheer/features/notifications/domain/repositories/notification_repository.dart';

class CancelNotification {
  final NotificationRepository repository;

  CancelNotification(this.repository);

  Future<void> call(int id) => repository.cancelNotification(id);
}
