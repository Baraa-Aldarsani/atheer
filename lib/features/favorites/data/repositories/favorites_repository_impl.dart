import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/exceptions.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/features/favorites/domain/entities/favorite.dart';
import 'package:atheer/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:atheer/features/favorites/data/datasources/favorites_local_datasource.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesLocalDataSource localDataSource;

  FavoritesRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<Favorite>>> getFavorites() async {
    try {
      final favorites = await localDataSource.getAllFavorites();
      return Right(favorites);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> toggleFavorite(int ayahNumber, int surahNumber) async {
    try {
      final result = await localDataSource.toggleFavorite(ayahNumber, surahNumber);
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> isFavorite(int ayahNumber) async {
    try {
      final result = await localDataSource.isFavorite(ayahNumber);
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }
}
