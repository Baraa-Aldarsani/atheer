import 'package:equatable/equatable.dart';
import 'package:atheer/features/tafsir/domain/entities/tafsir.dart';
import 'package:atheer/features/notes/domain/entities/note.dart';

abstract class TafsirState extends Equatable {
  const TafsirState();

  @override
  List<Object?> get props => [];
}

class TafsirInitial extends TafsirState {}

class TafsirLoading extends TafsirState {}

class TafsirLoaded extends TafsirState {
  final Tafsir tafsir;
  final int ayahNumber;
  final int surahNumber;
  final String currentEdition;
  final Note? existingNote;

  const TafsirLoaded({
    required this.tafsir,
    required this.ayahNumber,
    required this.surahNumber,
    required this.currentEdition,
    this.existingNote,
  });

  TafsirLoaded copyWith({
    Tafsir? tafsir,
    String? currentEdition,
    Note? existingNote,
    bool clearNote = false,
  }) {
    return TafsirLoaded(
      tafsir: tafsir ?? this.tafsir,
      ayahNumber: ayahNumber,
      surahNumber: surahNumber,
      currentEdition: currentEdition ?? this.currentEdition,
      existingNote: clearNote ? null : (existingNote ?? this.existingNote),
    );
  }

  @override
  List<Object?> get props => [tafsir, ayahNumber, surahNumber, currentEdition, existingNote];
}

class TafsirError extends TafsirState {
  final String message;

  const TafsirError(this.message);

  @override
  List<Object?> get props => [message];
}
