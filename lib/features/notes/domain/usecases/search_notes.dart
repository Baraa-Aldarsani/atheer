import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/core/usecases/usecase.dart';
import 'package:atheer/features/notes/domain/entities/note.dart';
import 'package:atheer/features/notes/domain/repositories/notes_repository.dart';

class SearchNotes extends UseCase<List<Note>, String> {
  final NotesRepository repository;

  SearchNotes(this.repository);

  @override
  Future<Either<Failure, List<Note>>> call(String query) {
    return repository.searchNotes(query);
  }
}
