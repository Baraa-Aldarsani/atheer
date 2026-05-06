import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/exceptions.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/core/network/network_info.dart';
import 'package:atheer/features/audio/domain/entities/audio_ayah.dart';
import 'package:atheer/features/audio/domain/entities/reciter.dart';
import 'package:atheer/features/audio/domain/repositories/audio_repository.dart';
import 'package:atheer/features/audio/data/datasources/audio_remote_datasource.dart';

class AudioRepositoryImpl implements AudioRepository {
  final AudioRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AudioRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<AudioAyah>>> getSurahAudio(int surahNumber, String reciterId) async {
    try {
      if (await networkInfo.isConnected) {
        final audioAyahs = await remoteDataSource.getSurahAudio(surahNumber, reciterId);
        return Right(audioAyahs);
      }
      return const Left(NetworkFailure());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Reciter>>> getReciters() async {
    try {
      if (await networkInfo.isConnected) {
        final reciters = await remoteDataSource.getReciters();
        return Right(reciters);
      }
      return const Left(NetworkFailure());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
