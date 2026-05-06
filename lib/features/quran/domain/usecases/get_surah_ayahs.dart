import 'package:dartz/dartz.dart';
import 'package:atheer/core/error/failures.dart';
import 'package:atheer/core/usecases/usecase.dart';
import 'package:atheer/features/quran/domain/entities/ayah.dart';
import 'package:atheer/features/quran/domain/repositories/quran_repository.dart';

class GetSurahAyahs extends UseCase<List<Ayah>, int> {
  final QuranRepository repository;

  GetSurahAyahs(this.repository);

  @override
  Future<Either<Failure, List<Ayah>>> call(int surahNumber) {
    return repository.getSurahAyahs(surahNumber);
  }
}
