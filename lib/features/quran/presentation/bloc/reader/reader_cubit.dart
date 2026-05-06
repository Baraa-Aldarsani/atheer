import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atheer/features/quran/domain/entities/surah.dart';
import 'package:atheer/features/quran/domain/usecases/get_surah_ayahs.dart';
import 'package:atheer/features/quran/presentation/bloc/reader/reader_state.dart';

class ReaderCubit extends Cubit<ReaderState> {
  final GetSurahAyahs getSurahAyahs;

  ReaderCubit({required this.getSurahAyahs}) : super(ReaderInitial());

  Future<void> loadSurah(int surahNumber, {Surah? surah}) async {
    emit(ReaderLoading());

    final result = await getSurahAyahs(surahNumber);

    result.fold(
      (failure) => emit(ReaderError(failure.message)),
      (ayahs) => emit(ReaderLoaded(ayahs: ayahs, surah: surah)),
    );
  }

  void setCurrentAyah(int index) {
    final currentState = state;
    if (currentState is ReaderLoaded) {
      emit(currentState.copyWith(currentAyahIndex: index));
    }
  }

  void setFontSize(double size) {
    final currentState = state;
    if (currentState is ReaderLoaded) {
      emit(currentState.copyWith(fontSize: size));
    }
  }
}
