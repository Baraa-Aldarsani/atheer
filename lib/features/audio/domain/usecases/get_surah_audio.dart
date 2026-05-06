import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/core/usecases/usecase.dart';
import 'package:atheer/features/audio/domain/entities/audio_ayah.dart';
import 'package:atheer/features/audio/domain/repositories/audio_repository.dart';

class GetSurahAudio extends UseCase<List<AudioAyah>, SurahAudioParams> {
  final AudioRepository repository;

  GetSurahAudio(this.repository);

  @override
  Future<Either<Failure, List<AudioAyah>>> call(SurahAudioParams params) {
    return repository.getSurahAudio(params.surahNumber, params.reciterId);
  }
}

class SurahAudioParams {
  final int surahNumber;
  final String reciterId;

  const SurahAudioParams({required this.surahNumber, required this.reciterId});
}
