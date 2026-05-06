import 'package:drift/drift.dart';

class NotesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get ayahNumber => integer()();
  IntColumn get surahNumber => integer()();
  TextColumn get content => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
