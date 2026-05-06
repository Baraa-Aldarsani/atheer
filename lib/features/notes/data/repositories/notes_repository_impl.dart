import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/exceptions.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/features/notes/domain/entities/note.dart';
import 'package:atheer/features/notes/domain/repositories/notes_repository.dart';
import 'package:atheer/features/notes/data/datasources/notes_local_datasource.dart';

class NotesRepositoryImpl implements NotesRepository {
  final NotesLocalDataSource localDataSource;

  NotesRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<Note>>> getAllNotes() async {
    try {
      return Right(await localDataSource.getAllNotes());
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Note?>> getNoteForAyah(int ayahNumber) async {
    try {
      return Right(await localDataSource.getNoteForAyah(ayahNumber));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Note>>> searchNotes(String query) async {
    try {
      return Right(await localDataSource.searchNotes(query));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, int>> addNote(int ayahNumber, int surahNumber, String content) async {
    try {
      return Right(await localDataSource.addNote(ayahNumber, surahNumber, content));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> updateNote(int id, String content) async {
    try {
      final note = await localDataSource.getNoteById(id);
      if (note != null) {
        await localDataSource.updateNote(id, content, note.ayahNumber, note.surahNumber, note.createdAt);
      }
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteNote(int id) async {
    try {
      await localDataSource.deleteNote(id);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }
}
