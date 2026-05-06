import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/features/notes/domain/entities/note.dart';

abstract class NotesRepository {
  Future<Either<Failure, List<Note>>> getAllNotes();
  Future<Either<Failure, Note?>> getNoteForAyah(int ayahNumber);
  Future<Either<Failure, List<Note>>> searchNotes(String query);
  Future<Either<Failure, int>> addNote(int ayahNumber, int surahNumber, String content);
  Future<Either<Failure, void>> updateNote(int id, String content);
  Future<Either<Failure, void>> deleteNote(int id);
}
