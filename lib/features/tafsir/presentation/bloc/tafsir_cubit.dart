import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atheer/features/tafsir/domain/entities/tafsir_edition.dart';
import 'package:atheer/features/tafsir/domain/usecases/get_ayah_tafsir.dart';
import 'package:atheer/features/notes/domain/usecases/get_note_for_ayah.dart';
import 'package:atheer/features/tafsir/presentation/bloc/tafsir_state.dart';

class TafsirCubit extends Cubit<TafsirState> {
  final GetAyahTafsir getAyahTafsir;
  final GetNoteForAyah getNoteForAyah;

  int _currentAyah = 0;
  int _currentSurah = 0;
  String _currentEdition = TafsirEdition.muyassar.id;

  TafsirCubit({
    required this.getAyahTafsir,
    required this.getNoteForAyah,
  }) : super(TafsirInitial());

  Future<void> loadTafsir(int ayahNumber, {required int surahNumber, String? edition}) async {
    _currentAyah = ayahNumber;
    _currentSurah = surahNumber;
    if (edition != null) _currentEdition = edition;

    emit(TafsirLoading());

    final result = await getAyahTafsir(
      TafsirParams(ayahNumber: ayahNumber, edition: _currentEdition),
    );

    // Load existing note for this ayah
    final noteResult = await getNoteForAyah(ayahNumber);
    final existingNote = noteResult.fold((_) => null, (note) => note);

    result.fold(
      (failure) => emit(TafsirError(failure.message)),
      (tafsir) => emit(TafsirLoaded(
        tafsir: tafsir,
        ayahNumber: ayahNumber,
        surahNumber: surahNumber,
        currentEdition: _currentEdition,
        existingNote: existingNote,
      )),
    );
  }

  Future<void> switchEdition(String edition) async {
    _currentEdition = edition;
    if (_currentAyah > 0) {
      await loadTafsir(_currentAyah, surahNumber: _currentSurah, edition: edition);
    }
  }

  Future<void> refreshNote() async {
    final currentState = state;
    if (currentState is TafsirLoaded) {
      final noteResult = await getNoteForAyah(currentState.ayahNumber);
      final note = noteResult.fold((_) => null, (n) => n);
      emit(currentState.copyWith(existingNote: note, clearNote: note == null));
    }
  }
}
