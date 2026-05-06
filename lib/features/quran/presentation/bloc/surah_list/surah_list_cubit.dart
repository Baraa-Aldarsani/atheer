import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atheer/core/extensions/arabic_text.dart';
import 'package:atheer/core/usecases/usecase.dart';
import 'package:atheer/features/quran/domain/usecases/get_all_surahs.dart';
import 'package:atheer/features/quran/presentation/bloc/surah_list/surah_list_state.dart';

class SurahListCubit extends Cubit<SurahListState> {
  final GetAllSurahs getAllSurahs;

  SurahListCubit({required this.getAllSurahs}) : super(SurahListInitial());

  Future<void> loadSurahs() async {
    emit(SurahListLoading());

    final result = await getAllSurahs(const NoParams());

    result.fold(
      (failure) => emit(SurahListError(failure.message)),
      (surahs) => emit(SurahListLoaded(surahs: surahs)),
    );
  }

  void filterSurahs(String query) {
    final currentState = state;
    if (currentState is SurahListLoaded) {
      if (query.isEmpty) {
        emit(SurahListLoaded(surahs: currentState.surahs));
        return;
      }

      final normalizedQuery = ArabicText.normalize(query);
      final lowerQuery = query.toLowerCase();
      final filtered = currentState.surahs.where((surah) {
        return ArabicText.normalize(surah.name).contains(normalizedQuery) ||
            surah.englishName.toLowerCase().contains(lowerQuery) ||
            surah.number.toString() == query;
      }).toList();

      emit(SurahListLoaded(
        surahs: currentState.surahs,
        filteredSurahs: filtered,
        searchQuery: query,
      ));
    }
  }
}
