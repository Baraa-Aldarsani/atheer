import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/exceptions.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/database/daos/quran_dao.dart';
import 'package:atheer/features/search/domain/entities/search_result.dart';
import 'package:atheer/features/search/domain/repositories/search_repository.dart';
import 'package:atheer/features/search/data/datasources/search_local_datasource.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchLocalDataSource localDataSource;
  final QuranDao quranDao;

  SearchRepositoryImpl({required this.localDataSource, required this.quranDao});

  @override
  Future<Either<Failure, List<SearchResult>>> searchQuran(String query) async {
    try {
      if (query.trim().isEmpty) return const Right([]);
      final surahs = await quranDao.getAllSurahs();
      final results = await localDataSource.searchAyahs(query, surahs);
      return Right(results);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }
}
