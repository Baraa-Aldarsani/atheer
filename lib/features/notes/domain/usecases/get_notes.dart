import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/core/usecases/usecase.dart';
import 'package:atheer/features/notes/domain/entities/note.dart';
import 'package:atheer/features/notes/domain/repositories/notes_repository.dart';

class GetNotes extends UseCase<List<Note>, NoParams> {
  final NotesRepository repository;

  GetNotes(this.repository);

  @override
  Future<Either<Failure, List<Note>>> call(NoParams params) {
    return repository.getAllNotes();
  }
}
