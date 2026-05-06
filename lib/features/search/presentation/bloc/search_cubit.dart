import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:atheer/features/search/domain/usecases/search_quran.dart';
import 'package:atheer/features/search/presentation/bloc/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchQuran searchQuran;
  final _searchController = StreamController<String>();

  SearchCubit({required this.searchQuran}) : super(SearchInitial()) {
    _searchController.stream
        .debounceTime(const Duration(milliseconds: 400))
        .distinct()
        .listen(_performSearch);
  }

  void onSearchChanged(String query) {
    _searchController.add(query);
  }

  Future<void> _performSearch(String query) async {
    if (query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());

    final result = await searchQuran(query);

    result.fold(
      (failure) => emit(SearchError(failure.message)),
      (results) {
        if (results.isEmpty) {
          emit(SearchEmpty(query));
        } else {
          emit(SearchLoaded(results: results, query: query));
        }
      },
    );
  }

  @override
  Future<void> close() {
    _searchController.close();
    return super.close();
  }
}
