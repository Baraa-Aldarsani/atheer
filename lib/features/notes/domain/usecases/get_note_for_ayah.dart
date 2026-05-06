import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/core/usecases/usecase.dart';
import 'package:atheer/features/notes/domain/entities/note.dart';
import 'package:atheer/features/notes/domain/repositories/notes_repository.dart';

class GetNoteForAyah extends UseCase<Note?, int> {
  final NotesRepository repository;

  GetNoteForAyah(this.repository);

  @override
  Future<Either<Failure, Note?>> call(int ayahNumber) {
    return repository.getNoteForAyah(ayahNumber);
  }
}
