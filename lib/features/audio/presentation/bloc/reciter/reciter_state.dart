import 'package:equatable/equatable.dart';
import 'package:atheer/features/audio/domain/entities/reciter.dart';

abstract class ReciterState extends Equatable {
  const ReciterState();

  @override
  List<Object?> get props => [];
}

class ReciterInitial extends ReciterState {}

class ReciterLoading extends ReciterState {}

class ReciterLoaded extends ReciterState {
  final List<Reciter> reciters;
  final Reciter? selectedReciter;

  const ReciterLoaded({required this.reciters, this.selectedReciter});

  @override
  List<Object?> get props => [reciters, selectedReciter];
}

class ReciterError extends ReciterState {
  final String message;

  const ReciterError(this.message);

  @override
  List<Object?> get props => [message];
}
