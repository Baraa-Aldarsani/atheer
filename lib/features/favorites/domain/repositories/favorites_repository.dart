import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/features/favorites/domain/entities/favorite.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, List<Favorite>>> getFavorites();
  Future<Either<Failure, bool>> toggleFavorite(int ayahNumber, int surahNumber);
  Future<Either<Failure, bool>> isFavorite(int ayahNumber);
}
