import 'package:drift/drift.dart';

class AudioCacheTable extends Table {
  IntColumn get ayahNumber => integer()();
  TextColumn get audioUrl => text()();
  TextColumn get reciterId => text()();
  TextColumn get filePath => text().nullable()();
  BoolColumn get isDownloaded => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {ayahNumber, reciterId};
}
