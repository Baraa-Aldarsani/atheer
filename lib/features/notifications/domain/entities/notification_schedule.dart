import 'package:equatable/equatable.dart';

class NotificationSchedule extends Equatable {
  final int id;
  final String title;
  final String body;
  final int hour;
  final int minute;
  final bool isEnabled;

  const NotificationSchedule({
    required this.id,
    required this.title,
    required this.body,
    required this.hour,
    required this.minute,
    this.isEnabled = true,
  });

  @override
  List<Object> get props => [id, title, hour, minute, isEnabled];
}
