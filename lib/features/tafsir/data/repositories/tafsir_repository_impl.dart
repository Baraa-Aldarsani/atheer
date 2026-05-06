import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/exceptions.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/core/network/network_info.dart';
import 'package:atheer/features/tafsir/domain/entities/tafsir.dart';
import 'package:atheer/features/tafsir/domain/repositories/tafsir_repository.dart';
import 'package:atheer/features/tafsir/data/datasources/tafsir_remote_datasource.dart';
import 'package:atheer/features/tafsir/data/datasources/tafsir_local_datasource.dart';

class TafsirRepositoryImpl implements TafsirRepository {
  final TafsirRemoteDataSource remoteDataSource;
  final TafsirLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  TafsirRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Tafsir>> getAyahTafsir(int ayahNumber, {String edition = 'ar.muyassar'}) async {
    try {
      final cached = await localDataSource.getCachedTafsir(ayahNumber, edition);
      if (cached != null) return Right(cached);

      if (await networkInfo.isConnected) {
        final remote = await remoteDataSource.getAyahTafsir(ayahNumber, edition);
        await localDataSource.cacheTafsir(remote);
        return Right(remote);
      }

      return const Left(NetworkFailure());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }
}
