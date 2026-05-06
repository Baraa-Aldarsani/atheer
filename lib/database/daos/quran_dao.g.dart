// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_dao.dart';

// ignore_for_file: type=lint
mixin _$QuranDaoMixin on DatabaseAccessor<AppDatabase> {
  $SurahsTableTable get surahsTable => attachedDatabase.surahsTable;
  $AyahsTableTable get ayahsTable => attachedDatabase.ayahsTable;
  QuranDaoManager get managers => QuranDaoManager(this);
}

class QuranDaoManager {
  final _$QuranDaoMixin _db;
  QuranDaoManager(this._db);
  $$SurahsTableTableTableManager get surahsTable =>
      $$SurahsTableTableTableManager(_db.attachedDatabase, _db.surahsTable);
  $$AyahsTableTableTableManager get ayahsTable =>
      $$AyahsTableTableTableManager(_db.attachedDatabase, _db.ayahsTable);
}
