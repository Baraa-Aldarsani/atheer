// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_dao.dart';

// ignore_for_file: type=lint
mixin _$FavoritesDaoMixin on DatabaseAccessor<AppDatabase> {
  $FavoritesTableTable get favoritesTable => attachedDatabase.favoritesTable;
  $SurahsTableTable get surahsTable => attachedDatabase.surahsTable;
  $AyahsTableTable get ayahsTable => attachedDatabase.ayahsTable;
  FavoritesDaoManager get managers => FavoritesDaoManager(this);
}

class FavoritesDaoManager {
  final _$FavoritesDaoMixin _db;
  FavoritesDaoManager(this._db);
  $$FavoritesTableTableTableManager get favoritesTable =>
      $$FavoritesTableTableTableManager(
        _db.attachedDatabase,
        _db.favoritesTable,
      );
  $$SurahsTableTableTableManager get surahsTable =>
      $$SurahsTableTableTableManager(_db.attachedDatabase, _db.surahsTable);
  $$AyahsTableTableTableManager get ayahsTable =>
      $$AyahsTableTableTableManager(_db.attachedDatabase, _db.ayahsTable);
}
