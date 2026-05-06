import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/features/audio/domain/entities/audio_ayah.dart';
import 'package:atheer/features/audio/domain/entities/reciter.dart';

abstract class AudioRepository {
  Future<Either<Failure, List<AudioAyah>>> getSurahAudio(int surahNumber, String reciterId);
  Future<Either<Failure, List<Reciter>>> getReciters();
}
