import 'package:drift/drift.dart';

class FavoritesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get ayahNumber => integer()();
  IntColumn get surahNumber => integer()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
