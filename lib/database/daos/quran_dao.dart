import 'package:drift/drift.dart';
import 'package:atheer/core/extensions/arabic_text.dart';
import 'package:atheer/database/app_database.dart';
import 'package:atheer/database/tables/surahs_table.dart';
import 'package:atheer/database/tables/ayahs_table.dart';

part 'quran_dao.g.dart';

@DriftAccessor(tables: [SurahsTable, AyahsTable])
class QuranDao extends DatabaseAccessor<AppDatabase> with _$QuranDaoMixin {
  QuranDao(super.db);

  Future<List<SurahsTableData>> getAllSurahs() => select(surahsTable).get();

  Future<void> insertSurahs(List<SurahsTableCompanion> surahs) async {
    await batch((b) => b.insertAllOnConflictUpdate(surahsTable, surahs));
  }

  Future<List<AyahEntry>> getAyahsBySurah(int surahNumber) {
    return (select(ayahsTable)..where((a) => a.surahNumber.equals(surahNumber))).get();
  }

  Future<List<AyahEntry>> getAyahsByPage(int pageNumber) {
    return (select(ayahsTable)..where((a) => a.page.equals(pageNumber))).get();
  }

  Future<List<AyahEntry>> getAyahsByJuz(int juzNumber) {
    return (select(ayahsTable)..where((a) => a.juz.equals(juzNumber))).get();
  }

  Future<void> insertAyahs(List<AyahsTableCompanion> ayahs) async {
    await batch((b) => b.insertAllOnConflictUpdate(ayahsTable, ayahs));
  }

  Future<int> getSurahCount() async {
    final count = countAll();
    final query = selectOnly(surahsTable)..addColumns([count]);
    final result = await query.getSingle();
    return result.read(count) ?? 0;
  }

  Future<List<AyahEntry>> searchAyahs(String query) async {
    final normalizedQuery = ArabicText.normalize(query);
    if (normalizedQuery.isEmpty) return [];
    final all = await select(ayahsTable).get();
    return all.where((a) {
      return ArabicText.normalize(a.ayahText).contains(normalizedQuery) ||
          ArabicText.normalize(a.ayahTextUthmani ?? '').contains(normalizedQuery);
    }).toList();
  }
}
