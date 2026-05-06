// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tafsir_dao.dart';

// ignore_for_file: type=lint
mixin _$TafsirDaoMixin on DatabaseAccessor<AppDatabase> {
  $TafsirCacheTableTable get tafsirCacheTable =>
      attachedDatabase.tafsirCacheTable;
  TafsirDaoManager get managers => TafsirDaoManager(this);
}

class TafsirDaoManager {
  final _$TafsirDaoMixin _db;
  TafsirDaoManager(this._db);
  $$TafsirCacheTableTableTableManager get tafsirCacheTable =>
      $$TafsirCacheTableTableTableManager(
        _db.attachedDatabase,
        _db.tafsirCacheTable,
      );
}
