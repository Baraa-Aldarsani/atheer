import 'package:drift/drift.dart';

@DataClassName('AyahEntry')
class AyahsTable extends Table {
  IntColumn get number => integer()();
  TextColumn get ayahText => text().named('ayah_text')();
  TextColumn get ayahTextUthmani => text().named('text_uthmani').nullable()();
  IntColumn get surahNumber => integer()();
  IntColumn get numberInSurah => integer()();
  IntColumn get juz => integer()();
  IntColumn get manzil => integer()();
  IntColumn get page => integer()();
  IntColumn get ruku => integer()();
  IntColumn get hizbQuarter => integer()();

  @override
  Set<Column> get primaryKey => {number};
}
