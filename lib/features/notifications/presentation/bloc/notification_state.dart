import 'package:equatable/equatable.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object?> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationScheduled extends NotificationState {
  final int hour;
  final int minute;
  final bool isEnabled;

  const NotificationScheduled({
    required this.hour,
    required this.minute,
    this.isEnabled = true,
  });

  @override
  List<Object?> get props => [hour, minute, isEnabled];
}
