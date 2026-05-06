import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/core/usecases/usecase.dart';
import 'package:atheer/features/notes/domain/repositories/notes_repository.dart';

class AddNote extends UseCase<int, AddNoteParams> {
  final NotesRepository repository;

  AddNote(this.repository);

  @override
  Future<Either<Failure, int>> call(AddNoteParams params) {
    return repository.addNote(params.ayahNumber, params.surahNumber, params.content);
  }
}

class AddNoteParams {
  final int ayahNumber;
  final int surahNumber;
  final String content;

  const AddNoteParams({
    required this.ayahNumber,
    required this.surahNumber,
    required this.content,
  });
}
