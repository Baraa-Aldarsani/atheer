import 'package:drift/drift.dart';
import 'package:atheer/database/app_database.dart';
import 'package:atheer/database/tables/tafsir_cache_table.dart';

part 'tafsir_dao.g.dart';

@DriftAccessor(tables: [TafsirCacheTable])
class TafsirDao extends DatabaseAccessor<AppDatabase> with _$TafsirDaoMixin {
  TafsirDao(super.db);

  Future<TafsirCacheTableData?> getTafsir(int ayahNumber, String edition) =>
      (select(tafsirCacheTable)
        ..where((t) => t.ayahNumber.equals(ayahNumber) & t.edition.equals(edition)))
          .getSingleOrNull();

  Future<void> cacheTafsir(TafsirCacheTableCompanion tafsir) =>
      into(tafsirCacheTable).insertOnConflictUpdate(tafsir);
}
