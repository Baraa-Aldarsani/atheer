import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:atheer/core/constants/app_constants.dart';
import 'package:atheer/database/tables/surahs_table.dart';
import 'package:atheer/database/tables/ayahs_table.dart';
import 'package:atheer/database/tables/favorites_table.dart';
import 'package:atheer/database/tables/notes_table.dart';
import 'package:atheer/database/tables/tafsir_cache_table.dart';
import 'package:atheer/database/tables/audio_cache_table.dart';
import 'package:atheer/database/daos/quran_dao.dart';
import 'package:atheer/database/daos/favorites_dao.dart';
import 'package:atheer/database/daos/notes_dao.dart';
import 'package:atheer/database/daos/tafsir_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    SurahsTable,
    AyahsTable,
    FavoritesTable,
    NotesTable,
    TafsirCacheTable,
    AudioCacheTable,
  ],
  daos: [QuranDao, FavoritesDao, NotesDao, TafsirDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, AppConstants.databaseName));
      return NativeDatabase.createInBackground(file);
    });
  }
}
