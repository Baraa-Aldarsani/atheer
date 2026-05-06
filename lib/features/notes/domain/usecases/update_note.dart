import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/core/usecases/usecase.dart';
import 'package:atheer/features/notes/domain/repositories/notes_repository.dart';

class UpdateNote extends UseCase<void, UpdateNoteParams> {
  final NotesRepository repository;

  UpdateNote(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateNoteParams params) {
    return repository.updateNote(params.id, params.content);
  }
}

class UpdateNoteParams {
  final int id;
  final String content;

  const UpdateNoteParams({required this.id, required this.content});
}
