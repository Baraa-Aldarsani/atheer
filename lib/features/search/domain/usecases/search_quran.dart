import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/core/usecases/usecase.dart';
import 'package:atheer/features/search/domain/entities/search_result.dart';
import 'package:atheer/features/search/domain/repositories/search_repository.dart';

class SearchQuran extends UseCase<List<SearchResult>, String> {
  final SearchRepository repository;

  SearchQuran(this.repository);

  @override
  Future<Either<Failure, List<SearchResult>>> call(String query) {
    return repository.searchQuran(query);
  }
}
