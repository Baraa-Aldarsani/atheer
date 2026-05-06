import 'package:equatable/equatable.dart';
import 'package:atheer/features/quran/domain/entities/ayah.dart';
import 'package:atheer/features/quran/domain/entities/surah.dart';

abstract class ReaderState extends Equatable {
  const ReaderState();

  @override
  List<Object?> get props => [];
}

class ReaderInitial extends ReaderState {}

class ReaderLoading extends ReaderState {}

class ReaderLoaded extends ReaderState {
  final List<Ayah> ayahs;
  final Surah? surah;
  final int currentAyahIndex;
  final double fontSize;

  const ReaderLoaded({
    required this.ayahs,
    this.surah,
    this.currentAyahIndex = 0,
    this.fontSize = 24.0,
  });

  ReaderLoaded copyWith({
    List<Ayah>? ayahs,
    Surah? surah,
    int? currentAyahIndex,
    double? fontSize,
  }) {
    return ReaderLoaded(
      ayahs: ayahs ?? this.ayahs,
      surah: surah ?? this.surah,
      currentAyahIndex: currentAyahIndex ?? this.currentAyahIndex,
      fontSize: fontSize ?? this.fontSize,
    );
  }

  @override
  List<Object?> get props => [ayahs, surah, currentAyahIndex, fontSize];
}

class ReaderError extends ReaderState {
  final String message;

  const ReaderError(this.message);

  @override
  List<Object?> get props => [message];
}
