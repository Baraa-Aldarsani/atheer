import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/features/search/domain/entities/search_result.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<SearchResult>>> searchQuran(String query);
}
