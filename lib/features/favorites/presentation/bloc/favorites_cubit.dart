import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atheer/core/usecases/usecase.dart';
import 'package:atheer/features/favorites/domain/usecases/get_favorites.dart';
import 'package:atheer/features/favorites/domain/usecases/toggle_favorite.dart';
import 'package:atheer/features/favorites/presentation/bloc/favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final GetFavorites getFavorites;
  final ToggleFavorite toggleFavorite;

  FavoritesCubit({
    required this.getFavorites,
    required this.toggleFavorite,
  }) : super(FavoritesInitial());

  Future<void> loadFavorites() async {
    emit(FavoritesLoading());

    final result = await getFavorites(const NoParams());

    result.fold(
      (failure) => emit(FavoritesError(failure.message)),
      (favorites) => emit(FavoritesLoaded(
        favorites: favorites,
        favoriteAyahNumbers: favorites.map((f) => f.ayahNumber).toSet(),
      )),
    );
  }

  Future<void> toggle(int ayahNumber, int surahNumber) async {
    final result = await toggleFavorite(
      ToggleFavoriteParams(ayahNumber: ayahNumber, surahNumber: surahNumber),
    );

    result.fold(
      (failure) => null, // silently fail
      (_) => loadFavorites(), // reload
    );
  }

  bool isAyahFavorite(int ayahNumber) {
    final currentState = state;
    if (currentState is FavoritesLoaded) {
      return currentState.favoriteAyahNumbers.contains(ayahNumber);
    }
    return false;
  }
}
