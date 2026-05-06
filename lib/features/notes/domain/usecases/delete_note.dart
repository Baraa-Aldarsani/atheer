import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/core/usecases/usecase.dart';
import 'package:atheer/features/notes/domain/repositories/notes_repository.dart';

class DeleteNote extends UseCase<void, int> {
  final NotesRepository repository;

  DeleteNote(this.repository);

  @override
  Future<Either<Failure, void>> call(int id) {
    return repository.deleteNote(id);
  }
}
