import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atheer/features/quran/domain/entities/ayah.dart';
import 'package:atheer/features/quran/domain/usecases/get_page_ayahs.dart';
import 'package:atheer/features/quran/presentation/bloc/mushaf/mushaf_state.dart';

class MushafCubit extends Cubit<MushafState> {
  final GetPageAyahs getPageAyahs;

  static const int totalPages = 604;

  MushafCubit({required this.getPageAyahs}) : super(MushafInitial());

  Future<void> loadPage(int pageNumber) async {
    final currentState = state;
    Map<int, List<Ayah>> existingCache = {};

    if (currentState is MushafLoaded) {
      existingCache = Map.from(currentState.pageCache);
      if (existingCache.containsKey(pageNumber)) {
        emit(currentState.copyWith(currentPage: pageNumber));
        return;
      }
    } else {
      emit(MushafLoading());
    }

    final result = await getPageAyahs(pageNumber);

    result.fold(
      (failure) => emit(MushafError(failure.message)),
      (ayahs) {
        final newCache = Map<int, List<Ayah>>.from(existingCache);
        newCache[pageNumber] = ayahs;

        final double fontSize =
            currentState is MushafLoaded ? currentState.fontSize : 22.0;

        emit(MushafLoaded(
          currentPage: pageNumber,
          pageCache: newCache,
          fontSize: fontSize,
        ));
      },
    );
  }

  Future<void> preloadAdjacentPages(int currentPage) async {
    final pagesToLoad = <int>[];
    if (currentPage > 1) pagesToLoad.add(currentPage - 1);
    if (currentPage < totalPages) pagesToLoad.add(currentPage + 1);

    final currentState = state;
    if (currentState is! MushafLoaded) return;

    for (final page in pagesToLoad) {
      if (!currentState.pageCache.containsKey(page)) {
        final result = await getPageAyahs(page);
        result.fold(
          (_) {},
          (ayahs) {
            final s = state;
            if (s is MushafLoaded) {
              final newCache = Map<int, List<Ayah>>.from(s.pageCache);
              newCache[page] = ayahs;
              emit(s.copyWith(pageCache: newCache));
            }
          },
        );
      }
    }
  }

  void setFontSize(double size) {
    final currentState = state;
    if (currentState is MushafLoaded) {
      emit(currentState.copyWith(fontSize: size));
    }
  }

  void goToPage(int page) {
    if (page >= 1 && page <= totalPages) {
      loadPage(page);
    }
  }
}
