import 'package:equatable/equatable.dart';
import 'package:atheer/features/favorites/domain/entities/favorite.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object?> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<Favorite> favorites;
  final Set<int> favoriteAyahNumbers;

  const FavoritesLoaded({required this.favorites, required this.favoriteAyahNumbers});

  @override
  List<Object?> get props => [favorites, favoriteAyahNumbers];
}

class FavoritesError extends FavoritesState {
  final String message;

  const FavoritesError(this.message);

  @override
  List<Object?> get props => [message];
}
