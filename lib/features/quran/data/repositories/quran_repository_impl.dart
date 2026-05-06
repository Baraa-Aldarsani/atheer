import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/exceptions.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/core/network/network_info.dart';
import 'package:atheer/features/quran/domain/entities/surah.dart';
import 'package:atheer/features/quran/domain/entities/ayah.dart';
import 'package:atheer/features/quran/domain/repositories/quran_repository.dart';
import 'package:atheer/features/quran/data/datasources/quran_remote_datasource.dart';
import 'package:atheer/features/quran/data/datasources/quran_local_datasource.dart';

class QuranRepositoryImpl implements QuranRepository {
  final QuranRemoteDataSource remoteDataSource;
  final QuranLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  QuranRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Surah>>> getSurahs() async {
    try {
      // Try local first
      if (await localDataSource.hasCachedData()) {
        final localSurahs = await localDataSource.getAllSurahs();
        if (localSurahs.isNotEmpty) return Right(localSurahs);
      }

      // Fetch from remote
      if (await networkInfo.isConnected) {
        final remoteSurahs = await remoteDataSource.getAllSurahs();
        await localDataSource.cacheSurahs(remoteSurahs);
        return Right(remoteSurahs);
      }

      return const Left(NetworkFailure());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Ayah>>> getSurahAyahs(int surahNumber) async {
    try {
      // Try local first
      final localAyahs = await localDataSource.getAyahsBySurah(surahNumber);
      if (localAyahs.isNotEmpty) return Right(localAyahs);

      // Fetch from remote
      if (await networkInfo.isConnected) {
        final remoteAyahs = await remoteDataSource.getSurahAyahs(surahNumber);
        await localDataSource.cacheAyahs(remoteAyahs);
        return Right(remoteAyahs);
      }

      return const Left(NetworkFailure());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Ayah>>> getPageAyahs(int pageNumber) async {
    try {
      final localAyahs = await localDataSource.getAyahsByPage(pageNumber);
      if (localAyahs.isNotEmpty) return Right(localAyahs);

      if (await networkInfo.isConnected) {
        final remoteAyahs = await remoteDataSource.getPageAyahs(pageNumber);
        await localDataSource.cacheAyahs(remoteAyahs);
        return Right(remoteAyahs);
      }

      return const Left(NetworkFailure());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Ayah>>> getJuzAyahs(int juzNumber) async {
    try {
      final localAyahs = await localDataSource.getAyahsByJuz(juzNumber);
      if (localAyahs.isNotEmpty) return Right(localAyahs);

      if (await networkInfo.isConnected) {
        final remoteAyahs = await remoteDataSource.getJuzAyahs(juzNumber);
        await localDataSource.cacheAyahs(remoteAyahs);
        return Right(remoteAyahs);
      }

      return const Left(NetworkFailure());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Ayah>>> searchAyahs(String query) async {
    try {
      final results = await localDataSource.searchAyahs(query);
      return Right(results);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }
}
