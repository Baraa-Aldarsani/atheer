import 'package:drift/drift.dart';
import 'package:atheer/database/app_database.dart';
import 'package:atheer/database/tables/favorites_table.dart';
import 'package:atheer/database/tables/surahs_table.dart';
import 'package:atheer/database/tables/ayahs_table.dart';

part 'favorites_dao.g.dart';

class FavoriteWithDetails {
  final FavoritesTableData favorite;
  final String? surahName;
  final String? ayahText;
  final int? numberInSurah;

  FavoriteWithDetails({
    required this.favorite,
    this.surahName,
    this.ayahText,
    this.numberInSurah,
  });
}

@DriftAccessor(tables: [FavoritesTable, SurahsTable, AyahsTable])
class FavoritesDao extends DatabaseAccessor<AppDatabase> with _$FavoritesDaoMixin {
  FavoritesDao(super.db);

  Future<List<FavoritesTableData>> getAllFavorites() =>
      (select(favoritesTable)..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).get();

  Future<List<FavoriteWithDetails>> getAllFavoritesWithDetails() async {
    final surahs = attachedDatabase.surahsTable;
    final ayahs = attachedDatabase.ayahsTable;
    final query = select(favoritesTable).join([
      leftOuterJoin(
        surahs,
        surahs.number.equalsExp(favoritesTable.surahNumber),
      ),
      leftOuterJoin(
        ayahs,
        ayahs.number.equalsExp(favoritesTable.ayahNumber),
      ),
    ])
      ..orderBy([OrderingTerm.desc(favoritesTable.createdAt)]);

    final rows = await query.get();
    return rows.map((row) {
      final fav = row.readTable(favoritesTable);
      final surah = row.readTableOrNull(surahs);
      final ayah = row.readTableOrNull(ayahs);
      return FavoriteWithDetails(
        favorite: fav,
        surahName: surah?.name,
        ayahText: ayah?.ayahTextUthmani ?? ayah?.ayahText,
        numberInSurah: ayah?.numberInSurah,
      );
    }).toList();
  }

  Future<FavoritesTableData?> getFavorite(int ayahNumber) =>
      (select(favoritesTable)..where((f) => f.ayahNumber.equals(ayahNumber)))
          .getSingleOrNull();

  Future<int> addFavorite(FavoritesTableCompanion favorite) =>
      into(favoritesTable).insert(favorite);

  Future<int> removeFavorite(int ayahNumber) =>
      (delete(favoritesTable)..where((f) => f.ayahNumber.equals(ayahNumber))).go();

  Future<bool> isFavorite(int ayahNumber) async {
    final result = await getFavorite(ayahNumber);
    return result != null;
  }
}
