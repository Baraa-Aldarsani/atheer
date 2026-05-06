import 'package:drift/drift.dart';

class SurahsTable extends Table {
  IntColumn get number => integer()();
  TextColumn get name => text()();
  TextColumn get englishName => text()();
  TextColumn get englishNameTranslation => text()();
  IntColumn get numberOfAyahs => integer()();
  TextColumn get revelationType => text()();

  @override
  Set<Column> get primaryKey => {number};
}
