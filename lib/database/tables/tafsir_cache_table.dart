import 'package:drift/drift.dart';

class TafsirCacheTable extends Table {
  IntColumn get ayahNumber => integer()();
  TextColumn get tafsirText => text()();
  TextColumn get edition => text()();
  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {ayahNumber, edition};
}
