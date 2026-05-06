import 'package:drift/drift.dart';
import 'package:atheer/core/error/exceptions.dart';
import 'package:atheer/database/daos/favorites_dao.dart';
import 'package:atheer/database/app_database.dart';
import 'package:atheer/features/favorites/domain/entities/favorite.dart';

abstract class FavoritesLocalDataSource {
  Future<List<Favorite>> getAllFavorites();
  Future<bool> toggleFavorite(int ayahNumber, int surahNumber);
  Future<bool> isFavorite(int ayahNumber);
}

class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  final FavoritesDao favoritesDao;

  FavoritesLocalDataSourceImpl(this.favoritesDao);

  @override
  Future<List<Favorite>> getAllFavorites() async {
    try {
      final results = await favoritesDao.getAllFavoritesWithDetails();
      return results.map((r) => Favorite(
        id: r.favorite.id,
        ayahNumber: r.favorite.ayahNumber,
        surahNumber: r.favorite.surahNumber,
        createdAt: r.favorite.createdAt,
        surahName: r.surahName,
        ayahText: r.ayahText,
        numberInSurah: r.numberInSurah,
      )).toList();
    } catch (e) {
      throw CacheException('Failed to get favorites: $e');
    }
  }

  @override
  Future<bool> toggleFavorite(int ayahNumber, int surahNumber) async {
    try {
      final existing = await favoritesDao.getFavorite(ayahNumber);
      if (existing != null) {
        await favoritesDao.removeFavorite(ayahNumber);
        return false; // removed
      } else {
        await favoritesDao.addFavorite(FavoritesTableCompanion(
          ayahNumber: Value(ayahNumber),
          surahNumber: Value(surahNumber),
        ));
        return true; // added
      }
    } catch (e) {
      throw CacheException('Failed to toggle favorite: $e');
    }
  }

  @override
  Future<bool> isFavorite(int ayahNumber) async {
    try {
      return await favoritesDao.isFavorite(ayahNumber);
    } catch (e) {
      throw CacheException('Failed to check favorite: $e');
    }
  }
}
